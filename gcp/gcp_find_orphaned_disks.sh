#!/bin/bash

filter="${1:-.*}"
shift || :

gcloud compute disks list  --format="table[no-heading](name, zone.basename(), type.basename(), sizeGb, user.join(','))" |
grep -E  "$filter"
while read name zone type size users ; do
  [ -n "$users" ] && continue
    echo "disk $name in zone $zone is orpahned disk."
done
