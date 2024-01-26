FROM alpine:3.19.0 as tzdata
RUN apk --update-cache add \
    --no-cache \
    tzdata=2023d-r0

FROM alpine:3.19.0
RUN apk --update-cache add \
    --no-cache \
    libxml2-utils=2.11.6-r0 \
    ffmpeg=6.1.1-r0 \
    curl=8.5.0-r0

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh \
    && chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume
