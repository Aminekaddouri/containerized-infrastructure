#!/bin/bash
set -e

echo "🚀 Starting MariaDB..."

service mariadb start

echo "⏳ Waiting for MariaDB..."
until mysqladmin ping --silent; do sleep 1; done

if ! mysql -u root ${DB_ROOT_PASSWORD:+-p$DB_ROOT_PASSWORD} -e "USE ${DB_NAME};" 2>/dev/null; then
  echo "📦 Setting up database..."
  mysql -u root <<EOF
CREATE DATABASE \`${DB_NAME}\`;
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

  echo "🔒 Setting root password..."
  mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF
else
  echo "✅ Database already initialized."
fi

echo "🛑 Stopping MariaDB..."
mysqladmin -u root ${DB_ROOT_PASSWORD:+-p$DB_ROOT_PASSWORD} shutdown

echo "✅ Starting MariaDB in safe mode..."
exec mysqld_safe
