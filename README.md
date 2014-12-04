redis-formula
=============

General redis formula for saltstak

This is configured purely by the pillar data (and defaults in map.jinja).

For example, to disable save to disk and set maxmemory to 100MB, in pillar:

```
redis:
  configuration:
    maxmemory: 100MB
    dir:  False  # remove save 'dir'
    dbfilename: False  # remove save file 'dbfilename' option
```

NB: There are key configuration details that are (within redis.conf) not in
a key-value form. In particular, the 'save intervals'.

See map.jinja for how to override these settings.

## Testing

When adding new functionality, make an effort to add a particular serverspec test is possible.
