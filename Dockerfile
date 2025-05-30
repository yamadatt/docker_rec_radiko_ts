FROM alpine:3.22.0 AS tzdata
RUN apk --update-cache add \
    --no-cache \
    tzdata=2025b-r0

FROM alpine:3.22.0
RUN apk --update-cache add \
    --no-cache \
    curl=8.14.0-r2 \
    ffmpeg=6.1.2-r2 \
    libxml2-utils=2.13.8-r0

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh \
    && chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume
