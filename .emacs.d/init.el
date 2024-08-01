(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/myconf")

(load "basic-settings")
(load "dired-settings")
(load "other-settings")

(if (version< emacs-version "25.1")
    (load "use-package-settings")
  (progn (load "basic-package-settings")
         (load "elpy-settings")
         (load "other-package-settings")))

(load "open-url")
(if window-system
    nil
    (load "tmux-settings.el")         ; C-x 2 などで Tmux の画面分割を使う (Terminal で 起動しているときのみ)
    )
