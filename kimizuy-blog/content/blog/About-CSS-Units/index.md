---
title: "rem, em, px などのCSSの単位について"
date: "2018-08-13"
---

このブログは[Tale](https://github.com/chesterhow/tale)というテーマを使わせてもらっている。もともとは英語での使用を前提にしたテーマなので、そのまま日本語の文章を書いても行間や字間が詰まっていて読みづらい。そこでサイトのデザインをカスタマイズする必要に迫られていると、CSS の単位指定をどうすれば良いのか、そういった疑問にぶつかった。

ここでは役に立った記事と簡単な知見を共有する。

- [CSS の font-size が%とか em とか rem とか vw で指定されてると、ビビっちゃう君と僕を救う 2 分](https://qiita.com/39_isao/items/e8242901ba1aadb75676)
- [CSS3 の rem と em の違いについて](https://qiita.com/masarufuruya/items/bb40d7e39f56e6c25f0d)
- [フォントサイズの指定方法の基礎知識からレスポンシブに適した指定方法までやさしく解説](http://coliss.com/articles/build-websites/operation/css/css-font-sizing-by-ire.html)
- [あなたはどれにする？CSS の文字サイズ指定「px、em、%」](http://blog.karasuneko.com/html-css/font-size-px-em-percent/)
- [フォントのサイズ指定は px？ em？ 既存の再検討とこれからのテクニック](http://coliss.com/articles/build-websites/operation/css/font-size-with-rem-by-snook-ca.html)

em と％はほぼ同じ。IE8 といった古いブラウザでは rem 非対応なので以下のように px も指定しておく。
{% highlight css %}
html {
font-size: 62.5%; /_ sets the base font to 10px for easier math _/
}

body {
font-size: 16px;
font-size: 1.6rem;  
 /_ sets the default sizing to make sure nothing is actually 10px _/
}

h1 {
font-size: 32px;
font-size: 3.2rem;
}
{% endhighlight %}

## まとめ

px は古いブラウザ用。em や％は子要素を参照して自身の大きさを決定するため、コードが入れ子になって複雑になると管理が難しくなる。

一方、rem はルート要素を参照するため管理も容易で（古いブラウザには対応していないけど）パソコンやスマホ画面にもレスポンシブに対応できる。基本的には一番新しい単位の rem を使ってフォントサイズを決めるのがいいだろう。
