{%- set minions = salt.slsutil.renderer(opts['config_dir'] + '/roster') %}
{%- set cache_dir = opts['cachedir'] + '/../master/known_hosts_salt_ssh' %}
{%- set cmd = "cat /etc/ssh/ssh_host_*_key.pub 2>/dev/null" %}

{{ cache_dir }}:
  file.directory:
    - makedirs: True

{%- for minion_id in minions %}
{%-   set salt_ssh_cmd = "salt-ssh --out=json --static '{}' cmd.run_all '{}'".format(minion_id, cmd) %}
{%-   set result = salt['cmd.run_all'](salt_ssh_cmd,
          python_shell=True,
          runas=salt['pillar.get']('openssh:known_hosts:salt_ssh:user', 'salt-master')
        )
%}

{%-   set pubkeys = False %}
{%-   if result['retcode'] == 0 %}
{%-     load_json as inner_result %}
{{        result['stdout'] }}
{%-     endload %}
{%-     set pubkeys = inner_result[minion_id]['stdout'].splitlines() | sort | join("\n") %}
{%-   else %}
{%-     do salt.log.error("{} failed: {}".format(salt_ssh_cmd, result)) %}
{%-   endif %}

{%-   if pubkeys %}
{{ cache_dir }}/{{ minion_id }}.pub:
  file.managed:
    - contents: |
        {{ pubkeys | indent(8) }}
    - require:
      - file: {{ cache_dir }}
{%-   endif %}

{%- endfor %}
