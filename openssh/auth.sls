{%- macro print_name(identifier, key) -%}
{%- if 'name' in key  %}
{{ key['name'] }}
{%- else %}
{{ identifier }}
{%- endif %}
{%- endmacro -%}

{%- macro print_ssh_auth(identifier, key) -%}
      {%- if 'user' in key  %}
    - user: {{ key['user'] }}
      {%- else %}
    - user: {{ identifier }}
      {%- endif %}
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
{%- endmacro -%}

include:
  - openssh
{%- from "openssh/map.jinja" import openssh, sshd_config with context -%}
{%- set auth = openssh.get('auth', {}) -%}
{%- for identifier,keys in auth.items() -%}
  {%- for key in keys -%}
    {% if 'present' in key and key['present'] %}
{{ print_name(identifier, key) }}:
  ssh_auth.present:
    {{ print_ssh_auth(identifier, key) }}
    {%- if sshd_config.get("AuthorizedKeysFile", None) %}
    - config: '{{ sshd_config['AuthorizedKeysFile'] }}'
    {% endif %}
    - require:
      - service: {{ openssh.service }}
    {%- else %}
{{ print_name(identifier, key) }}:
  ssh_auth.absent:
    {{ print_ssh_auth(identifier, key) }}
    {%- if sshd_config.get("AuthorizedKeysFile", None) %}
    - config: '{{ sshd_config['AuthorizedKeysFile'] }}'
    {% endif -%}
    {%- endif -%}
  {%- endfor -%}
{%- endfor -%}
