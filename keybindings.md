# キーバインド

Emacs, Tmux, Mac, VS Code, Shell などごちゃまぜ。

- C-a: HOME
- C-b: ↓
- C-c: コマンドを終了 (shell)
- C-d: DEL, logout
- C-e: END
- C-f: →
- C-g: cancel
- C-h: Backspace
- C-i: 割り当てなし
- C-j: Return, 確定、日本語入力に切り換え (SKK)
- C-k: kill line
- C-l: recenter
- C-m: Return
- C-n: ↓
- C-o: Emacs で開いてる buffer 間を移動 (default は C-x o)
- C-p: ↑
- C-q: VS Code で Tmux-like に移動するための prefix
- C-r: reverse incremental search
- C-s: incremental search
- C-t: Tmux 用 Prefix
- C-u:
- C-v: Page Down
- C-w: cut
- C-x: Emacs でよく使う Prefix
- C-y: yank
- C-z: Emacs でよく使う Prefix
- C-SPACE: set mark

- M-b: 前の単語へ
- M-f: 次の単語へ
- M-g: go to line
- M-x: Emacs command 実行

## Tmux

C-t のあとに、

- C-f, C-p, C-n, C-b, f, p, n, b: Pane 間を移動
- 1, 2, 3, ...: 指定の Window に移動
- C-r: session 復元 (tmux-resurrect)
- [: copy mode に入る
- ]: paste

Copy mode 内

- C-w:
- C-SPACE

## Emacs

C-x のあとに、

- 1, 2, 3: 画面分割
- d: dired
- C-f: Open File
- C-j: SKK を起動
