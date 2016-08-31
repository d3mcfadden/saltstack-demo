api:
  dockerng.running:
    - image: d3mcfadden/saltstack-demo:latest
    - restart_policy: always
    - ports:
      - "5000/tcp"
    - port_bindings:
      - "5000:80"
    - environment:
      - FOO: {{ salt['pillar.get']('app:foo') }}
