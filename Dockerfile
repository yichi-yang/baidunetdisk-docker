# syntax=docker/dockerfile:1

FROM scratch AS download

ADD --checksum=sha256:43aa0ad4ef8fe17fa62592a366bd955984d71e56320b5a7b3ab2aee0b49be5e6 \
    https://issuepcdn.baidupcs.com/issue/netdisk/LinuxGuanjia/4.3.0/baidunetdisk_4.3.0_amd64.deb /installer/baidunetdisk.deb

FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

RUN --mount=type=bind,from=download,source=/installer,target=/installer \
    apt update \
    && apt -y install /installer/baidunetdisk.deb fonts-noto-cjk \
    && rm -rf /var/lib/apt/lists/*

COPY /root /
