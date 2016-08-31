nginx:
  pkg.installed: [ ]
  service.running:
    - enable: True

/etc/nginx/sites-enabled/default:
  file.absent:
    - watch_in:
      - service: nginx

/etc/nginx/sites-enabled/proxy.conf:
  file.managed:
    - source: salt://files/etc/nginx/sites-available/proxy.conf.jinja
    - template: jinja
    - defaults:
      backends: {{ salt['mine.get']('app*', 'network.ip_addrs') }}
    - watch_in:
      - service: nginx
