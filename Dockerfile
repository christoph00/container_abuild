FROM  docker.io/library/alpine
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache alpine-sdk sudo \
    && adduser -s /bin/sh -D -G abuild abuild \
    && echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER abuild
RUN abuild-keygen -a -i -n -q

WORKDIR /apkbuild
