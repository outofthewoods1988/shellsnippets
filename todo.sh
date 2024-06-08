#!/bin/bash

exec=0
unexec=0
for directory in "$PATH" ; do
  if [ -d "$directory" ] ; then
    for cmd in "$directory"/* ; do
      if [ -x "$cmd" ] ; then
        exec=$((exec + 1))
      else
        unexec=$((unexec + 1))
      fi
    done
  fi
done

echo "executable is $exec, while unexec is $unexec."

exit 0