{% from "openssh/map.jinja" import openssh with context %}
{% set openssh_pillar = pillar.get('openssh', {}) %}
{% set listen_port = openssh_pillar.get('listen_port', '22') %}

sshd.iptables.input:
  iptables.insert:
    - table: filter
    - chain: INPUT
    - position: 1
    - match: state
    - connstate: NEW,ESTABLISHED
    - dport: {{ listen_port }}
    - proto: tcp
    - jump: ACCEPT
    - save: True

