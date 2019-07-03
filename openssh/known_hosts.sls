{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import openssh with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch %}

ensure dig is available:
  pkg.installed:
    - name: {{ openssh.dig_pkg }}
    - unless: which dig

manage ssh_known_hosts file:
  file.managed:
    - name: {{ openssh.ssh_known_hosts }}
    - source: {{ files_switch( [openssh.ssh_known_hosts_src],
                               'manage ssh_known_hosts file'
              ) }}
    - template: jinja
    - user: root
    - group: {{ openssh.ssh_config_group }}
    - mode: 644
    - require:
      - pkg: ensure dig is available
