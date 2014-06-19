include:
  - bootstrap.directories
  - logstash.client
  - apparmor


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

/etc/apparmor.d/usr.bin.redis-server:
  file.managed:
    - source: salt://redis/files/redis_apparmor_profile
    - template: 'jinja'
    - watch_in:
       - cmd: reload-profiles
       - service: redis-server

{% from 'firewall/lib.sls' import firewall_enable with  context %}
{{ firewall_enable('redis',6379,'tcp') }}


{% from 'logstash/lib.sls' import logship with context %}
{{ logship('redis-server.log', '/var/log/redis/redis-server.log', 'redis', ['redis','log'], 'json') }}

