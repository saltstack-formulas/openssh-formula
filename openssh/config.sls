{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import openssh, ssh_config, sshd_config with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch %}


include:
  - openssh

{%- if sshd_config %}
sshd_config:
  file.managed:
    - name: {{ openssh.sshd_config }}
    {#- Preserve backward compatibility using the `if` below #}
    - source: {{ openssh.sshd_config_src if '://' in openssh.sshd_config_src
                 else files_switch( [openssh.sshd_config_src],
                                    'sshd_config'
              ) }}
    - template: jinja
    - user: {{ openssh.sshd_config_user }}
    - group: {{ openssh.sshd_config_group }}
    - mode: {{ openssh.sshd_config_mode }}
    - check_cmd: {{ openssh.sshd_binary }} -t -f
    {%- if openssh.sshd_config_backup  %}
    - backup: minion
    {%- endif %}
    - watch_in:
      - service: {{ openssh.service }}
{%- endif %}

{%- if ssh_config %}
ssh_config:
  file.managed:
    - name: {{ openssh.ssh_config }}
    {#- Preserve backward compatibility using the `if` below #}
    - source: {{ openssh.ssh_config_src if '://' in openssh.ssh_config_src
                 else files_switch( [openssh.ssh_config_src],
                                    'ssh_config'
              ) }}
    - template: jinja
    - user: {{ openssh.ssh_config_user }}
    - group: {{ openssh.ssh_config_group }}
    - mode: {{ openssh.ssh_config_mode }}
    {%- if openssh.ssh_config_backup  %}
    - backup: minion
    {%- endif %}
{%- endif %}

{%- for keyType in openssh['host_key_algos'].split(',') %}
{%-   set keyFile = "/etc/ssh/ssh_host_" ~ keyType ~ "_key" %}
{%-   set keySize = openssh.get('generate_' ~ keyType ~ '_size', False) %}
{%-   if openssh.get('provide_' ~ keyType ~ '_keys', False) %}
ssh_host_{{ keyType }}_key:
  file.managed:
    - name: {{ keyFile }}
    - contents_pillar: 'openssh:{{ keyType }}:private_key'
    - user: root
    - mode: 600
    {%- if sshd_config %}
    - require_in:
      - file: sshd_config
    {%- endif %}
    - watch_in:
      - service: {{ openssh.service }}

ssh_host_{{ keyType }}_key.pub:
  file.managed:
    - name: {{ keyFile }}.pub
    - contents_pillar: 'openssh:{{ keyType }}:public_key'
    - user: root
    - mode: 600
    {%- if sshd_config %}
    - require_in:
      - file: sshd_config
    {%- endif %}
    - watch_in:
      - service: {{ openssh.service }}
{%-   elif openssh.get('generate_' ~ keyType ~ '_keys', False) %}
{%-     if keySize and openssh.get('enforce_' ~ keyType ~ '_size', False) %}
ssh_remove_short_{{ keyType }}_key:
  cmd.run:
    - name: "rm -f {{ keyFile }} {{ keyFile }}.pub"
    - onlyif: "test -f {{ keyFile }}.pub && test `ssh-keygen -l -f {{ keyFile }}.pub 2>/dev/null | awk '{print $1}'` -lt {{ keySize }}"
    - require_in:
        - cmd: ssh_generate_host_{{ keyType }}_key
{%-     endif %}
ssh_generate_host_{{ keyType }}_key:
  cmd.run:
    {%- set keySizePart = "-b {}".format(keySize) if keySize else "" %}
    - name: "rm {{ keyFile }}*; ssh-keygen -t {{ keyType }} {{ keySizePart }} -N '' -f {{ keyFile }}"
    - unless: "test -s {{ keyFile }}"
    - runas: root
    {%- if sshd_config %}
    - require_in:
      - file: sshd_config
    {%- endif %}
    - watch_in:
      - service: {{ openssh.service }}

ssh_host_{{ keyType }}_key:  # set permissions
  file.managed:
    - name: {{ keyFile }}
    - replace: false
    - mode: '0600'
    - require:
      - cmd: ssh_generate_host_{{ keyType }}_key
    {%- if sshd_config %}
    - require_in:
      - file: sshd_config
    {%- endif %}

{%-   elif openssh.get('absent_' ~ keyType ~ '_keys', False) %}
ssh_host_{{ keyType }}_key:
  file.absent:
    - name: {{ keyFile }}
    - watch_in:
      - service: {{ openssh.service }}

ssh_host_{{ keyType }}_key.pub:
  file.absent:
    - name: {{ keyFile }}.pub
    - watch_in:
      - service: {{ openssh.service }}
{%-   endif %}
{%- endfor %}

{%- if sshd_config.get('UsePrivilegeSeparation', '')|lower == 'yes' %}
/var/run/sshd:
  file.directory:
    - user: root
    - mode: 755
    - require_in:
      - file: sshd_config
    - watch_in:
      - service: {{ openssh.service }}
{%- endif %}
