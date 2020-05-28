;; Themes
;; https://emacsthemes.com/
;; https://github.com/emacs-themes/emacs-themes-site
(load-theme 'wombat t)

;;; Key bindings
(define-key global-map (kbd "C-t") nil) ; C-t は Tmux で使うため無効化
(define-key global-map (kbd "C-x C-o") 'other-window) ; C-x C-o で Window 切り替え
(define-key global-map (kbd "M-c") nil)               ; inactivate M-c
(define-key global-map (kbd "C-h") 'delete-backward-char) ; C-h as backspace

;;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
(define-key global-map (kbd "M-g") 'goto-line) ; M-g で指定行に移動

(fset 'yes-or-no-p 'y-or-n-p)           ; use y/n not yes/no

;; Aliases
(defalias 'exec 'shell-command)
(defalias 'bash 'shell-command)
(defalias 'run 'shell-command)
(define-key global-map (kbd "C-x C-x") 'shell-command) ; C-x C-x で shell-command
(defalias 'remove-space 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil) ; タブでインデントしない https://www.emacswiki.org/emacs/IndentationBasics

;; Mac で Option キーを Meta キーとして使う
(setq mac-option-modifier 'meta)

;; Indicator (Mode line)
(setq display-time-format "| %m/%d %H:%M |") ; 時計のフォーマットを指定
(display-time-mode t)                        ; 時計を表示

;;; コマンド履歴にエイリアス設定 + Lisp mode 起動 (C-x C-e で eval)
(defalias 'hist 'command-history)
(add-hook 'command-history-mode-hook 'lisp-interaction-mode)

;; 他で更新されたら自動で再読み込み
(global-auto-revert-mode 1)
