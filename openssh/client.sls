{% from "openssh/map.jinja" import mapdata with context %}
{%- set openssh = mapdata.openssh %}

openssh_client:
  pkg.installed:
    - name: {{ openssh.client }}
    {% if openssh.client_version is defined %}
    - version: {{ openssh.client_version }}
    {% endif %}
