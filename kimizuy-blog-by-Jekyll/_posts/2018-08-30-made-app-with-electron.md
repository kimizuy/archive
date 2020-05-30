---
layout: post
title: "Electronでアプリを作った"
---
Electronでデスクトップ時計アプリを作った。
Macのみ、アルファ版だけど[ダウンロード](https://github.com/kimizuy/minimal-desktop-clock/releases/tag/v0.0.1-alpha)はできる。

## 機能
- アナログ時計での表示
- アプリを起動するとディスプレイの左上に表示
- ほかのウィンドウの一番上に表示
- 拡大・縮小表示

## できないこと
- フルスクリーン状態のほかのアプリの上には表示されない
- 場所の移動やAlwaysOnTopの切り替えなどはできない

## Electronを触ってみてわかったこと
「[フルスクリーン状態のほかのアプリの上には表示されない](https://github.com/electron/electron/issues/10078)」問題はElectron側のAPIの不具合なのか解決されていないことがわかった。

また、Electron-Packagerなどで配布用にバンドルすると"Hello World"を表示するだけのアプリでも100MB以上になってしまう。これは実際に使われていないnode_moduleなどのファイルまで一緒にバンドルしてしまうからで、調べた限りこれも解決されていない。

## まとめ
ElectronはGitHubやSkypeのクライアントアプリなどに採用されている。Javascript, HTML/CSSでデスクトップアプリを作るにはかなり便利で手軽なフレームワークだと感じた。もうちょっと色々試してみたいと思う。