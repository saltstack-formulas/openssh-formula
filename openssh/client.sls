{% from "openssh/map.jinja" import openssh with context %}

openssh_client:
  pkg.installed:
    - name: {{ openssh.client }}
