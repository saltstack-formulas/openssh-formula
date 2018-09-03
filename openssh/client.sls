{% from "openssh/map.jinja" import openssh with context %}

openssh_client:
  pkg.installed:
    - name: {{ openssh.client }}
    {% if openssh.client_version is defined %}
    - version: {{ openssh.client_version }}
    {% endif %}
