FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

COPY html/index.html /var/www/html/

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

COPY default /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]