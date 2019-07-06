{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import openssh with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch %}

include:
  - openssh

sshd_banner:
  file.managed:
    - name: {{ openssh.banner }}
    {%- if openssh.banner_string is defined %}
    - contents: {{ openssh.banner_string | yaml }}
    {%- else %}
    {#- Preserve backward compatibility using the `if` below #}
    - source: {{ openssh.banner_src if '://' in openssh.banner_src
                 else files_switch( [openssh.banner_src],
                                    'sshd_banner'
              ) }}
    - template: jinja
    {%- endif %}
