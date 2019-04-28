include:
  - openssh

{%  from "openssh/map.jinja" import openssh, sshd_config with context -%}
{%- set authorized_keys_file = sshd_config.get("AuthorizedKeysFile", None) %}

{%- for store, config in openssh.get("auth_map", {}).items() %}
{%- set store_base = config["source"] %}
# SSH store openssh:auth_map:{{ store }}
{%-   for user, keys in config.get("users", {}).items() %}
{%-     for key, key_cfg in keys.items() %}
"ssh_auth--{{ store }}--{{ user }}--{{ key }}":
{%-       set present = key_cfg.get("present", True) %}
{%-       set options = key_cfg.get("options", []) %}
{%-       if present %}
  ssh_auth.present:
    - require:
      - service: {{ openssh.service }}
{%-       else %}
  ssh_auth.absent:
{%-       endif %}
    - user: {{ user }}
    - source: {{ store_base }}/{{ key }}.pub
{%-       if authorized_keys_file %}
    - config: "{{ authorized_keys_file }}"
{%-       endif %}
{%-       if options %}
    - options: "{{ options }}"
{%-       endif %}
{%-     endfor %}
{%-   endfor %}
{%- endfor %}
