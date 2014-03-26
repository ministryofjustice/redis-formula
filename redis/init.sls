include:
  - bootstrap.directories
  - logging.client


redis-server:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - pkg: redis-server
      - file: /etc/redis/redis.conf
      - file: /data/redis


/etc/redis/redis.conf:
  file:
    - managed
    - source: salt://redis/etc/redis.conf
    - template: jinja
    - mode: 644


/data/redis:
  file:
    - directory
    - user: redis
    - group: redis


{% from 'firewall/lib.sls' import firewall_enable with  context %}
{{ firewall_enable('redis',6379,'tcp') }}


{% from 'logging/lib.sls' import logship with context %}
{{ logship('redis-server.log', '/var/log/redis/redis-server.log', 'redis', ['redis','log'], 'json') }}

