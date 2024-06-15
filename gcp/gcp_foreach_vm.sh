#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#. "$srcdir/lib/utils.sh"

filter="${1:-}"
shift || :

project=$(gcloud config list --format='get(core.project)')

gcloud compute instances list --format='value(name, networkInterfaces[0].networkIP, zone)' |
grep -E "$filter" |
while read name ip zone ; do
  echo "===================="
  echo "project: $project - name: $name - IP: $ip"
  echo "===================="
  cmd=("$@")
  cmd=("${cmd[@]//\{vm_name\}/$name}")
  cmd=("${cmd[@]//\{ip\}/$ip}")
  cmd=("${cmd[@]//\{zone\}/$zone}")
  eval "${cmd[@]}"
done
