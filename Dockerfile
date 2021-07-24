FROM alpine:3.14.0 as tzdata
RUN apk --update add \
    --no-cache \
    tzdata

FROM alpine:3.14.0
RUN apk --update add \
    --no-cache \
    libxml2-utils \
    ffmpeg \
    curl

COPY --from=tzdata /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN curl -s -o /usr/local/bin/rec_radiko_ts.sh -LO https://raw.githubusercontent.com/uru2/rec_radiko_ts/master/rec_radiko_ts.sh
RUN chmod +x /usr/local/bin/rec_radiko_ts.sh

WORKDIR /usr/volume