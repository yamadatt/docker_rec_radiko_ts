FROM alpine:3.12.1 as tzdata
RUN apk --update add \
    --no-cache \
    tzdata

FROM alpine:3.12.1
RUN apk --update add \
    --no-cache \
    libxml2-utils \
    ffmpeg \
#    bash \
    curl

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./rec_radiko_ts.sh /usr/local/bin/
WORKDIR /usr/volume