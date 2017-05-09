FROM lsiobase/alpine:3.5
MAINTAINER damonmorgan

# install packages
RUN \
 apk add --no-cache \
  curl \
  openssl

# copy local files
COPY root/ /

# volumes
VOLUME /cron /scripts
