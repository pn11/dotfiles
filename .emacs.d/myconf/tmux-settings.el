(if (window-system)
    (progn ; For GUI Emacs
     (define-key global-map (kbd "C-t C-f") 'windmove-right)
     (define-key global-map (kbd "C-t C-n") 'windmove-down)
     (define-key global-map (kbd "C-t C-b") 'windmove-left)
     (define-key global-map (kbd "C-t C-p") 'windmove-up)
     (define-key global-map (kbd "C-t x") 'delete-window)
     (define-key global-map (kbd "C-t k") 'delete-window)
     (define-key global-map (kbd "C-t -") 'split-window-below)
     (define-key global-map (kbd "C-t |") 'split-window-right)
     )
  (progn ; For Terminal Emacs
   ;; Split Tmux pane vertically and start emacsclient
   (defun tmux-split-vertical()
     (infteractive)
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
   ))
