{% from "openssh/map.jinja" import openssh with context %}

include:
  - openssh

sshd_config:
  file.managed:
    - name: {{ openssh.sshd_config }}
    - source: {{ openssh.sshd_config_src }}
    - template: jinja
    - user: root
    - mode: 644
    - watch_in:
      - service: openssh

ssh_config:
  file.managed:
    - name: {{ openssh.ssh_config }}
    - source: {{ openssh.ssh_config_src }}
    - template: jinja
    - user: root
    - mode: 644

{% for keyType in ['ecdsa', 'dsa', 'rsa', 'ed25519'] %}
{% if salt['pillar.get']('openssh:generate_' ~ keyType ~ '_keys', False) %}
ssh_generate_host_{{ keyType }}_key:
  cmd.run:
    {%- if salt['pillar.get']('openssh:generate_' ~ keyType ~ '_size', False) %}
    {%- set keySize = salt['pillar.get']('openssh:generate_' ~ keyType ~ '_size', 4096) %}
    - name: ssh-keygen -t {{ keyType }} -b {{ keySize }} -N '' -f /etc/ssh/ssh_host_{{ keyType }}_key
    {%- else %}
    - name: ssh-keygen -t {{ keyType }} -N '' -f /etc/ssh/ssh_host_{{ keyType }}_key
    {%- endif %}
    - creates: /etc/ssh/ssh_host_{{ keyType }}_key
    - user: root

{% elif salt['pillar.get']('openssh:absent_' ~ keyType ~ '_keys', False) %}
ssh_host_{{ keyType }}_key:
  file.absent:
    - name: /etc/ssh/ssh_host_{{ keyType }}_key

ssh_host_{{ keyType }}_key.pub:
  file.absent:
    - name: /etc/ssh/ssh_host_{{ keyType }}_key.pub

{% elif salt['pillar.get']('openssh:provide_' ~ keyType ~ '_keys', False) %}
ssh_host_{{ keyType }}_key:
  file.managed:
    - name: /etc/ssh/ssh_host_{{ keyType }}_key
    - contents_pillar: 'openssh:{{ keyType }}:private_key'
    - user: root
    - mode: 600
    - require_in:
      - service: {{ openssh.service }}

ssh_host_{{ keyType }}_key.pub:
  file.managed:
    - name: /etc/ssh/ssh_host_{{ keyType }}_key.pub
    - contents_pillar: 'openssh:{{ keyType }}:public_key'
    - user: root
    - mode: 600
    - require_in:
      - service: {{ openssh.service }}
{% endif %}
{% endfor %}
