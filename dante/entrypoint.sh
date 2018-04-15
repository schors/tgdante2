#!/bin/sh

set -e

for i in "passwd" "group" "shadow" "login.defs"; do
    if [ ! -f "/etc/${i}" ]; then
        cp "/conf/${i}" "/etc/${i}"
    fi
done

if [ x"${WORKERS}" = "x" ]; then
        WORKERS="10"
fi

CFGFILE="/conf/dante.conf"
if [ x"${IP6}" = "x" ]; then
        IP6=`ip -6 r | grep '^default' || echo ""`
        if [ x"${IP6}" != "x" ]; then
                CFGFILE="/conf/dante6.conf"
        fi
fi

if [ x"${INTERFACE}" = "x" ]; then
        INTERFACE=`ip  r | grep '^default' | grep -o 'dev[ ]*[^ ]*' | grep -o '[^ ]*$' || echo ""`
fi
if [  x"${INTERFACE}" != "x" ]; then
                sed -i 's/external\:.*$/external: '"${INTERFACE}"'/' "${CFGFILE}"
fi

if [  x"${PORT}" != "x" ]; then
        # internal: 0.0.0.0 port = 1080
        sed -i 's/\(internal\:.*port[ ]*=[ ]*\)[^ ]*\(.*\)$/\1'"${PORT}"'\2/' "${CFGFILE}"
        echo "${PORT}" > /tmp/dante_port
fi

if [ x"${USER}" != "x" -a x"${PASS}" != "x" ]; then
        echo "${USER} ${PASS}"
        if ! getent passwd "${USER}"; then
                adduser -D -H -S "${USER}"
        fi
        echo "${USER}:${PASS}" | chpasswd -c SHA256
fi

exec "sockd" "-f" "${CFGFILE}" "-N" "${WORKERS}"


