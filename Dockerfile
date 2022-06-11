FROM alpine:3.16.0 as tzdata
RUN apk --update add \
    --no-cache \
    tzdata=2022a-r0

FROM alpine:3.16.0
RUN apk --update add \
    --no-cache \
    libxml2-utils=2.9.14-r0 \
    ffmpeg=5.0.1-r1\
    curl=7.83.1-r1

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh
RUN chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume