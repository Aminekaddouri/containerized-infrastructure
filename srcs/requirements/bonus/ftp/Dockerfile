FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/vsftpd && \
    touch /etc/vsftpd/vsftpd.conf && \
    mkdir -p /var/run/vsftpd/empty

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY setup_ftp.sh /tmp/setup_ftp.sh
RUN chmod +x /tmp/setup_ftp.sh

CMD ["/tmp/setup_ftp.sh"]