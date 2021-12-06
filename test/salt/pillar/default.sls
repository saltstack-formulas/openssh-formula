# -*- coding: utf-8 -*-
# vim: ft=yaml
---
# yamllint disable rule:line-length
# Using a stripped down version of both `sshd_config` and `ssh_config` here
# The values introduced by the initial commit are taken from the Travis
# instances themselves
# Care must be taken when modifying this, not to lock out Travis before the
# `kitchen verify` stage takes place, resulting in:
# ```
# $$$$$$ [SSH] connection failed, terminating (#<Net::SSH::AuthenticationFailed: Authentication failed for user kitchen@localhost>)
# >>>>>> ------Exception-------
# >>>>>> Class: Kitchen::ActionFailed
# >>>>>> Message: 1 actions failed.
# >>>>>>     Failed to complete #verify action: [Transport error, can't connect to 'ssh' backend: SSH session could not be established] on ...
# ```
# yamllint enable rule:line-length

sshd_config:
  ChallengeResponseAuthentication: 'no'
  X11Forwarding: 'yes'
  PrintMotd: 'no'
  AcceptEnv: "LANG LC_*"
  Subsystem: "sftp /usr/lib/openssh/sftp-server"
  {%- if grains.os != "OpenBSD" %}
  UsePAM: 'yes'
  {%- endif %}
  {#- Need this on various platforms to avoid the `kitchen verify` failure as mentioned above; see: #}
  {#- * https://gitlab.com/saltstack-formulas/infrastructure/salt-image-builder/-/commit/cb6781a2bba9 #}
  {%- if grains.os in ["Arch", "OpenBSD"] or grains.oscodename in ["openSUSE Tumbleweed"] %}
  PubkeyAcceptedAlgorithms: "+ssh-rsa"
  {%- endif %}

ssh_config:
  Hosts:
    '*':
      GSSAPIAuthentication: 'yes'
      HashKnownHosts: 'yes'
      SendEnv: 'LANG LC_*'


openssh:
  # Instead of adding a custom banner file you can set it in pillar
  banner_string: |
    Welcome to {{ grains['id'] }}!

  # Set installed package version
  server_version: latest
  client_version: latest

  # Controls if SSHD should be enabled/started
  sshd_enable: true
  auth:
    joe-valid-ssh-key-desktop:
      - user: joe
        present: true
        enc: ssh-rsa
        comment: main key - desktop
        source: salt://ssh_keys/joe.desktop.pub
    joe-valid-ssh-key-notebook:
      - user: joe
        present: true
        enc: ssh-rsa
        comment: main key - notebook
        source: salt://ssh_keys/joe.netbook.pub
    joe-non-valid-ssh-key:
      - user: joe
        present: false
        enc: ssh-rsa
        comment: obsolete key - removed
        source: salt://ssh_keys/joe.no-valid.pub
  # Maps users to source files
  # Designed to play nice with ext_pillar
  # salt.states.ssh_auth: If source is set, comment and enc will be ignored
  auth_map:
    personal_keys:  # store name
      source: salt://ssh_keys
      users:
        joe:
          joe.desktop: {}
          joe.netbook:
            options: []  # see salt.states.ssh_auth.present
          joe.no-valid:
            present: false

  generate_dsa_keys: false
  absent_dsa_keys: false
  provide_dsa_keys: false
  dsa:
    private_key: |
      -----BEGIN DSA PRIVATE KEY-----
      NOT_DEFINED
      -----END DSA PRIVATE KEY-----
    public_key: |
      ssh-dss NOT_DEFINED

  generate_ecdsa_keys: false
  absent_ecdsa_keys: false
  provide_ecdsa_keys: false
  ecdsa:
    private_key: |
      -----BEGIN EC PRIVATE KEY-----
      NOT_DEFINED
      -----END EC PRIVATE KEY-----
    public_key: |
      ecdsa-sha2-nistp256 NOT_DEFINED

  generate_rsa_keys: false
  generate_rsa_size: 4096
  # Will remove the old key if it is to short and generate a new one.
  enforce_rsa_size: false
  absent_rsa_keys: false
  provide_rsa_keys: false
  rsa:
    private_key: |
      -----BEGIN RSA PRIVATE KEY-----
      NOT_DEFINED
      -----END RSA PRIVATE KEY-----
    public_key: |
      ssh-rsa NOT_DEFINED

  generate_ed25519_keys: false
  absent_ed25519_keys: false
  provide_ed25519_keys: false
  ed25519:
    private_key: |
      -----BEGIN OPENSSH PRIVATE KEY-----
      NOT_DEFINED
      -----END OPENSSH PRIVATE KEY-----
    public_key: |
      ssh-ed25519 NOT_DEFINED

  known_hosts:
    # The next 2 settings restrict the set of minions that will be added in
    # the generated ssh_known_hosts files (the default is to match all minions)
    target: '*'
    tgt_type: 'glob'
    # Name of mining functions used to gather public keys and hostnames
    # (the default values are shown here)
    mine_keys_function: public_ssh_host_keys
    mine_hostname_function: public_ssh_hostname
    # List of DNS entries also pointing to our managed machines and that we want
    # to inject in our generated ssh_known_hosts file
    aliases:
      - cname-to-minion.example.org
      - alias.example.org
    # Includes short hostnames derived from the FQDN
    # (host.example.test -> host)
    # (Deactivated by default, because there can be collisions!)
    hostnames: false
    # hostnames:
    # Restrict wich hosts you want to use via their hostname
    # (i.e. ssh user@host instead of ssh user@host.example.com)
    #  target: '*'  # Defaults to "*.{{ grains['domain']}}"
    #  tgt_type: 'glob'
    # To activate the defaults you can just set an empty dict.
    # hostnames: {}
    # Include localhost, 127.0.0.1 and ::1 (default: false)
    include_localhost: false
    # Host keys fetched via salt-ssh
    salt_ssh:
      # The salt-ssh user
      user: salt-master
      # specify public host names of a minion
      public_ssh_host_names:
        minion.id:
          - minion.id
          - alias.of.minion.id
      # specify public host keys of a minion
      public_ssh_host_keys:
        minion.id: |
          ssh-rsa [...]
          ssh-ed25519 [...]
    # Here you can list keys for hosts which are not among your minions:
    static:
      github.com: 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGm[...]'
      gitlab.com: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bN[...]'
    omit_ip_address:
      - github.com

  # specify DH parameters (see /etc/ssh/moduli)
  # yamllint disable rule:line-length
  moduli: |
    # Time Type Tests Tries Size Generator Modulus
    20120821045639 2 6 100 2047 2 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C604293680B09D63
    20120821045830 2 6 100 2047 2 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C6042936814C2FFB
    20120821050046 2 6 100 2047 2 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C60429368214FC53
    20120821050054 2 6 100 2047 5 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C60429368218E83F
  # yamllint enable rule:line-length
  # ALTERNATIVELY, specify the location of the moduli file. Examples:
  # moduli_source: http://some.server.somewhere/salt/moduli
  # moduli_source: salt://files/ssh/moduli
  # If moduli is specified, moduli_source will be ignored.
  # Also, a proper hash file *must* be included in the same path. E.g.:
  #     http://some.server.somewhere/salt/moduli.hash
  #     salt://files/ssh/moduli.hash
  # These will be automatically referenced to by the ssh_moduli state.

  tofs:
    # The files_switch key serves as a selector for alternative
    # directories under the formula files directory. See TOFS pattern
    # doc for more info.
    # Note: Any value not evaluated by `config.get` will be used literally.
    # This can be used to set custom paths, as many levels deep as required.
    # files_switch:
    #   - any/path/can/be/used/here
    #   - id
    #   - role
    #   - osfinger
    #   - os
    #   - os_family
    # All aspects of path/file resolution are customisable using the options below.
    # This is unnecessary in most cases; there are sensible defaults.
    # path_prefix: template_alt
    # dirs:
    #   files: files_alt
    #   default: default_alt
    source_files:
      manage ssh_known_hosts file:
        - alt_ssh_known_hosts
      sshd_config:
        - alt_sshd_config
      ssh_config:
        - alt_ssh_config
      sshd_banner:
        - fire_banner

# Required for openssh.known_hosts
mine_functions:
  public_ssh_host_keys:
    mine_function: cmd.run
    cmd: cat /etc/ssh/ssh_host_*_key.pub
    python_shell: true
  public_ssh_hostname:
    mine_function: grains.get
    key: id
