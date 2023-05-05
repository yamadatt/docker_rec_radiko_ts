FROM alpine:3.17.3 as tzdata
RUN apk --update add \
    --no-cache \
    tzdata=2023c-r0

FROM alpine:3.17.3
RUN apk --update add \
    --no-cache \
    libxml2-utils=2.10.4-r0 \
    ffmpeg=5.1.3-r0\
    curl=8.0.1-r0

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh
RUN chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume
