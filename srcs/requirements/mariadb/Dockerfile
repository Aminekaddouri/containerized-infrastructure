FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

EXPOSE 3306

CMD ["/usr/local/bin/script.sh"]
