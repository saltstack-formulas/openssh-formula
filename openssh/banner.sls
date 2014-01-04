{% from "openssh/map.jinja" import openssh with context %}

include:
  - openssh

sshd_banner:
  file.managed:
    - name: {{ openssh.banner }}
    - source: {{ openssh.banner_src }}
    - template: jinja
