redis-formula
=============

Opionated redis formula for saltstak

To disable save to disk, in pillar:

```
redis:
  save: False
```

## Testing
When adding new functionality, make an effort to add a particular serverspec test is possible.
