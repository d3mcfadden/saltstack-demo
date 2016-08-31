python-pip:
  pkg.installed

pip upgrade:
  cmd.run:
    - name: pip install -U pip
    - onchanges:
      - pkg: python-pip
