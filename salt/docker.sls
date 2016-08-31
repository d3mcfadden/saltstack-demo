include:
  - pip

install docker io:
  pkg.installed:
    - version: '1.11.2-0ubuntu5~16.04'
    - name: docker.io

docker:
  service.running:
    - enable: True

docker-py:
  pip.installed:
    - require:
      - pkg: python-pip
