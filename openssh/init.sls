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
    - position: 0
    - protocol: tcp
    - dport: 22 
    - jump: ACCEPT
    - match: state
    - connstate: NEW,ESTABLISHED
    - save: True
