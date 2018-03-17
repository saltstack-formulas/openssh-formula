{% from "openssh/map.jinja" import openssh with context %}

include:
  - openssh

{% if salt['pillar.get']('sshd_config', False) %}
sshd_config-with-ini:
  ini.options_present:
    - name: {{ openssh.sshd_config }}
    - separator: ' '
    - watch_in:
      - service: {{ openssh.service }}
    - sections:
        {%- for k,v in salt['pillar.get']('sshd_config',{}).items() %}
        {{ k }}: '{{ v }}'
        {%- endfor %}
{% endif %}
