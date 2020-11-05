FROM mhart/alpine-node:12

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel