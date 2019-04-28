{% from "openssh/map.jinja" import openssh, sshd_config with context %}

include:
  - openssh

{% if sshd_config %}
sshd_config-with-ini:
  ini.options_present:
    - name: {{ openssh.sshd_config }}
    - separator: ' '
    - watch_in:
      - service: {{ openssh.service }}
    - sections:
        {%- for k,v in sshd_config.items() %}
        {{ k }}: '{{ v }}'
        {%- endfor %}
{% endif %}
