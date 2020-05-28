;;;
;;; straight.el (>=Emacs 24.4)
;;; https://github.com/raxod502/straight.el
;;; https://nukosuke.hatenablog.jp/entry/straight-el
;;;
;;; Lock file は M-x straight-freeze-versions で作る
;;; 読み込みは M-x straight-thaw-versions
;;;
(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el"
                                        user-emacs-directory)) 
      (bootstrap-version 5)) 
  (unless (file-exists-p bootstrap-file) 
    (with-current-buffer (url-retrieve-synchronously
                          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                          'silent 'inhibit-cookies) 
      (goto-char (point-max)) 
      (eval-print-last-sexp))) 
  (load bootstrap-file nil 'nomessage))

;;; straight.el と use-package の連携
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;;; MELPA など追加
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") 
                         ("melpa" . "http://melpa.org/packages/") 
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
(package-refresh-contents) ; Takes long time


;; Helm
(use-package 
  helm)
(use-package 
  helm-descbinds)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring) ; M-y で Helm の kill ring 表示
(define-key global-map (kbd "C-x C-f") 'helm-for-files) ; C-x C-f を Helm に置き換え
(define-key global-map (kbd "M-x") 'helm-M-x) ; M-x を Helm に置き換え

;;; auto-complete
(use-package 
  auto-complete)
(when 
    (require 'auto-complete-config nil t) 
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete) 
  (ac-config-default) 
  (setq ac-use-menu-map t) 
  (setq ac-ignore-case nil))
