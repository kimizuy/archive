---
title: "Electronでアプリを作った"
date: "2018-08-30"
---

Electron でデスクトップ時計アプリを作った。
Mac のみ、アルファ版だけど[ダウンロード](https://github.com/kimizuy/minimal-desktop-clock/releases/tag/v0.0.1-alpha)はできる。

## 機能

- アナログ時計での表示
- アプリを起動するとディスプレイの左上に表示
- ほかのウィンドウの一番上に表示
- 拡大・縮小表示

## できないこと

- フルスクリーン状態のほかのアプリの上には表示されない
- 場所の移動や AlwaysOnTop の切り替えなどはできない

## Electron を触ってみてわかったこと

「[フルスクリーン状態のほかのアプリの上には表示されない](https://github.com/electron/electron/issues/10078)」問題は Electron 側の API の不具合なのか解決されていないことがわかった。

また、Electron-Packager などで配布用にバンドルすると"Hello World"を表示するだけのアプリでも 100MB 以上になってしまう。これは実際に使われていない node_module などのファイルまで一緒にバンドルしてしまうからで、調べた限りこれも解決されていない。

## まとめ

Electron は GitHub や Skype のクライアントアプリなどに採用されている。Javascript, HTML/CSS でデスクトップアプリを作るにはかなり便利で手軽なフレームワークだと感じた。もうちょっと色々試してみたいと思う。
