# damonmorgan/docker-cron

A simple docker container to run cron jobs

## Usage

```
docker create --name=cron \
-v <path to cron>:/cron \
-v <path to scripts>:/scripts \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
damonmorgan/docker-cron
```

## Parameters

* `-v /cron` - path to a folder containing the crontab file
* `-v /scripts` - path to a folder containing scripts to use in cron jobs
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it cron /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. This issue is avoided by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Info

* To monitor the logs of the container in realtime `docker logs -f cron`.

## Versions

+ **17.05.08:** Initial Release.

## Credits
[linuxserverurl]: https://linuxserver.io
[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]
