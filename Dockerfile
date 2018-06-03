FROM resin/raspberry-pi-alpine:latest
 
RUN apk update && apk add dcron wget curl grep rsync ca-certificates && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d

COPY /*.sh /

ENTRYPOINT ["/entry.sh"]
CMD ["/cmd.sh"]
