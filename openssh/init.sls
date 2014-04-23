{% from "openssh/map.jinja" import openssh with context %}

openssh:
  pkg.installed:
    - name: {{ openssh.server }}
  service.running:
    - enable: True
    - name: {{ openssh.service }}
    - require:
      - pkg: {{ openssh.server }}
  iptables.insert:
    - table: filter
    - chain: INPUT
    - position: 1
    - match: state
    - connstate: NEW,ESTABLISHED
    - dport: 22
    - proto: tcp
    - jump: ACCEPT
    - save: True
