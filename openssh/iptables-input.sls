sshd.iptables.input:
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

