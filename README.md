# Nerves を使って idobata にメッセージをポストするサンプル

## idobata とは？ / Nerves とは？

- [idobata](https://idobata.io/ja/home)
- [Craft and deploy bulletproof embedded software in Elixir — Nerves Project](https://nerves-project.org)


## 確認した環境

Raspberry Pi Zero WH を利用して動作を確認しました。

また、idobata にポストするために自作の [`ex_idobata`](https://github.com/mattsan/ex_idobata) を利用しています。

## ディレクトリ

- `messenger` - idobata に定期的にメッセージをポストするためのプロジェクトです。
- `firmware` - Nerves のプロジェクトです。
- `local` - messenger の動作をローカルで確認するためのプロジェクトです。

## 設定から実行まで

### 環境変数

次の環境変数を設定してください。

| variable | description |
|---|---|
| `MIX_TARGET` | ターゲットデバイス |
| `IDOBATA_HOOK` | idobata にカスタムフックの URL の ROOM UUID |
| `NERVES_NETWORK_SSID` | WiFi の SSID |
| `NERVES_NETWORK_PSK` | WiFi のパスワード |

`MIX_TARGET` の設定については Nerves のページを参照してください。

- [Targets](https://hexdocs.pm/nerves/targets.html)

（確認していませんが）ワイヤードで接続する場合は WiFi の設定は不要です（たぶん）。

### ビルドと実行

平凡な Nerves プロジェクトですので、環境変数を設定したら標準の手順にしたがってファームウェアを microSD に書き込み、その microSD からデバイスを起動してください。

```sh
$ cd firmware
$ mix deps.get
$ mix firmware
$ mix firmware.burn
```
