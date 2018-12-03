# Desktop Linux での Mozc の設定

コマンド一発で設定したいけど、簡単にはできなそうなのでおとなしくエクスポート&
インポートする。以下は自動化できないかと少し調べたメモ。

## 設定画面のコマンド呼び出し

Mozc の設定画面は以下のコマンドで開ける。

```
/usr/lib/mozc/mozc_tool --mode=config_dialog
```

他にも `/usr/lib/mozc/mozc_tool --mode=dictionary_tool` とかができる。ソースは以下。

- [mozc/mozc_tool_libmain.cc at master · google/mozc · GitHub](https://github.com/google/mozc/blob/master/src/gui/tool/mozc_tool_libmain.cc)

## Mozc の設定ファイル

Mozc の設定ファイルは `~/.mozc` 以下にある。

```bash
$ ls ~/.mozc
# boundary.db  cform.db  segment.db  user_dictionary.db
```

これらは ProtoBuf らしく、例えば以下のソースにフォーマットが定義されているので、読み書きするコマンドを書けなくはない。

- [mozc/config.proto at master · google/mozc · GitHub](https://github.com/google/mozc/blob/master/src/protocol/config.proto)


## Reference

- [My Future Sight for Past: Google日本語入力（Mozc）のIME設定をWindows・Linux・Androidで同期](http://myfuturesightforpast.blogspot.com/2015/08/googlemozcimewindowslinuxandroid.html)