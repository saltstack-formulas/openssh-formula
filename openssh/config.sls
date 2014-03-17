{% from "openssh/map.jinja" import openssh with context %}

include:
  - openssh

sshd_config:
  file.managed:
    - name: {{ openssh.sshd_config }}
    - source: {{ openssh.sshd_config_src }}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - watch_in:
      - service: openssh

{% if salt['pillar.get']('openssh:provide_dsa_keys', False) %}
ssh_host_dsa_key:
  file.managed:
    - name: /etc/ssh/ssh_host_dsa_key
    - contents_pillar: 'openssh:dsa:private_key'
    - user: root
    - mode: 600
    - require_in:
      - service: {{ openssh.service }}

ssh_host_dsa_key.pub:
  file.managed:
    - name: /etc/ssh/ssh_host_dsa_key.pub
    - contents_pillar: 'openssh:dsa:public_key'
    - user: root
    - mode: 600
    - require_in:
      - service: {{ openssh.service }}
{% endif %}

{% if salt['pillar.get']('openssh:provide_rsa_keys', False) %}
ssh_host_rsa_key:
  file.managed:
    - name: /etc/ssh/ssh_host_rsa_key
    - contents_pillar: 'openssh:rsa:private_key'
    - user: root
    - mode: 600
    - require_in:
      - service: {{ openssh.service }}

ssh_host_rsa_key.pub:
  file.managed:
    - name: /etc/ssh/ssh_host_rsa_key.pub
    - contents_pillar: 'openssh:rsa:public_key'
    - user: root
    - mode: 600
    - require_in:
      - service: {{ openssh.service }}
{% endif %}
