refresh_nginx_backends:
  local.state.apply:
    - tgt: 'proxy*'
    - arg:
      - proxy
