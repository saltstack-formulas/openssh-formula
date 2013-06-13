openssh:
  pkg:
    - installed
    {% if grains['os_family'] == 'Debian' %}
    - name: openssh-server
    {% endif %}
  service.running:
    - enable: True
    - require:
      - pkg: openssh
      - file: sshd_banner
    - watch:
      - file: sshd_config

sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://openssh/files/sshd_config

sshd_banner:
  file.managed:
    - name: /etc/ssh/banner
    - source: salt://openssh/files/banner
    - template: jinja
