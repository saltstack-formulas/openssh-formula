{% from "openssh/map.jinja" import openssh with context %}
{% set listen_port = salt['pillar.get']('openssh:listen_port', '22') %}

sshd.iptables.chain:
  iptables.chain_present:
    - name: sshd_input

#ideally this should be flushed in case the port changes so it will not accumulate ports:
sshd.iptables.input:
  iptables.insert:
    - table: filter
    - position: 1
    - chain: INPUT
    - jump: sshd_input

sshd.iptables.listenrule:
  iptables.insert:
    - table: filter
    - chain: sshd_input
    - position: 1
    - match: state
    - connstate: NEW,ESTABLISHED
    - dport: {{ listen_port }}
    - proto: tcp
    - jump: ACCEPT
    - save: True

