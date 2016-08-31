base:
  '*':
    - base
    - users.deploy

  'proxy*':
    - proxy

  'app*':
    - docker
    - app
