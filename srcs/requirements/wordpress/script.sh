#!/bin/bash
set -ex

# tessna mariadb ta tewjd (prevents race condition)
while ! mysqladmin ping -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASSWORD" --silent; do
    sleep 1
done

# downlowdi wordpress la makaynax 
if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --allow-root
    
    #  Generates wp-config.php file using the DB credentials.
    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASSWORD" \
        --dbhost="$DB_HOST" \
        --allow-root

    # Adds a constant WP_REDIS_HOST to enable Redis caching.
    wp config set WP_REDIS_HOST "$WP_REDIS_HOST" --type=constant --allow-root
    
    # Installs WordPress with initial settings: Site URL, title, admin user/password, email.
    wp core install \
        --url="$WP_URL" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="admin@${DOMAIN_NAME}" \
        --skip-email \
        --allow-root

    # Another User
    wp user create contributor contributor@example.com \
    --role="$ANOTHER_USER" \
    --user_pass="$ANOTHER_USER_PASS" \
    --allow-root

    # Install and enable Redis object cache plugin
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
    
fi

# Start PHP-FPM
exec /usr/sbin/php-fpm8.2 -F