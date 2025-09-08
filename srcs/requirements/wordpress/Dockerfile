FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysqli \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-zip \
    php-redis \
    curl \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY www.conf /etc/php/8.2/fpm/pool.d/
COPY script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/local/bin/script.sh"]