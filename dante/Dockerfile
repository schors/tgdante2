FROM alpine:latest

LABEL maintainer="<schors@gmail.com>"

ENV DANTE_VER 1.4.2
ENV DANTE_URL https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz
ENV DANTE_SHA baa25750633a7f9f37467ee43afdf7a95c80274394eddd7dcd4e1542aa75caad
ENV DANTE_FILE dante.tar.gz
ENV DANTE_TEMP dante
ENV DANTE_DEPS linux-pam-dev curl gcc g++ make
ENV PWDFILE_URL https://github.com/tiwe-de/libpam-pwdfile/archive/v1.0.tar.gz
ENV PWDFILE_TEMP pam_pwdfile
ENV WORKERS "10"
ENV PORT "1080"

RUN set -x \
  # Runtime dependencies
  && apk --no-cache add \
    bash apg linux-pam openssl \
  # Build dependencies
  && apk add --no-cache -t .build-deps $DANTE_DEPS \
  # Make pam_pwdfile.so
  && mkdir $PWDFILE_TEMP \
  && cd $PWDFILE_TEMP \
  && curl -sSL $PWDFILE_URL | tar xz --strip 1 \
  && make -j$(getconf _NPROCESSORS_ONLN) install \
  && cd .. \
  # Make Dante
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
    --without-bsdauth \
    --without-gssapi \
    --without-krb5 \
    --without-upnp \
  && make -j$(getconf _NPROCESSORS_ONLN) && make install \
  && adduser sockd -s /bin/false -DH \
  # Clean up
  && cd .. \
  && rm -rf $PWDFILE_TEMP $DANTE_TEMP \
  && apk del --purge .build-deps \
  && rm -rf /var/cache/apk/* /tmp/*

ADD files /
ADD entrypoint.sh /entrypoint.sh

EXPOSE ${PORT}

CMD /entrypoint.sh sockd

