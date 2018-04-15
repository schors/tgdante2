FROM alpine:3.6

LABEL maintainer="<schors@gmail.com>"

ENV DANTE_VER 1.4.2
ENV DANTE_URL https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz
ENV DANTE_SHA baa25750633a7f9f37467ee43afdf7a95c80274394eddd7dcd4e1542aa75caad
ENV DANTE_FILE dante.tar.gz
ENV DANTE_TEMP dante
ENV DANTE_DEPS linux-pam-dev curl gcc g++ make
ENV WORKERS "10"
ENV PORT "1080"

RUN set -x \
  # Runtime dependencies
  && apk --no-cache add \
    bash apg \
  # Build dependencies
  && apk add --no-cache -t .build-deps $DANTE_DEPS \
  && mkdir -p $DANTE_TEMP \
  && cd $DANTE_TEMP \
  && curl -sSL $DANTE_URL -o $DANTE_FILE \
  && echo "$DANTE_SHA *$DANTE_FILE" | sha256sum -c \
  && tar xzf $DANTE_FILE --strip 1 \
  && ac_cv_func_sched_setscheduler=no ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-client \
    --disable-pidfile \
    --without-libwrap \
    --without-pam \
    --without-bsdauth \
    --without-gssapi \
    --without-krb5 \
    --without-upnp \
  && make && make install \
  # Clean up
  && cd .. \
  && rm -rf $DANTE_TEMP \
  && apk del --purge .build-deps \
  && rm -rf /var/cache/apk/* /tmp/*

ADD files /
ADD entrypoint.sh /entrypoint.sh

EXPOSE ${PORT}

CMD /entrypoint.sh sockd

