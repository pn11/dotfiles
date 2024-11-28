(load "basic-package-settings.el")

;;; magit git-commit
(when (executable-find "git") 
  (use-package 
    magit) 
  (use-package 
    git-commit))

;;; Markdown mode
(use-package 
  markdown-mode)        ; https://jblevins.org/projects/markdown-mode/
;;; Markdown mode で link を辿るキーバインド
(define-key markdown-mode-map (kbd "C-o") 'markdown-follow-link-at-point)

(use-package 
  multi-term)

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
;; minibuffer で C-j 確定を有効にする
(define-key minibuffer-local-map (kbd "C-j") 'skk-kakutei)

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
(define-key global-map (kbd "C-c C-s") 'yas-insert-snippet)
(defalias 'insert-snippet 'yas-insert-snippet)

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

;; Projectile https://github.com/bbatsov/projectile
(use-package 
  projectile 
  :diminish projectile-mode
  :config
  ;; autostart projectile
  (projectile-mode)
  ;; ignore directories from projectile
  (add-to-list
   'projectile-globally-ignored-directories
   "node_modules")
  (define-key projectile-mode-map
              (kbd "C-c p") 'projectile-command-map)
  ;; enable cache
  (setq projectile-enable-caching t)
  (setq projectile-project-search-path '("~/projects/" "~/work/" ("~/git" . 1)))
  (setq projectile-switch-project-action 'projectile-dired)

  ;; https://github.com/bbatsov/helm-projectile
  (use-package helm-projectile)
  (setq projectile-completion-system 'helm)
  )

;; Swiper https://emacs-jp.github.io/tips/emacs-in-2020#ivy
(use-package
  swiper
  :ensure t
  :config
  (define-key global-map (kbd "C-s") 'swiper) ; C-s を isearch から swiper に変更
  ;;  (setq swiper-include-line-number-in-search t)
  )

(use-package
  vue-mode)

;;; search-web
(use-package 
  search-web
  :config
  (defalias 'web-search 'search-web)     ; web-search をエイリアスに設定
  )

;;; dired-sidbar https://github.com/jojojames/dired-sidebar
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (define-key global-map (kbd "C-x C-d") 'dired-sidebar-toggle-sidebar)
  (define-key global-map (kbd "C-x d") 'dired-sidebar-toggle-sidebar)
  )
