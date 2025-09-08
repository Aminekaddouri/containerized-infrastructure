#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=BenGuerir/L=BenGuerir/O=1337/OU=1337/CN=${DOMAIN_NAME}"

exec nginx -g "daemon off;"
