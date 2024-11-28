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
(load "tmux-settings.el")
