;; dired
;; Thanks to https://qiita.com/l3msh0/items/8665122e01f6f5ef502f
;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)
;; diredバッファでC-sした時にファイル名だけにマッチするように
(setq dired-isearch-filenames t)

;; dired を起動したときに directory を選ぶのが面倒なので default で起動する
;; dired-jump でも実現できるが、一度 dired を起動しないと呼べないので却下
(defun dired-default-directory () 
  (interactive) 
  (dired default-directory))
(define-key global-map (kbd "C-x C-d") 'dired-default-directory)
(define-key global-map (kbd "C-x d") 'dired-default-directory)
;; other-package-settings.el で dired-sidebar に C-x C-d, C-x d を割り当てている

(eval-after-load "dired" '(progn
                            ;; p で上の階層へ (default は 上の行へ)
                            (define-key dired-mode-map (kbd "p") 'dired-up-directory)
                            ;; SPC で中身表示 (Mac の quick look リスペクト。default は 下の行へ)
                            ;;(define-key dired-mode-map (kbd "SPC") 'dired-display-file)
                            ;; SPC で directory tree を表示
                            ;; (dired-display-file は挙動がよく分からないので変更)
                            (define-key dired-mode-map (kbd "SPC") 'dired-subtree-toggle)
                            ;; n, o, C-o で file を開く (default は(略))
                            (define-key dired-mode-map (kbd "n") 'dired-find-file) 
                            (define-key dired-mode-map (kbd "o") 'dired-find-file) 
                            (define-key dired-mode-map (kbd "C-o") 'dired-find-file) 
                            (define-key dired-mode-map (kbd "C-j") 'dired-find-file)
                            ;; dired の buffer を開いたときに最新状態に更新
                            (add-hook 'dired-mode-hook 'revert-buffer)))
