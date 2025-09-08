FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY default /etc/nginx/sites-available/default

COPY script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/script.sh"]