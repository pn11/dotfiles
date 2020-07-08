#!/bin/bash
# 一応書きためているけど、動かないものも多そう。
# reference:
# https://qiita.com/ryuichi1208/items/5905240f3bfce793b33d
# https://github.com/ryuichi1208/dotfiles/blob/master/mac/macos/.macos
# https://amasuda.xyz/post/2016-10-23-mastering-mac-defaults-command/
# https://qiita.com/ry0f/items/f2c75f0a77b1012182d6
# https://apple.stackexchange.com/questions/91679/is-there-a-way-to-set-an-application-shortcut-in-the-keyboard-preference-pane-vi

# 自動大文字の無効化
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# 自動スペリング訂正の無効化
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

## Finder

# デフォルトで隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true
# 全ての拡張子のファイルを表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# 名前で並べ替えを選択時にディレクトリを前に置くようにする
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# 検索時にデフォルトでカレントディレクトリを検索
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Show the ~/Library folder
chflags nohidden ~/Library

killall Finder

# Dock を自動で隠す
defaults write com.apple.dock autohide -bool true
killall Dock

# Safari で開発者モードの表示
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# Photos.app (写真.app) の自動起動無効化
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Menu bar の表示項目の設定
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/User.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Displays.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu" \
"/System/Library/CoreServices/Menu Extras/VPN.menu"
killall SystemUIServer
#"/System/Library/CoreServices/Menu Extras/AirPort.menu"

# https://apple.stackexchange.com/questions/110277/how-to-enable-three-finger-drag-from-command-line
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

