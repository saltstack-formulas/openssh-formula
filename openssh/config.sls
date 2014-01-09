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

