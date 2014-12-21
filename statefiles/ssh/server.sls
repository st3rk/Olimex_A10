include:
  - ssh

{% set sshd = salt['grains.filter_by']({
    'Debian': {'pkg': 'openssh-server', 'srv': 'ssh'},
    'RedHat': {'pkg': 'openssh-server', 'srv': 'sshd'},
    'FreeBSD': {'srv': 'sshd'},
    'default': 'Debian',
}) %}

/etc/ssh/sshd_config:
  file:
    - managed
    - source: salt://ssh/sshd_config
    - template: jinja

openssh-server:
  {% if grains['os_family'] != 'FreeBSD' %}
  pkg:
    - installed
    - name: {{ sshd.pkg }}
  {% endif %}
  service:
    - running
    - name: {{ sshd.srv }}
    - watch:
      {% if grains['os_family'] == 'Debian' %}
      - pkg: openssh-server
      {% endif %}
      - file: /etc/ssh/sshd_config
