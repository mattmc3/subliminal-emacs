(defun subl/open-eshell ()
  "Open an eshell split"
  (interactive)
  (let ((w (split-window-below)))
    (select-window w)
    (eshell))
  (switch-to-buffer "*eshell*"))

(global-set-key (kbd "C-`") 'subl/open-eshell)

(provide 'init-shell)
