Dockerized Dante socks5 proxy for telegram
==========================================

[РУССКАЯ Версия](README-RUS.md)

Features
--------
* Docker, Docker Compose
* Add/Del/Chpass user scripts
* Only telegram usage restrictions

Requirements
------------

* [Docker](https://www.docker.com/docker-community) for virtual containers
* [Docker Compose](https://docs.docker.com/compose/) - a tool for defining and running multi-container Docker applications
* [apg](http://www.adel.nursat.kz/apg/) - a package for generates several random passwords

Usage
-----

* Clone repository
* Edit dante/sockd.conf:
  * external: The address to be used for outgoing connections. The address given may be either a IP address or an interface name.
  * Uncoment some lines for IPv6 support
* Edit dante/Dockerfile:
  * Edit `ENV WORKERS 50` for preforked workers
* Run `docker-compose up -d`
* Use scripts in `scripts` folder for adding and removing users, changing passwords

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
