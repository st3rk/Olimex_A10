include:
  - ssh.server

{% set ssh = salt['grains.filter_by']({
    'Debian': {'pkg': 'openssh-client', 'root_grp': 'root'},
    'RedHat': {'pkg': 'openssh-clients', 'root_grp': 'root'},
    'FreeBSD': {'root_grp': 'wheel'},
    'default': 'Debian',
}) %}

/root/.ssh/authorized_keys:
  file:
    - managed
    - source: salt://ssh/authorized_keys
    - require:
      - file: /root/.ssh

/root/.ssh/config:
  file:
    - managed
    - source: salt://ssh/config
    - require:
      - file: /root/.ssh

/root/.ssh:
  file.directory:
    - user: root
    - group: {{ ssh.root_grp }}
    - mode: 700
    - makedirs: true

{% if grains['os_family'] == 'Debian' or grains['os_family'] == 'RedHat' %}
{{ ssh.pkg }}:
  pkg:
    - installed
{% endif %}
