{% from "openssh/map.jinja" import openssh with context %}

openssh:
  pkg.installed:
    - name: {{ openssh.server }}
  service.running:
    - enable: True
    - name: {{ openssh.service }}
    - require:
      - pkg: {{ openssh.server }}
