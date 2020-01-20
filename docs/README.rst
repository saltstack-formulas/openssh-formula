.. _readme:

openssh
=======
|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/openssh-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/openssh-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Install and configure an openssh server.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Available states
----------------

.. contents::
   :local:

``openssh``
^^^^^^^^^^^

Installs the ``openssh`` server package and service.

``openssh.auth``
^^^^^^^^^^^^^^^^

Manages SSH certificates for users.

``openssh.auth_map``
^^^^^^^^^^^^^^^^^^^^

Same functionality as openssh.auth but with a simplified Pillar syntax.
Plays nicely with `Pillarstack
<https://docs.saltstack.com/en/latest/ref/pillar/all/salt.pillar.stack.html>`_.

``openssh.banner``
^^^^^^^^^^^^^^^^^^

Installs a banner that users see when SSH-ing in.

``openssh.client``
^^^^^^^^^^^^^^^^^^

Installs the openssh client package.

``openssh.config``
^^^^^^^^^^^^^^^^^^

Installs the ssh daemon configuration file included in this formula
(under "openssh/files"). This configuration file is populated
by values from pillar. ``pillar.example`` results in the generation
of the default ``sshd_config`` file on Debian Wheezy.

It is highly recommended ``PermitRootLogin`` is added to pillar
so root login will be disabled.

``openssh.config_ini``
^^^^^^^^^^^^^^^^^^^^^^

Version of managing ``sshd_config`` that uses the 
`ini_managed.option_present <https://docs.saltstack.com/en/latest/ref/states/all/salt.states.ini_manage.html>`_
state module, so it enables to override only one or 
multiple values and keeping the defaults shipped by your 
distribution. 


``openssh.known_hosts``
^^^^^^^^^^^^^^^^^^^^^^^

Manages ``/etc/ssh/ssh_known_hosts`` and fills it with the
public SSH host keys of your minions (collected via the Salt mine)
and of hosts listed in you pillar data. It's possible to include
minions managed via ``salt-ssh`` by using the ``known_hosts_salt_ssh`` renderer.

You can restrict the set of minions
whose keys are listed by using the pillar data ``openssh:known_hosts:target``
and ``openssh:known_hosts:tgt_type`` (those fields map directly to the
corresponding attributes of the ``mine.get`` function).

The **Salt mine** is used to share the public SSH host keys, you must thus
configure it accordingly on all hosts that must export their keys. Two
mine functions are required, one that exports the keys (one key per line,
as they are stored in ``/etc/ssh/ssh_host_*_key.pub``) and one that defines
the public hostname that the keys are associated to. Here's the way to
setup those functions through pillar::

    # Required for openssh.known_hosts
    mine_functions:
      public_ssh_host_keys:
        mine_function: cmd.run
        cmd: cat /etc/ssh/ssh_host_*_key.pub
        python_shell: true
      public_ssh_hostname:
        mine_function: grains.get
        key: id

The above example assumes that the minion identifier is a valid DNS name
that can be used to connect to the host. If that's not the case, you might
want to use the ``fqdn`` grain instead of the ``id`` one. The above example
also uses the default mine function names used by this formula. If you have to
use other names, then you should indicate the names to use in pillar keys
``openssh:known_hosts:mine_keys_function`` and
``openssh:known_hosts:mine_hostname_function``.

You can also integrate alternate DNS names of the various hosts in
``/etc/ssh/ssh_known_hosts``. You just have to specify all the alternate DNS names as a
list in the ``openssh:known_hosts:aliases`` pillar key. Whenever the IPv4 or
IPv6 behind one of those DNS entries matches an IPv4 or IPv6 behind the
official hostname of a minion, the alternate DNS name will be associated to the
minion's public SSH host key.

To **include minions managed via salt-ssh** install the ``known_hosts_salt_ssh`` renderer::

    # in pillar.top:
    '*':
      - openssh.known_hosts_salt_ssh

    # In your salt/ directory:
    # Link the pillar file:
    mkdir pillar/openssh
    ln -s ../../formulas/openssh-formula/_pillar/known_hosts_salt_ssh.sls pillar/openssh/known_hosts_salt_ssh.sls

You'll find the cached pubkeys in Pillar ``openssh:known_hosts:salt_ssh``.

It's possible to define aliases for certain hosts::

    openssh:
      known_hosts:
        cache:
          public_ssh_host_names:
            minion.id:
              - minion.id
              - alias.of.minion.id

The cache is populated by applying ``openssh.gather_host_keys``
to the salt master::

    salt 'salt-master.example.test' state.apply openssh.gather_host_keys

The state tries to fetch the SSH host keys via ``salt-ssh``. It calls the command as user
``salt-master`` by default. The username can be changed via Pillar::

    openssh:
      known_hosts:
        cache:
          user: salt-master

Use a cronjob to populate a host key cache::

    # crontab -e -u salt-master
    0 1 * * * salt 'salt-master.example.test' state.apply openssh.gather_host_keys

If you must have the latest pubkeys, run the state before all others::

    # states/top.sls:
    base:
      salt:
        # slooooow!
        - openssh.gather_host_keys

You can also use a "golden" known hosts file. It overrides the keys fetched by the cronjob.
This lets you re-use the trust estabished in the salt-ssh user's known_hosts file::

    # In your salt/ directory: (Pillar expects the file here.)
    ln -s /home/salt-master/.ssh/known_hosts ./known_hosts

    # Test it:
    salt-ssh 'minion' pillar.get 'openssh:known_hosts:salt_ssh'

To add **public keys of hosts not among your minions** list them under the
pillar key ``openssh:known_hosts:static``::

    openssh:
      known_hosts:
        static:
          github.com: 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq[...]'
          gitlab.com: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABA[...]'

Pillar ``openssh:known_hosts:static`` overrides ``openssh:known_hosts:salt_ssh``.

To **include localhost** and local IP addresses (``127.0.0.1`` and ``::1``) use this Pillar::

    openssh:
      known_hosts:
        include_localhost: true

To prevent ever-changing IP addresses from being added to a host, use this::

    openssh:
      known_hosts:
        omit_ip_address:
          - my.host.tld

To completely disable adding IP addresses::

    openssh:
      known_hosts:
        omit_ip_address: true

``openssh.moduli``
^^^^^^^^^^^^^^^^^^

Manages the system wide ``/etc/ssh/moduli`` file.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``template`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

