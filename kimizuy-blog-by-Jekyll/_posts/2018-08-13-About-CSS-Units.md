---
layout: post
title: "rem, em, px などのCSSの単位について"
---
このブログは[Tale](https://github.com/chesterhow/tale)というテーマを使わせてもらっている。もともとは英語での使用を前提にしたテーマなので、そのまま日本語の文章を書いても行間や字間が詰まっていて読みづらい。そこでサイトのデザインをカスタマイズする必要がでてきた。いろいろ調べていくとCSSの単位には絶対単位（px）と相対単位（rem, em, ％）というものがあり、その使い分けでもさまざまだということがわかった。

ここでは役に立った記事と簡単な知見を共有する。

- [CSSのfont-sizeが%とかemとかremとかvwで指定されてると、ビビっちゃう君と僕を救う2分](https://qiita.com/39_isao/items/e8242901ba1aadb75676)
- [CSS3のremとemの違いについて](https://qiita.com/masarufuruya/items/bb40d7e39f56e6c25f0d)
- [フォントサイズの指定方法の基礎知識からレスポンシブに適した指定方法までやさしく解説](http://coliss.com/articles/build-websites/operation/css/css-font-sizing-by-ire.html)
- [あなたはどれにする？CSSの文字サイズ指定「px、em、%」](http://blog.karasuneko.com/html-css/font-size-px-em-percent/)
- [フォントのサイズ指定はpx？ em？ 既存の再検討とこれからのテクニック](http://coliss.com/articles/build-websites/operation/css/font-size-with-rem-by-snook-ca.html)

emと％はほぼ同じ。IE8といった古いブラウザではrem非対応なので以下のようにpxも指定しておく。
{% highlight css %}
html {
  font-size: 62.5%; /* sets the base font to 10px for easier math */
}
 
body {
  font-size: 16px;
  font-size: 1.6rem;  
  /* sets the default sizing to make sure nothing is actually 10px */
}
 
h1 {
  font-size: 32px;
  font-size: 3.2rem;
}
{% endhighlight %}

## まとめ
pxは古いブラウザ用。emや％は直上の要素を参照して自身の大きさを決定するため、コードが入れ子になって複雑になると管理が難しくなる。

一方、remはルート要素を参照するため管理も容易で（古いブラウザには対応していないけど）パソコンやスマホ画面にもレスポンシブに対応できる。基本的には一番新しい単位のremを使ってフォントサイズを決めるのがいいだろう。
