#!/bin/bash

retries="10"
action="lock"
nullcmd="'which true'"

while getopts "lur:" opt ; do
  case $opt in
    l ) action="lock" ;;
    u ) action="unlock" ;;
    r ) retries="$OPTARG" ;;
  esac
done
shift $(($OPTIND -1))

if [ $# -eq 0 ] ; then
  echo "Usage:"
  exit 1
fi

if [ -z "$(which lockfile | grep -v '^no')" ] ; then
  echo "install lockfile"
  exit 1
fi

if [ "$action" = "lock" ] ; then
  if ! lockfile -l  "$1" ; then
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