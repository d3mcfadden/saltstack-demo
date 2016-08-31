include:
  - pip

docker.io:
  pkg.installed:
    - version: '1.11.2-0ubuntu5~16.04'

docker:
  service.running:
    - enable: True

docker-py:
  pip.installed:
    - require:
      - pkg: python-pip
