FROM lsiobase/alpine
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
