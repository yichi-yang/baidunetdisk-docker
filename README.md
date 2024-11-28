# baidunetdisk-docker

A containerized Baidu Netdisk client, based on [docker-baseimage-kasmvnc](https://github.com/linuxserver/docker-baseimage-kasmvnc/tree/master).

### Build

``` bash
docker build . -t baidunetdisk
```

### Run

``` bash
docker run --rm -it -p 3000:3000 baidunetdisk
```

Then access the client on http://localhost:3000. You can set UID/GID with `-e PUID=1000 -e PGID=1000` if needed.
