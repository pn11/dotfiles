# Chocolatey

## Installation of Chocolatey

```
Set-ExecutionPolicy RemoteSigned # PS1 実行有効化
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))  # Chocolatey インストール
```

## Installation of packages

Mac とかはどのマシンも同じ環境にしたいので、Brewfile で管理すれば良いんだけど、Windows だと持ち歩き用とかゲーム用とか用途に応じてインストールするものを変えたい。一括だと

- [Chocolateyを使って端末をセットアップした - くんすとの備忘録](https://kunst1080.hatenablog.com/entry/2015/04/04/235650)

のような方法があるけど、ひとまずはインストールしているやつをメモ。



### 汎用ツール

とりあえずどのマシンにも入れるもの。

```
choco install -y vscode dropbox notepadplusplus googlejapaneseinput googlechrome simplenote everything 7zip.install wox hyper
```

- Wox は Python3 に依存していて自動でインストールされる。Wox はインストールしたら設定画面で `Hide Wox on startup`, `Hide Wox when focus is lost` `Remember last launch location` にチェック。
- 7zip のポータブル版の場合は `choco install -y 7zip.portable`
- 会社では Lhaplus を推奨されるのだが、Chocolatye の Lhaplus はメンテされていなくて not approved となっている。`choco install -y lhaplus`
- AutoHotKey も入れたいがエラーになることがあるらしい。([ChocolateyでのAutoHotkeyインストールがエラーになる件 - とある器用貧乏の技術メモ](http://techmeou.hatenadiary.jp/entry/2016/10/06/005430)) `choco install -y autohotkey`

### 画像系

```
choco install -y mpc-hc
choco install -y irfanview
```

### プログラミング系


#### Git for Windows

最近は WSLGit を使っているので使ってない。

```
choco install -y git
```


#### IntelliJ IDEA Community

```
choco install -y intellijidea-community
```

#### PyCharm Community

```
choco install -y pycharm-community
```

#### miniconda

```
choco install -y miniconda
```

#### CMake

```
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=User' # カレントユーザーのパスに追加する
```

#### Docker

##### DockerCE

```
choco install docker-for-windows
```

##### Docker Toolbox

```
choco install docker-toolbox
```

#### Unity

Unity Hub はまだ Chocolatey にない。関連ソフトは

```
choco install -y blender
choco install -y androidstudio
```

#### Doxygen

```
choco install doxygen.install
choco install doxygen.portable
```

#### VcXsrv

```
choco install -y vcxsrv
```


#### Remote Access

```
choco install -y tightvnc
choco install -y teamviewer
choco install -y winscp.install
```

#### PDF 

```
choco install -y adobereader
choco install -y foxitreader
```

# その他

#### Avast

```
choco install -y avastfreeantivirus
```

#### RapidEE

```
choco install -y rapidee
```

#### Boostnote

```
choco install -y boostnote
```

#### steam

```
choco install -y steam
```

#### WinDirStat

```
choco install -y windirstat # ポータブル版が良かったけどない。
```

#### ScreenToGif

```
choco install -y screentogif
```

#### Zotero

```
choco install -y zotero-standalone
```

### 欲しいけど Chocolatey にないもの

- Marp
- draw.io : ないけど Online で使えば不要
- Fenrir FS
- Unity Hub 
- flux
- gnuplot

## Microsoft Store で入れるもの

- Ubuntu
- Evernote
- LINE
- Slack

## Chocolatey と Store 以外で入れるもの

- Visual Studio
- Microsoft Office
