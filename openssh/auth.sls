include:
  - openssh
{%- from "openssh/map.jinja" import openssh with context -%}
{%- set openssh_pillar = pillar.get('openssh', {}) -%}
{%- set auth = openssh_pillar.get('auth', {}) -%}
{%- for user,keys in auth.items() -%}
  {%- for key in keys -%}
    {% if 'present' in key and key['present'] %}
{{ key['name'] }}:
  ssh_auth.present:
    - user: {{ user }}
      {%- if 'source' in key %}
    - source: {{ key['source'] }}
      {%- else %}
        {%- if 'enc' in key %}
    - enc: {{ key['enc'] }}
        {%- endif -%}
        {%- if 'comment' in key %}
    - comment: {{ key['comment'] }}
        {%- endif -%}
        {%- if 'options' in key %}
    - options: {{ key['options'] }}
        {%- endif -%}
      {%- endif %}
    - require:
      - service: {{ openssh.service }}
    {%- else %}
{{ key['name'] }}:
  ssh_auth.absent:
    - user: {{ user }}
      {%- if 'enc' in key %}
    - enc: {{ key['enc'] }}
      {%- endif -%}
      {%- if 'comment' in key %}
    - comment: {{ key['comment'] }}
      {%- endif -%}
      {%- if 'options' in key %}
    - options: {{ key['options'] }}
      {%- endif -%}
    {%- endif -%}
  {%- endfor -%}
{%- endfor -%}
