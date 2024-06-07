#!/bin/bash

. validint

validfloat()
{
    fvalue="$1"

    if [ ! -z $(echo "$fvalue" | sed 's/[^.]//g') ] ; then
      decimalPart="$(echo "$fvalue | cut -d. -f1")"
      fractionalPart="${fvalue#*\.}"
      if [ ! -z "$decimalPart" ] ; then
        if ! validint "$decimalPart" "" "" ; then
          return 1
        fi
      fi

      if [ "${fractionalPart%${fractionalPart#?}}" = "-" ] ; then
        echo "invalid" >&2
        return 1
      fi
      if [ "$fractionalPart" != "" ] ; then
        if ! validint "$fractionalPart" "0" "" ; then
          echo "invalid"
          return 1
        fi
      fi
    else
      if [ "$fvalue" = "-" ] ; then
        echo "invalid" >&2
        return 1
      fi

      if ! validint "$fvalue" "" "" ; then
        return 1
      fi
    fi

    return 0

}

if validfloat $1 ; then
  echo "valid float"
fi

exit 0