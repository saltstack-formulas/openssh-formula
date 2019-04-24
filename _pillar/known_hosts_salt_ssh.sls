#!py

import logging
import os.path
import re
import subprocess

cache = {}
ssh_key_pattern = re.compile("^[^ ]+ (ssh-.+)$")
log = logging.getLogger(__name__)

def config_dir():
    if '__master_opts__' in __opts__:
        # run started via salt-ssh
        return __opts__['__master_opts__']['config_dir']
    else:
        # run started via salt
        return __opts__['config_dir']

def cache_dir():
    if '__master_opts__' in __opts__:
        # run started via salt-ssh
        return __opts__['__master_opts__']['cachedir']
    else:
        # run started via salt
        return __opts__['cachedir']+'/../master'

def minions():
    if not 'minions' in cache:
        cache['minions'] = __salt__.slsutil.renderer(config_dir() + '/roster')
    return cache['minions']

def host_variants(minion):
    _variants = [minion]
    def add_port_variant(host):
        if 'port' in minions()[minion]:
            _variants.append("[{}]:{}".format(host, minions()[minion]['port']))
    add_port_variant(minion)
    if 'host' in minions()[minion]:
        host = minions()[minion]['host']
        _variants.append(host)
        add_port_variant(host)
    return _variants

def host_keys_from_known_hosts(minion, path):
    '''
    Fetches all host keys of the given minion.
    '''
    if not os.path.isfile(path):
        return []
    pubkeys = []
    def fill_pubkeys(host):
        for line in host_key_of(host, path).splitlines():
            match = ssh_key_pattern.search(line)
            if match:
              pubkeys.append(match.group(1))
    # Try the minion ID and its variants first
    for host in host_variants(minion):
        fill_pubkeys(host)
    # When no keys were found ...
    if not pubkeys:
        # ... fetch IP addresses via DNS and try them.
        for host in (salt['dig.A'](minion) + salt['dig.AAAA'](minion)):
            fill_pubkeys(host)
    # When not a single key was found anywhere:
    if not pubkeys:
        log.error("No SSH host key found for {}. "
                  "You may need to add it to {}.".format(minion, path))
    return "\n".join(pubkeys)

def host_key_of(host, path):
    cmd = ["ssh-keygen", "-H", "-F", host, "-f", path]
    call = subprocess.Popen(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    out, err = call.communicate()
    if err == '':
        return out
    else:
        log.error("{} failed:\nSTDERR: {}\nSTDOUT: {}".format(
            " ".join(cmd),
            err,
            out
        ))
        return ""

def host_keys(minion_id):
    # Get keys from trusted known_hosts file
    trusted_keys = host_keys_from_known_hosts(minion_id,
        config_dir()+'/known_hosts')
    if trusted_keys:
        return trusted_keys
    # Get keys from host key cache
    cache_file = "{}/known_hosts_salt_ssh/{}.pub".format(cache_dir(), minion_id)
    try:
        with open(cache_file, 'r') as f:
          return f.read()
    except IOError:
        return ''

def run():
    cache = {}  # clear the cache
    config = {
        'public_ssh_host_keys': {},
        'public_ssh_host_names': {}
    }
    for minion in minions().keys():
        config['public_ssh_host_keys'][minion] = host_keys(minion)
        config['public_ssh_host_names'][minion] = minion
    return {'openssh': {'known_hosts': {'salt_ssh': config}}}

# vim: ts=4:sw=4:syntax=python
