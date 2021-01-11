## 機能概要

radikoのタイムフリー音源を取得、m4aファイルに出力します。

以下のシェルを活用させていただき、持ち運びしやすいようにdockerでコンテナ化したものです。

https://github.com/uru2/rec_radiko_ts



## 動かし方

以下のようにコマンドから起動します。

```
docker run --rm -v /recorder:/usr/volume yamadatt/docker_rec_radiko_ts /usr/local/bin/rec_radiko_ts.sh -s TBS -f 202011031000 -d 1
```

シェルのオプションは[uru2/rec\_radiko\_ts: Radiko timefree program recorder](https://github.com/uru2/rec_radiko_ts)を参照してください。

## Dockerfileについて

できるだけ軽量にしたいため、Alpine Linuxを利用しています。

また、Dockerは以下のバージョンで動作確認しています。

```
docker -v
Docker version 19.03.13, build 4484c46d9d
```


