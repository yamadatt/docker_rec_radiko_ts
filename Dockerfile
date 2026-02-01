FROM alpine:3.23.3 AS tzdata
RUN apk --update-cache add \
    --no-cache \
    tzdata=2025c-r0

FROM alpine:3.23.3
RUN apk --update-cache add \
    --no-cache \
    curl=8.17.0-r1\
    ffmpeg=8.0.1-r1 \
    libxml2-utils=2.13.9-r0

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh \
    && chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume
