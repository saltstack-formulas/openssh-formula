{% from "openssh/map.jinja" import openssh with context %}

include:
  - openssh

sshd_banner:
  file.managed:
    - name: {{ openssh.banner }}
    {% if openssh.banner_string is defined %}
    - contents: |
        {{ openssh.banner_string }}
    {% else %}
    - source: {{ openssh.banner_src }}
    - template: jinja
    {% endif %}
