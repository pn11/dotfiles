(setq-default ispell-program-name "aspell")
;; Ignore TeX commands in Aspell https://texwiki.texjp.org/?Aspell#aemcsfoi
(eval-after-load "ispell" '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

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

;; project.el https://github.com/emacs-mirror/emacs/blob/master/lisp/progmodes/project.el
;;(use-package project)
