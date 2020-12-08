;;; MELPA など追加
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(package-refresh-contents) ; Takes long time

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; elpy
(use-package
  elpy )
;  :ensure t
;:init (elpy-enable)
;  (setq elpy-rpc-python-command "python3" python-shell-interpreter "jupyter"
;        python-shell-interpreter-args "console --simple-prompt"
;        python-shell-prompt-detect-failure-warning nil)
;  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter"))

;; Helm, autocomplete, highlight-parenthesis > 25.5