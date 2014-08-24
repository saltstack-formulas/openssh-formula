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

{% for keyType in ['dsa', 'rsa'] %}
{% if salt['pillar.get']('openssh:provide_' ~ keyType ~ '_keys', False) %}
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