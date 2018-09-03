{% from "openssh/map.jinja" import openssh with context %}

openssh:
  {% if openssh.server is defined %}
  pkg.installed:
    - name: {{ openssh.server }}
  {% if openssh.server_version is defined %}
    - version: {{ openssh.server_version }}
  {% endif %}
  {% endif %}
  {% if openssh.sshd_enable is sameas true %}
  service.running:
    - enable: {{ openssh.sshd_enable }}
    - name: {{ openssh.service }}
  {% if openssh.server is defined %}
    - require:
      - pkg: {{ openssh.server }}
  {% endif %}
  {% else %}
  service.dead:
    - enable: False
    - name: {{ openssh.service }}
  {% endif %}
