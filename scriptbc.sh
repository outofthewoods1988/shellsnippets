#!/bin/bash

if [ "$1" = "-p" ] ; then
  precision="$2"
  SHIFT 2
else
  precision=2
fi

bc -q -l << EOF
  scale=$precision
  $*
  quit
EOF

exit 0