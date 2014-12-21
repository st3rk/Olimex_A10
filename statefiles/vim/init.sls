{% set vim = salt['grains.filter_by']({
    'Debian': {'pkg': 'vim-nox', 'root_grp': 'root'},
    'RedHat': {'pkg': 'vim-enhanced', 'root_grp': 'root'},
    'FreeBSD': {'pkg': 'vim', 'root_grp': 'wheel'},
    'default': 'Debian',
}) %}

vim:
  pkg.installed:
    - name: {{ vim.pkg }}
/root/.vimrc:
  file.managed:
    - source: salt://vim/vimrc
    - user: root
    - group: {{ vim.root_grp }}
    - mode: 755
/root/.vim:
  file.recurse:
    - source: salt://vim/vim
    - user: root
    - group: {{ vim.root_grp }}
    - file_mode: 644
    - dir_mode: 755
