{% from "openssh/map.jinja" import openssh with context %}

{% if salt['pillar.get']('openssh:moduli', False) %}
ssh_moduli:
  file.managed:
    - name: {{ openssh.ssh_moduli }}
    - contents_pillar: openssh:moduli
{% endif %}
