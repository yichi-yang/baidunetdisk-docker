# syntax=docker/dockerfile:1

FROM scratch AS download

ADD --checksum=sha256:50ec18f05626a13f57ef034630416d481682bc1018539f33397d5c71bc653b3d \
    https://pkg-ant.baidu.com/issue/netdisk/LinuxGuanjia/4.17.7/baidunetdisk_4.17.7_amd64.deb /installer/baidunetdisk.deb

FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# abc doesn't need sudo access
RUN deluser abc sudo

RUN --mount=type=bind,from=download,source=/installer,target=/installer \
    apt update \
    && apt -y install /installer/baidunetdisk.deb fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/*

COPY /root /
