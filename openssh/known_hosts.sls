{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch %}
{%- set openssh = mapdata.openssh %}

{%- if openssh.dig_pkg %}
ensure dig is available:
  pkg.installed:
    - name: {{ openssh.dig_pkg }}
    - require_in:
      - file: manage ssh_known_hosts file
{%- endif %}

manage ssh_known_hosts file:
  file.managed:
    - name: {{ openssh.ssh_known_hosts }}
    - source: {{ files_switch( [openssh.ssh_known_hosts_src],
                               'manage ssh_known_hosts file'
              ) }}
    - template: jinja
    - context:
        known_hosts: {{ openssh | traverse("known_hosts", {}) | json }}
    - user: root
    - group: {{ openssh.ssh_config_group }}
    - mode: 644
