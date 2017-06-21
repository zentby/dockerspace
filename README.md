# Docker Compose for Development Environment

[description]

## Prerequisites

* [Docker](https://www.docker.com/community-edition)

## How to Use

***Making sure you are in the mode of 'Linux Container'. Never mind if your system is not Win10/Win2016***

1. Download this whole folder to you local
2. Open Command Prompt and navigate to that folder
3. Run `up.bat` to start all the server
```
up.bat
```
And if everything is good, you'll see logs like:
```
Creating network "devworkspace_devnet" with the default driver
Creating dev-elastic
Creating dev-couchdb
Creating dev-rabbitmq
Creating devworkspace_riak-kv_1
Creating dev-kibana
WARNING: Found orphan containers (dev-kibana, dev-couchdb, dev-elastic, devworkspace_riak-kv_1, dev-rabbitmq) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Creating devworkspace_fake-smtp_1
```

This is for the optional services that might be used for current environment. If you don't want them you can either ignore them or disable them by remove the second line of `docker-compose up` in [up.bat]

4. Done! Your data for CouchDB and ElasticSearch will be saved under this folder
5. Remove all the containers whenever you want
```
down.bat
```
And you'll see:
```
Stopping dev-kibana ... done
Stopping dev-couchdb ... done
Stopping dev-elastic ... done
Stopping devworkspace_riak-kv_1 ... done
Stopping dev-rabbitmq ... done
WARNING: Found orphan containers (devworkspace_fake-smtp_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Removing dev-kibana ... done
Removing dev-couchdb ... done
Removing dev-elastic ... done
Removing devworkspace_riak-kv_1 ... done
Removing dev-rabbitmq ... done
Removing network devworkspace_devnet
ERROR: network devworkspace_devnet has active endpoints
Stopping devworkspace_fake-smtp_1 ... done
Removing devworkspace_fake-smtp_1 ... done
Removing network devworkspace_devnet
```

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