#!/bin/sh

# exit oon any failed command
set -e

if [ -z $HOST ] || [ -z $EMAIL ] || [ -z $UPSTREAM_SERVER ]; then
  echo "Error, missing env var"
  exit 1
fi

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/selfsigned.key -out /etc/ssl/selfsigned.crt \
  -subj "/C=US/ST=CA/L=./O=./OU=./CN=$HOST/emailAddress=$EMAIL"

sed -i 's!XXXXXX!'$UPSTREAM_SERVER'!g' /etc/nginx/nginx.conf
sed -i 's!YYYYYY!'$HOST'!g' /etc/nginx/nginx.conf
sed -i 's!XXXXXX!'$EMAIL'!g' /etc/letsencrypt/cli.ini

supervisord -c /etc/supervisord.conf

