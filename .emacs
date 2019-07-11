;; Key bindings
(define-key global-map (kbd "C-t") nil) ; C-t は Tmux で使うため無効化
(define-key global-map (kbd "C-x C-o") 'other-window) ; C-x C-o で Window 切り替え
(define-key global-map (kbd "M-c") nil) ; inactivate M-c
(define-key global-map (kbd "C-h") 'delete-backward-char) ; C-h as backspace

;;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
(global-set-key "\M-g" 'goto-line)

;; use y/n not yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Mac で Option キーを Meta キーとして使う
(setq mac-option-modifier 'meta)

;; Indicator (Mode line)
;; 時計
(setq display-time-day-and-date t) ; 時間と日付を表示
(setq display-time-24hr-format t) ; 時間を24時間表示
(display-time-mode t) ; 時計を表示

;;
;; straight.el
;; https://github.com/raxod502/straight.el
;; https://nukosuke.hatenablog.jp/entry/straight-el
;;
;; Lock file は M-x straight-freeze-versions で作る
;; 読み込みは M-x straight-thaw-versions
;;
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; straight.el と use-package の連携
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; package 導入
(use-package anything)
;(use-package egg)
(use-package magit)
;(use-package emoji)
(use-package multi-term)
(use-package search-web)

;; auto-complete
(use-package auto-complete)
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))


