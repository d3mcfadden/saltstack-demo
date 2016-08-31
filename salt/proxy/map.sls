{% set backends = [] %}
{% for server, ipaddrs in salt['mine.get']('app*', 'network.ip_addrs').items() %}
  {% do backends.append(server) %}
{% endfor %}
