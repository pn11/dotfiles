# WSL

WSL2が出たらいろいろ変わりそう。

## パーミッションまわり

`install_wslconf.sh` を実行して Windows 側のファイルのパーミッションを設定。さらに、`.bashrc` に `umask 022` を記述（本リポジトリでは適用済み）。適用するには WSL のサービスを再起動するか、Windows を再起動。

## ターミナル

wsl terminal を使う。

## Git

WSL の Git を VSCode で使うので、 `install_wslgit.sh` を実行する。ただし WSLGit は現状かなり遅い。WSL2に期待。

## Reference

-[WSL (Windows Subsystem for Linux) の導入と設定 | ラボラジアン](https://laboradian.com/installation-and-setting-of-wsl/)
  - 詳しくて、やりたいことが似てる。
