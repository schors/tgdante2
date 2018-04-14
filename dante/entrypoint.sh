#!/bin/sh

set -e

for i in "passwd" "group" "shadow" "login.defs" "sockd.conf"; do
    if [ ! -f "/etc/${i}" ]; then
        cp "/conf/${i}" "/etc/${i}"
    fi
done

exec "$@"
