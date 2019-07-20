FROM alpine

RUN apk add --no-cache nginx certbot certbot-nginx openssl supervisor \
  && adduser supervisor -D -H

COPY supervisord.conf /etc/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY certbot.ini /etc/letsencrypt/cli.ini
COPY init.sh /bin/startup.sh

CMD ["/bin/startup.sh"]
