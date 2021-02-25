#!/bin/bash
while :; do
  curl "https://www.duckdns.org/update?domains=bosvos&token=a971f1bd-1d21-49bd-a94a-0da5e7a18d4f&ip="
  echo "sleeping"
  sleep 300s
done
