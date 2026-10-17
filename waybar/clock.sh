#!/bin/sh

set -- $(date '+%b %-d %H:%M')
month=$1
day=$2
time=$3

case "$day" in
    11|12|13) suffix=th ;;
    *1) suffix=st ;;
    *2) suffix=nd ;;
    *3) suffix=rd ;;
    *) suffix=th ;;
esac

printf '%s %s%s %s\n' "$month" "$day" "$suffix" "$time"
