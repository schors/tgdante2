Features
--------
* User management scripts
* Only telegram usage restrictions
* Try to autodetect interface and IPv6 support

Very simple usage
-----------------

```console
docker pull schors/tgdante2
docker run -d --net=host --restart unless-stopped -e PORT=1080 -e USER=user0 -e PASS=secret0 --name tgdante schors/tgdante2
```

Usage with Docker Hub image
---------------------------

```console
# pull docker image
docker pull schors/tgdante2
# create directory for permanent username database
mkdir etc
# start container
docker run -d -v $PWD/etc:/etc --net=host --restart unless-stopped --name tgdante schors/tgdante2
# manage users
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/add user1 secret1
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/chp user1 secret2
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/list
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/del user1
# another method (via docker exec)
docker exec -ti tgdante /scripts/add user2 secret3
```

Please note that `-v $PWD/etc` is necessary for persistent user database

Access test
-----------

```console
curl -x socks5://user2:secret2@localhost:1080 https://web.telegram.org
```

Environment variables
---------------------

* USER,PASS - create USER with PASSword
* PORT - listen on PORT. Default: 1080
* INTERFACE - outgoing interface name or IP. Default: autodetect
* WORKERS - preforked workers. Default: 10
* IP6 - something, if needed. Default: autodetect

For nuts
--------

* PayPal https://www.paypal.me/schors
* Yandex.Money http://yasobe.ru/na/schors
* BTC:17V94QS4vaBwec1Qwqp2ow5b3tbrRGGcne

Links
-----

* [Telegram](https://telegram.org/)  Messenger
* [Dante](https://www.inet.no/dante/index.html) A free SOCKS server
* [Restless Phil](https://2018.schors.spb.ru) Restless Phil (tm)
* [Roscomnadzor](http://rkn.gov.ru) The Federal Service for Supervision of Communications, Information Technology, and Mass Media


---
[![UNLICENSE](https://github.com/schors/tgdante2/raw/master/noc.png)](https://raw.githubusercontent.com/schors/tgdante2/master/UNLICENSE)
