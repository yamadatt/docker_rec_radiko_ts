FROM alpine:3.18.4 as tzdata
RUN apk --update-cache add \
    --no-cache \
    tzdata=2023c-r1

FROM alpine:3.18.4
RUN apk --update-cache add \
    --no-cache \
    libxml2-utils=2.11.4-r0 \
    ffmpeg=6.0-r15 \
    curl=8.4.0-r0

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh
RUN chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume
