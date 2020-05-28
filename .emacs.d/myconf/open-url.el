;;; C-o で URL を開くか単語を検索
(defun open-url () 
  (interactive) 
  (let* ((url (thing-at-point 'url))) 
    (message url) 
    (if url (shell-command (concat "open " url)) 
      (search-web "google" (current-word)))))

(define-key global-map (kbd "C-o") 'open-url)
