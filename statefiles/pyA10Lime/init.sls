pyA10Lime :
  pkg.installed:
    - name: 'python2.7-dev'
  cmd.run:
    - creates: '/root/pyA10Lime-0.2.0'
    - cwd: '/root'
    - name: 'wget https://pypi.python.org/packages/source/p/pyA10Lime/pyA10Lime-0.2.0.tar.gz ; tar xvf pyA10Lime-0.2.0.tar.gz'
  cmd.run:
    - creates: '/usr/local/lib/python2.7/dist-packages/pyA10Lime-0.2.0.egg-info'
    - cwd: '/root/pyA10Lime-0.2.0'
    - name: 'python setup.py install'
    - require: 
      - cmd: 'wget https://pypi.python.org/packages/source/p/pyA10Lime/pyA10Lime-0.2.0.tar.gz ; tarx xvf pyA10Lime-0.2.0.tar.gz'
