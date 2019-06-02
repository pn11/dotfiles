(define-key global-map (kbd "C-t") nil) ; inactivate C-t
(define-key global-map (kbd "M-c") nil) ; inactivate M-c
(define-key global-map (kbd "C-h") 'delete-backward-char) ; C-h as backspace

;;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part16
(global-set-key "\M-g" 'goto-line)

;;y/n not yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;Mac option
(setq mac-option-modifier 'meta)
