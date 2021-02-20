#!/bin/bash
while :
do
  curl -i -XPOST "localhost:8086/write?db=solar&precision=s" -u ":" --data-binary "pi cpu_load_ave=`uptime | sed -n -e 's/\(.*load average:\s\)\([0-9.]*\)\(,.*\)/\2/p'`"
  curl -i -XPOST "localhost:8086/write?db=solar&precision=s" -u ":" --data-binary "pi influx_db_size_bytes=`sudo du -sh -b /var/lib/influxdb/data/solar | sed -n -e 's/\([0-9]*\)\(\s.*\)/\1/p'`"
  curl -i -XPOST "localhost:8086/write?db=solar&precision=s" -u ":" --data-binary "pi pi_disk_usage_perc=`df / | sed -n -e 's/\(\/dev\/root\s*\)\([0-9]*\s*\)\([0-9]*\s*\)\([0-9]*\s*\)\([0-9]*\s*\)\(%.*\)/\5/p'`"  
echo "sleeping"
  sleep 10s
done
