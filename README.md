# Docker Compose for Development Environment

This project was created to simplify development environment setup by using Docker. Please feel free to raise any issue or folk and modify for your own usage.

## Prerequisites

* [Docker](https://www.docker.com/community-edition)

## How to Use

> ***Making sure you are in the mode of 'Linux Container'. Never mind if your system is not Win10/Win2016***

1. Download this whole folder to you local
2. Open Command Prompt and navigate to that folder
3. **Run `up.bat` to start all the server**


![up](http://imagizer.imageshack.us/a/img924/7122/I00qSR.gif)

> The containers created after the `WARNING` are optional services that might be used for current environment. If you don't want them you can either ignore them or disable them by remove the second line of `optional-compose` in [up.bat]

4. Done! Your data for CouchDB and ElasticSearch will be saved under this folder
5. **Shutdown and remove all the containers whenever you want by `down.bat`**

![down](http://imageshack.com/a/img922/1149/JxA3Ih.gif)

Then your machine will be as clean as it was.

## Compose Detail

### Main [`docker-compose.yml`](./docker-compose.yml)

* [Riak-KV](https://hub.docker.com/r/basho/riak-kv)
* [Rabbit-MQ](https://hub.docker.com/_/rabbitmq/)
* [CouchDb](https://hub.docker.com/r/klaemo/couchdb/)
* [ElasticSearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)
* [Kibana](https://hub.docker.com/_/kibana/)

### Optional [`optional-compose.yml`](./optional-compose.yml)

* [FakeSMTP](https://github.com/Nilhcem/FakeSMTP)

Used for local email sending, by default it will bind to local port `9925`. You also need to update the SMTP config in you database

## Commands

### [up.bat](./up.bat)

It creates all the containers and get them started in the background.
```
docker-compose up -d
docker-compose --file optional-compose.yml up -d
```

### [down.bat](./down.bat)

Opposite to `up.bat`, it shut down and remove all the containers.
```
docker-compose down
docker-compose --file optional-compose.yml down
```

## Migrating you CouchDB data from your local to Docker data folder

Simply run [`powershell -File .\couchdb\migrate.ps1`](./couchdb/migrate.ps1)

Details please refer [How to migrate from local CouchDB into docker volume](./couchdb/Migration.md)

---
## Licence

MIT