FROM alpine:3.21.2 AS tzdata
RUN apk --update-cache add \
    --no-cache \
    tzdata=2024b-r1

FROM alpine:3.21.2
RUN apk --update-cache add \
    --no-cache \
    curl=8.11.1-r0 \
    ffmpeg=6.1.2-r1 \
    libxml2-utils=2.13.4-r3

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh \
    && chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume
