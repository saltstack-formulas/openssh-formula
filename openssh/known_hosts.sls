{% from "openssh/map.jinja" import openssh with context %}

ensure dig is available:
  pkg.installed:
    - name: {{ openssh.dig_pkg }}

manage ssh_known_hosts file:
  file.managed:
    - name: {{ openssh.ssh_known_hosts }}
    - source: salt://openssh/files/ssh_known_hosts
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: ensure dig is available
