{% for username, details in pillar.get('add_users', {}).items() %}

{%- set home = details.get('home', "/home/%s" %username) -%}

{{ username }}:
  group.present:
    - name: {{ username }}
    - gid: {{ details.get('gid','') }}

  user.present:
    - fullname: {{ details.get('fullname','') }}
    - name: {{ username }}
    - uid: {{ details.get('uid','') }}
    - gid: {{ details.get('gid','') }}
    - home: {{ details.get('home','') }}
    - groups:
      {% for group in details.get('groups', []) %}
      - {{ group }}
      {% endfor %}

  file.directory:
    - name: {{ details.get('home','') }}/.ssh
    - user: {{ username }}
    - group: {{ username }}
    - mode: 0700
    - require:
      - user: {{ username }}
      - group: {{ username }}

#    - require:
#      - user: {{ username }}
#      - group: {{ username }}



# SUDO: add to file '/etc/sudoers'
# {{ username }}   ALL=(ALL:ALL) NOPASSWD: ALL
# if details.get('sudousr', True) #

# if 'sudousr' in details #

{% if details.get('sudousr', False) %}
users_{{ username }}_sudo:
  file.managed:
    - name: /etc/sudoers.d/{{ username }}

users_{{ username }}_sudo_2:
  file.append:
    - name: /etc/sudoers.d/{{ username }}
    - text: '{{ username }}    ALL=(ALL:ALL) NOPASSWD: ALL'
{% endif  %}


  # for _key in details.priv_keys.keys()
  # for _key in details.priv_keys.values()
  {% for _key in details.priv_keys.values() %}
users_{{ username }}_{{ _key }}_key:
  file.managed:
    - name: {{ home }}/.ssh/{{ _key }}
    # - contents_pillar: details:{{ username }}:priv_keys:{{ _key }}
    - source: salt://{{ _key }}
  {% endfor %}


{% endfor %}


{% for username, details in pillar.get('del_users', {}).items() %}
{{ username }}:
  user.absent:
    - name: {{ username }}
    - purge: {{ details.get('purge','False') }}
    - purge: {{ details.get('force','False') }}
  file.absent:
    - name: /etc/sudoers.d/{{ username }}
{% endfor %}

