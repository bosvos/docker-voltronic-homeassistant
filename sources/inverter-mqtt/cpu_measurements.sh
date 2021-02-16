#!/bin/bash
while :
do
  curl -i -XPOST "localhost:8086/write?db=solar&precision=s" -u ":" --data-binary "pi cpu_load_ave=`uptime | sed -n -e 's/\(.*load average:\s\)\([0-9.]*\)\(,.*\)/\2/p'`"
  echo "sleeping"
  sleep 10s
done
