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

;; 日付を入力
(defun insert-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y/%m/%d)")))
(defalias 'date 'insert-date)
(defalias 'today 'insert-date)
;; 時間を入力
(defun insert-time ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%H:%M)")))
(defalias 'time 'insert-time)
(defalias 'now 'insert-time)

;; Split Tmux pane vertically and start emacsclient
(defun tmux-split-vertical()
  (interactive)
  (shell-command (concat "tmux split -v \"emacsclient -t " buffer-file-name "\"")))

;; Split Tmux pane horizontally and start emacsclient
(defun tmux-split-horizontal()
  (interactive)
  (shell-command (concat "tmux split -h \"emacsclient -t " buffer-file-name "\"")))

(define-key global-map (kbd "C-x 2") 'tmux-split-vertical)
(define-key global-map (kbd "C-x 3") 'tmux-split-horizontal)

;; Select the last pane on Tmux
(defun tmux-select-last-pane()
  (interactive)
  (shell-command "tmux last-pane"))

;;(define-key global-map (kbd "C-x o") 'tmux-select-last-pane)
;;(define-key global-map (kbd "C-x C-o") 'tmux-select-last-pane)

;; 他で更新されたら自動で再読み込み
(global-auto-revert-mode 1)

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

;;; MELPA など追加 (for SKK)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
;;;(package-refresh-contents) ; Takes long time

;;; package 導入
(when (executable-find "git")
  (use-package
    magit)
  (use-package
    git-commit))
(use-package
  markdown-mode)        ; https://jblevins.org/projects/markdown-mode/
;;; Markdown mode で link を辿るキーバインド
(define-key markdown-mode-map (kbd "C-o") 'markdown-follow-link-at-point)

(use-package
  multi-term)

;; Helm
(use-package
  helm)
(use-package
  helm-descbinds)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring) ; M-y で Helm の kill ring 表示
(define-key global-map (kbd "C-x C-f") 'helm-for-files) ; C-x C-f を Helm に置き換え

;;; auto-complete
(use-package
  auto-complete)
(when
    (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))

;;; hilight-parentheses
;;; https://www.emacswiki.org/emacs/HighlightParentheses
(use-package
  highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;;; WakaTime
;;; pip install wakatime
;;; brew uninstall wakatime-cli
;;; write API key in ~/.wakatime.cfg
(use-package
  wakatime-mode)
(global-wakatime-mode)

;;; Emoji with auto-complete
;;; Enable in text-mode and Markdown mode
;;; Need Markdown mode package
(use-package
  ac-emoji)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'markdown-mode)
(add-to-list 'ac-modes git-commit-mode)
(add-hook 'text-mode-hook 'ac-emoji-setup)
(add-hook 'markdown-mode-hook 'ac-emoji-setup)
(add-hook 'git-commit-mode-hook 'ac-emoji-setup)


(setq viper-mode nil)
;;; SKK
;;; C-x j または C-x C-j で IM を ON
;;; q でカタカナに切り換え
;;; l で英字に切り換え
(use-package
  ddskk
  :ensure t
  :defer t
  :bind (("C-x j"   . skk-mode)
         ("C-x C-j" . skk-mode))
  :init (require 'ccc))
(define-key global-map (kbd "C-x C-j") 'skk-mode) ; 上記の use-package のマクロで効かないので再度
;;(use-package ac-skk) ; 使いかたが分からなかった https://github.com/myuhe/ac-skk.el https://lurdan.hatenablog.com/entry/20171225/1514129460
;;(ac-skk-enable)

;;; rectangle edit
;;; 矩形選択の default key binding (C-RET) は Teminal では動かないため C-X SPC を割り当てる
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;;; yasnippet
;;; Quma-style key bindings
;;; https://www-he.scphys.kyoto-u.ac.jp/member/shotakaha/dokuwiki/doku.php?id=toolbox:emacs:yasnippet:start#%E8%A8%AD%E5%AE%9A
(use-package
  yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
              ("C-x i i" . yas-insert-snippet)
              ("C-x i n" . yas-new-snippet)
              ("C-x i v" . yas-visit-snippet-file)
              ("C-x i l" . yas-describe-tables)
              ("C-x i g" . yas-reload-all))
  :config (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-ido-prompt)))
(use-package
  yasnippet-snippets)
(define-key global-map (kbd "C-c C-s") 'yas-insert-snippet)

                                        ; elpy
(use-package
  elpy
  :ensure t
  :init (elpy-enable)
  (setq elpy-rpc-python-command "python3" python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter"))


;;; Formatter
;;;  https://github.com/purcell/reformatter.el
;;;  https://erick.navarro.io/blog/creating-an-emacs-formatter-the-easy-way/
(use-package
  reformatter)
;;; XML
(when (executable-find "xmllint")
  (reformatter-define xml-format
    :program "xmllint"
    :args '("--pretty" "1" "-")         ; 標準入力から読む
    )
  (add-hook 'nxml-mode-hook (lambda()
                              (define-key nxml-mode-map (kbd "C-c C-f") 'xml-format-buffer))))
;;; Elisp
(use-package
  elisp-format)
(define-key emacs-lisp-mode-map (kbd "C-c C-f") 'elisp-format-buffer)


;;; Projectile https://github.com/bbatsov/projectile
(use-package
  projectile
  :diminish projectile-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;;; search-web
(use-package
  search-web)
(defalias 'web-search 'search-web)     ; web-search をエイリアスに設定

;;; C-o で URL を開くか単語を検索
(defun open-url ()
  (interactive)
  (let* ((url (thing-at-point 'url)))
    (message url)
    (if url (shell-command (concat "open " url))
      (search-web "google" (current-word)))))

(define-key global-map (kbd "C-o") 'open-url)
