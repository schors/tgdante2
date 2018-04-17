EN: Dockerized Dante socks5 proxy for telegram. Alpine version
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

For nuts
--------

* PayPal https://www.paypal.me/schors
* Yandex.Money http://yasobe.ru/na/schors
* BTC:17V94QS4vaBwec1Qwqp2ow5b3tbrRGGcne

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

Links
-----

* [Telegram](https://telegram.org/)  Messenger
* [Dante](https://www.inet.no/dante/index.html) A free SOCKS server

* [Restless Phil](https://2018.schors.spb.ru) Restless Phil (tm)
* [Roscomnadzor](http://rkn.gov.ru) The Federal Service for Supervision of Communications, Information Technology, and Mass Media


---
[![UNLICENSE](noc.png)](UNLICENSE)


RU: Dockerized Dante socks5 прокси для Telegram. Версия для Alpine
==========================================================

Возможности
--------
* Docker, Docker Compose
* Пользовательские скрипты
* Снятие ограничений на использование Telegram
* Автоопределение интерфейса и поддержки IPv6

Требования
------------

* [Docker](https://www.docker.com/docker-community) для виртуального контейнера
* [Docker Compose](https://docs.docker.com/compose/) — инструмент для определения и запуска многоконтейнерных приложений Docker

На чай
--------

* PayPal https://www.paypal.me/schors
* Яндекс.Деньги http://yasobe.ru/na/schors
* BTC:17V94QS4vaBwec1Qwqp2ow5b3tbrRGGcne

Крайне простое использование
-----------------

```console
docker pull schors/tgdante2
docker run -d --net=host --restart unless-stopped -e PORT=1080 -e USER=user0 -e PASS=secret0 --name tgdante schors/tgdante2
```
Использование с образом Docker Hub
---------------------------

```console
# поставьте образ docker
docker pull schors/tgdante2
# создайте директорию для постоянной базы данных пользователей
mkdir etc
# запустите контейнер
docker run -d -v $PWD/etc:/etc --net=host --restart unless-stopped --name tgdante schors/tgdante2
# управляйте пользователями
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/add user1 secret1
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/chp user1 secret2
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/list
docker run --rm -ti -v $PWD/etc:/etc --net=host schors/tgdante2 /scripts/del user1
# другой способ (через docker exec)
docker exec -ti tgdante /scripts/add user2 secret3
```
Пожалуйста, обратите внимание, что `-v $PWD/etc` необходимо для постоянной базы данных пользователей
Тестирование доступа
-----------

```console
curl -x socks5://user2:secret2@localhost:1080 https://web.telegram.org
```

Переменные среды
---------------------

* USER,PASS - создайте пользователя с паролем
* PORT - порт на прослушивание. По умолчанию: 1080
* INTERFACE - название или IP внешнего интерфейса. По умолчанию: автоопределение
* WORKERS - preforked workers. По умолчанию: 10
* IP6 - что-то, при необходимости. По умолчанию: автоопределение

Ссылки
-----

* [Телеграм](https://telegram.org/) месенджер
* [Dante](https://www.inet.no/dante/index.html) — бесплатный SOCKS сервер

* [Неугомонный Фил](https://2018.schors.spb.ru) — статус блокировок от РКН
* [Роскомнадзор](http://rkn.gov.ru) — Федеральная служба по надзору в сфере связи, информационных технологий и массовых коммуникаций


[![UNLICENSE](noc.png)](UNLICENSE)
