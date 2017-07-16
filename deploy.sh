#!/bin/bash
set -e

echo "Starting identidock system"

docker run -d --restart=always --name redis redis:3
docker run -d --restart=always --name dnmonster jchaffin/dnmonster:1.0
docker run -d --restart=always \
  --link dnmonster:dnmonster \
  --link redis:redis \
  -e ENV=PROD \
  --name identidock jchaffin/identidock:1.0
docker run -d --restart=always \
  --name proxy \
  --link identidock:identidock \
  -p 80:80 \
  -e NGINX_HOST=$(/sbin/ip route|awk '/default/ { print $3 }')  \
  -e NGINX_PROXY=http://identidock:9090 \
  jchaffin/identiproxy:1.1

echo "Started"

