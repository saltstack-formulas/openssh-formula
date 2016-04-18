{% from "openssh/map.jinja" import openssh with context %}

check for existing dig:
  cmd.run:
    - name: which dig

ensure dig is available:
  pkg.installed:
    - name: {{ openssh.dig_pkg }}
    - onfail:
      - cmd: check for existing dig

manage ssh_known_hosts file:
  file.managed:
    - name: {{ openssh.ssh_known_hosts }}
    - source: salt://openssh/files/ssh_known_hosts
    - template: jinja
    - user: root
    - group: {{ openssh.root_group }}
    - mode: 644
    - require:
      - pkg: ensure dig is available
