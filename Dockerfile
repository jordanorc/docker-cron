FROM ubuntu:20.04

ENV CRONTAB_ENTRY=""

RUN apt update && \
    apt install -y cron && \
    rm -rf /var/cache/apt/*

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]

CMD ["cron", "-f"]
