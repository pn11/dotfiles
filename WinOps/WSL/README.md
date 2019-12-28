# WSL

以下を実行して初期設定する。

```sh
curl -fsSL https://raw.githubusercontent.com/pn11/dotfiles/master/WinOps/WSL/init.sh
```

以下 WSL についてのメモ。WSL2が出たらいろいろ変わりそう。

## パーミッションまわり

`install_wslconf.sh` を実行して Windows 側のファイルのパーミッションを設定。さらに、`.bashrc` に `umask 022` を記述（本リポジトリでは適用済み）。適用するには WSL のサービスを再起動するか、Windows を再起動。

## ターミナル

~~wsl terminal を使う。~~ まだ不満は多いものの今後に期待ということで Windows Terminal を使っている。

## Git

~~WSL の Git を VSCode で使うので、 `install_wslgit.sh` を実行する。ただし WSLGit は現状かなり遅い。WSL2に期待。~~ VSCode Remote で WSL の git が使えるようになった。 

## 環境変数

`WSLPATH` という環境変数を Windows 側に設定すると指定した環境変数を WSL でも使える。例えば以下のようにする。

```
WSLENV=USERPROFILE/w
```

- [Share Environment Vars between WSL and Windows | Windows Command Line Tools For Developers](https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/)

## Reference

- [WSL (Windows Subsystem for Linux) の導入と設定 | ラボラジアン](https://laboradian.com/installation-and-setting-of-wsl/)
  - 詳しくて、やりたいことが似てる。
- [WSL用ユーティリティ「wslu」を使ってみる | ラボラジアン](https://laboradian.com/try-wslu/)
