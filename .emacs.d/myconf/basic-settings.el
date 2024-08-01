;; Themes
;; https://emacsthemes.com/
;; https://github.com/emacs-themes/emacs-themes-site
(load-theme 'wombat t)

;;; Key bindings
(define-key global-map (kbd "C-t") nil) ; C-t は Tmux で使うため無効化
(define-key global-map (kbd "C-x C-o") 'other-window) ; C-x C-o で Window 切り替え
(if window-system
    (define-key global-map (kbd "C-x C-c") nil) ; GUI では C-x C-c を無効化
    nil
    )
(define-key global-map (kbd "M-c") nil)               ; inactivate M-c
(define-key global-map (kbd "C-h") 'delete-backward-char) ; C-h as backspace

;;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
(define-key global-map (kbd "M-g") 'goto-line) ; M-g で指定行に移動

(define-key global-map (kbd "s-x") 'kill-region) ; cmd-x でカット
(define-key global-map (kbd "s-c") 'kill-ring-save) ; cmd-c でコピー
(define-key global-map (kbd "s-v") 'yank) ; cmd-v で貼り付け
(define-key global-map (kbd "C-<return>") 'toggle-frame-fullscreen) ; C-return で全画面表示  (Not Mac native fullscreen)
(define-key global-map (kbd "s-<return>") 'toggle-frame-fullscreen) ; cmd-return で全画面表示 (Not Mac native fullscreen)


;; Mac で Option キーを Meta キーとして使う
(setq mac-option-modifier 'meta)
;; Mac で Cmd キーを Super キーとして使う
(setq mac-command-modifier 'super)

(fset 'yes-or-no-p 'y-or-n-p)           ; use y/n not yes/no

;; Aliases
(defalias 'exec 'shell-command)
(defalias 'bash 'shell-command)
(defalias 'run 'shell-command)
(define-key global-map (kbd "C-x C-x") 'shell-command) ; C-x C-x で shell-command
(defalias 'remove-space 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil) ; タブでインデントしない https://www.emacswiki.org/emacs/IndentationBasics

;; Indicator (Mode line)
(setq display-time-format "| %m/%d %H:%M |") ; 時計のフォーマットを指定
(display-time-mode t)                        ; 時計を表示

;;; コマンド履歴にエイリアス設定 + Lisp mode 起動 (C-x C-e で eval)
(defalias 'hist 'command-history)
(add-hook 'command-history-mode-hook 'lisp-interaction-mode)

;; 他のエディタで更新されたら自動で再読み込み
(global-auto-revert-mode 1)

;; init.el を再読み込みする関数
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))
