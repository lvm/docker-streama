# streama

This is a Docker container for [Streama](https://github.com/streamaserver/streama/).  

## Requirements

* [Docker](https://docs.docker.com/install/)
* [docker-compose](https://docs.docker.com/compose/install/)

## How to use this

First make sure to edit `docker-compose.yml` and add _your_ directory with Videos to mount this in the container. You'll find more info about how to proceed [here](https://docs.docker.com/compose/compose-file/#volume-configuration-reference). Or you can create an issue and I'll try to assist you.

```
$ env RELEASE=1.7.0 UID=$(id -u) GID=$(id -g) docker-compose up --build
```
