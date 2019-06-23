{%- from "openssh/map.jinja" import openssh, sshd_config with context %}

include:
  - openssh

{%- if sshd_config %}
sshd_config-with-ini:
  {#- Convert any tabs to a single space to prevent false positives #}
  {#- Ref: https://github.com/saltstack-formulas/openssh-formula/issues/162 #}
  {%- set regex_search_for_tabs = '^(\w+)\t+(\w)' %}
  {%- if salt['file.contains_regex'](openssh.sshd_config, regex_search_for_tabs) %}
  file.replace:
    - name: {{ openssh.sshd_config }}
    - pattern: {{ regex_search_for_tabs }}
    - repl: '\1 \2'
    - show_changes: True
    - require_in:
      - ini_manage: sshd_config-with-ini
  {%- endif %}

  ini.options_present:
    - name: {{ openssh.sshd_config }}
    - separator: ' '
    - watch_in:
      - service: {{ openssh.service }}
    - sections:
        {%- for k,v in sshd_config.items() %}
        {{ k }}: '{{ v }}'
        {%- endfor %}
{%- endif %}
