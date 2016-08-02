{% from "openssh/map.jinja" import openssh with context %}

{% set moduli = salt['pillar.get']('openssh:moduli', False) -%}
{% set moduli_source = salt['pillar.get']('openssh:moduli_source', False) -%}
{% if moduli or moduli_source -%}
ssh_moduli:
  file.managed:
    - name: {{ openssh.ssh_moduli }}
    {% if moduli -%}
    # Although we have the contents of the moduli in the variable 'moduli',
    # inlining the variable here *will* cause problems. Using the '|' literal string indicator
    # Necessitates using the '|indent' filter, and this is too complex.
    # Rather, let salt read the pillar itself.
    - contents_pillar: openssh:moduli
    {% elif moduli_source -%}
    - source: {{ moduli_source }}
    - source_hash: {{ moduli_source|trim }}.hash
    {%- endif %}
{% endif %}
