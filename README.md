## 機能概要

radikoのタイムフリー音源を取得します。

以下のシェルを活用させていただき、持ち運びしやすいようにdockerでコンテナ化したものです。

https://github.com/uru2/rec_radiko_ts



## 動かし方

以下のようにコマンドから起動します。

```
docker run --rm -v /recorder:/usr/volume test_radiko /usr/local/bin/rec_radiko_ts.sh -s TBS -f 202011031000 -d 1
```

シェルのオプションはhttps://github.com/uru2/rec_radiko_tsを参照してください。

## Dockerfileについて

できるだけ軽量にしたいため、Alpine Linuxを利用しています。




