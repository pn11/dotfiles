# dotfiles

## submodule

Init

```sh
git submodule update --init --recursive
```

pull

```sh
git pull --recurse-submodules
```

## AquaSKK

- `Ctrl-j` が Chrome, PowerPoint, SimpleNote などで他の動作になってしまう
- このためにこれらのアプリでは [Karabiner の設定](karabiner/karabiner.json)で `Ctrl-j` が `Ctrl-Option-j` になるようにし、このキーバインドで AquaSKK の漢字モードが起動するようにする ([AquaSKKの設定(private repository)](../dotfiles-private/AquaSKK/keymap.conf))
  - AquaSKK の `keymap.conf` で`SKK_JMODE		ctrl::j||ctrl::alt::j` のようにする
  - なお、 Magnet を使っていると `Ctrl-Option-j` はウィンドウを左下に移動するショートカットに割当てられているので注意。

## xkb

### 設定の表示

```sh
setxkbmap -print -verbose 10
```

### 設定の書き出し

```sh
xkbcomp -xkb $DISPLAY
```
