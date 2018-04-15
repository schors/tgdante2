Dockerized Dante socks5 proxy for telegram. Alpine version
==========================================================

Features
--------
* Docker, Docker Compose
* User management scripts
* Only telegram usage restrictions
* Try to autodetect interface and IPv6 support

Requirements
------------

* [Docker](https://www.docker.com/docker-community) for virtual containers
* [Docker Compose](https://docs.docker.com/compose/) - a tool for defining and running multi-container Docker applications

Usage with Docker Hub image
---------------------------

```shell
docker pull schors/tgdante2
mkdir etc
docker run -d -v ./etc:/etc --net=host --name tgdante schors/tgdante2
docker run --rm -ti -v ./etc:/etc --net=host schors/tgdante2 /scripts/add user1 secret1
docker run --rm -ti -v ./etc:/etc --net=host schors/tgdante2 /scripts/chp user1 secret3
docker run --rm -ti -v ./etc:/etc --net=host schors/tgdante2 /scripts/del user1
docker exec -ti tgdante /scripts/add user2 secret2
```

Very simple usage
-----------------

```shell
docker pull schors/tgdante2
docker run -d --net=host -e PORT=1080 -e USER=user1 -e PASS=secret1 --name tgdante schors/tgdante2
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

* [Restless Phil](https://2018.schors.spb.ru) Restless Phil :tm:
* [Roscomnadzor](http://rkn.gov.ru) The Federal Service for Supervision of Communications, Information Technology, and Mass Media


---
[![UNLICENSE](noc.png)](UNLICENSE)
