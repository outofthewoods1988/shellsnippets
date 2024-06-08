#!/bin/bash

retries="10"
action="lock"

while getopts "lur:" opt ; do
  case $opt in
    l ) action="lock" ;;
    u ) action="unlock" ;;
    r ) retries="OPTARG" ;;
    * ) echo "not recognized"
  esac
done

if [ $# -eq 0 ] ; then
  echo "Usage:"
  exit 1
fi

if [ -z "$(which lockfile | grep -v '^no')" ] ; then
  echo "install lockfile"
  exit 1
fi

if [ "$action" = "lock" ] ; then
  if ! lockfile -l -r "$retries" "$1" 2> /dev/null; then
    echo "failed to lock file"
    exit 1
  fi
else
  if [ ! -f "$1" ] ; then
    echo "file not exist"
    exit 1
  fi
  rm -f "$1"
fi