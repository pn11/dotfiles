# WindowsTerminal

## インストール

Microsoft Store からインストールする。

## `Ctrl+XXX` の割当て変更

`Ctrl` プラス何かがいろいろ割り当てられていて WSL を使うと干渉する(`C-w`でタブを閉じてしまったり、`C-t`で新しいタブが開いてしまったり)。これらは使わなそうなキーバインディングになっていただく。

プロファイルが以下にあるので、書き換える。

`~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\RoamingState\profiles.json`

`"ctrl+w"` を `"ctrl+shift+w"` に、 `"ctrl+t"` を `"ctrl+shift+t"` に変更したのが [`profiles.json`](profiles.json).

