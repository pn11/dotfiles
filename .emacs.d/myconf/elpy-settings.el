;;; elpy
(use-package 
  elpy 
  :ensure t 
  :init (elpy-enable) 
  (setq elpy-rpc-python-command "python3" python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil) 
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")
  :hook
  ;; elpy 使用時は auto-complete を無効化
  (elpy-mode . (lambda () (auto-commentmplete-mode -1)))
  )
