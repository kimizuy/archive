---
title: "このブログのフォントを決めるうえで役に立った記事一選"
date: "2018-08-16"
---

[【2017 年版】これで間違いなし！font-family のおすすめ設定](http://hikineet.com/font-family/)

です。

実際に使っているソースは以下（紹介記事より抜粋）。
{% highlight css %}
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
@import url(http://fonts.googleapis.com/earlyaccess/notosansjp.css);

body {
font-family: Lato, "Noto Sans JP", "游ゴシック Medium", "游ゴシック体", "Yu Gothic Medium", YuGothic, "ヒラギノ角ゴ ProN", "Hiragino Kaku Gothic ProN", "メイリオ", Meiryo, "ＭＳ Ｐゴシック", "MS PGothic", sans-serif;
}
{% endhighlight %}

[このブログ](https://github.com/kimizuy/kimizuy_blog)の /\_sass/tale/\_variables.scss の位置にコピペして使っている。

## まとめ

英語は Lato、日本語は Noto Sans JP がメイン。「ヒラギノ角ゴ ProN がいいよ！」とか色々な記事を見て紆余曲折を経てきたけれど、これらのフォントは端正で適度に柔らかい雰囲気なうえモダンな印象を受けたので即採用だった。

なぜ[Google Fonts](https://googlefonts.github.io/japanese/)のような Web フォントを使っているのかというと、ユーザの端末環境に依存せず意図しないフォントでの表示を避けるためだ。できるだけ面倒でなく共通して美しい状態のデザインを見せられるので Web フォントは便利である。

あとフォントを変えるとかなりデザインの印象が変わるので、フォントを決めてから行間・字間の順番で調整するのがいいと思う。
