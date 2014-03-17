{% from "openssh/map.jinja" import openssh with context %}

openssh:
  pkg.installed:
    - name: {{ openssh.server }}
  service.running:
    - enable: True
    - name: {{ openssh.service }}
    - require:
      - pkg: {{ openssh.server }}
      {% if salt['pillar.get']('openssh:provide_dsa_keys', False) %}
      - file: /etc/ssh/ssh_host_dsa_key
      - file: /etc/ssh/ssh_host_dsa_key.pub
      {% endif %}
      {% if salt['pillar.get']('openssh:provide_rsa_keys', False) %}
      - file: /etc/ssh/ssh_host_rsa_key
      - file: /etc/ssh/ssh_host_rsa_key.pub
      {% endif %}

{% if salt['pillar.get']('openssh:provide_dsa_keys', False) %}
ssh_host_dsa_key:
  file.managed:
    - name: /etc/ssh/ssh_host_dsa_key
    - contents_pillar: 'openssh:dsa:private_key'
    - user: root
    - mode: 600

ssh_host_dsa_key.pub:
  file.managed:
    - name: /etc/ssh/ssh_host_dsa_key.pub
    - contents_pillar: 'openssh:dsa:public_key'
    - user: root
    - mode: 600
{% endif %}

{% if salt['pillar.get']('openssh:provide_rsa_keys', False) %}
ssh_host_rsa_key:
  file.managed:
    - name: /etc/ssh/ssh_host_rsa_key
    - contents_pillar: 'openssh:rsa:private_key'
    - user: root
    - mode: 600

ssh_host_rsa_key.pub:
  file.managed:
    - name: /etc/ssh/ssh_host_rsa_key.pub
    - contents_pillar: 'openssh:rsa:public_key'
    - user: root
    - mode: 600
{% endif %}
