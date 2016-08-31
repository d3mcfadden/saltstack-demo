{% from "proxy/map.jinja" import backends with context %}

nginx:
  pkg.installed: [ ]
  service.running:
    - enable: True

/etc/nginx/sites-enabled/default:
  file.absent

/etc/nginx/sites-enabled/proxy.conf:
  file.managed:
    - source: salt://files/etc/nginx/sites-available/proxy.conf.jinja
    - template: jinja
    - defaults:
      backends:
        - 127.0.0.1
    - watch_in:
      - service: nginx
