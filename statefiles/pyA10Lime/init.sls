pyA10Lime :
  pkg.installed:
    - name: 'python2.7-dev'
  cmd.run:
    - creates: '/usr/local/lib/python2.7/dist-packages/pyA10Lime-0.2.0.egg-info'
    - cwd: '/root'
    - name: 'wget https://pypi.python.org/packages/source/p/pyA10Lime/pyA10Lime-0.2.0.tar.gz ; tar xvf pyA10Lime-0.2.0.tar.gz ; cd /root/pyA10Lime-0.2.0 && python setup.py install'
