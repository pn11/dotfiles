# Karabiner の設定 (El Capitan 以前)

macOS Sierra 以降、[Karabiner](https://pqrs.org/osx/karabiner/) が使えなくなり、 Karabiner Elements の使い方はよくわからないので、El Capitan のままだった MacBook Air (13 inch Mid 2012) を Update (El Capitan -> Mojave)。Karabiner で大した設定をしていなかったので、[⌘英かな](https://ei-kana.appspot.com/) で十分だということが最近分かった。

というわけで Karabiner は卒業したけど、昔の設定を [`karabiner-import.sh`](karabiner-import.sh) に置いた。
下記のリンクのように、以下のコマンドで作れる。

```
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > ~/Desktop/karabiner-import.sh
```

設定してるのは、

- 左右コマンドキー単押しで「英数」「かな」に
- 「英数」、「かな」を左右コマンドキーに
- JISキーボードをUSキーボードとして使う



# Reference

- [Karabinerの設定移行 - Qiita](https://qiita.com/icb54615/items/9c7a5366e23496bfacd5)