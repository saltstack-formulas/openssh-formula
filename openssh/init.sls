openssh:
  pkg:
    - installed
    {% if grains['os_family'] == 'Debian' %}
    - name: openssh-server
    {% endif %}
  service.running:
    - enable: True
    {% if grains['os_family'] == 'RedHat' %}
    - name: sshd
    {% else %}
    - name: ssh
    {% endif %}
    - require:
      - pkg: openssh
      - file: sshd_banner
    - watch:
      - file: sshd_config
      {% if salt['pillar.get']('openssh:provide_dsa_keys', False) %}
      - file: /etc/ssh/ssh_host_dsa_key
      - file: /etc/ssh/ssh_host_dsa_key.pub
      {% endif %}
      {% if salt['pillar.get']('openssh:provide_rsa_keys', False) %}
      - file: /etc/ssh/ssh_host_rsa_key
      - file: /etc/ssh/ssh_host_rsa_key.pub
      {% endif %}

sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://openssh/files/sshd_config
    - user: root
    - mode: 600

sshd_banner:
  file.managed:
    - name: /etc/ssh/banner
    - source: salt://openssh/files/banner
    - template: jinja

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
