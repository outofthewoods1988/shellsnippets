#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#. "$srcdir/lib/utils.sh"

regex="${1:-.*}"
shift || :

gcloud compute instances list --filter="name ~ $regex" --format="get(networkInterfaces[0].networkIP, name)" "$@" |
sort -k2
