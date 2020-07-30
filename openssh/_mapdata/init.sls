# -*- coding: utf-8 -*-
# vim: ft=sls
---
{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import openssh with context %}
{%- from tplroot ~ "/map.jinja" import ssh_config with context %}
{%- from tplroot ~ "/map.jinja" import sshd_config with context %}

{%- set output_file = '/tmp/salt_mapdata_dump.yaml' %}
{%- set map = {
      'openssh': openssh,
      'ssh_config': ssh_config,
      'sshd_config': sshd_config,
    } %}

{%- do salt['log.debug']( map | yaml(False) ) %}

{{ tplroot }}-mapdata-dump:
  file.managed:
    - name: {{ output_file }}
    - source: salt://{{ tplroot }}/_mapdata/_mapdata.jinja
    - template: jinja
    - context:
        map: {{ map | yaml }}
