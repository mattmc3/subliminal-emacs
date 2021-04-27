(defun my/reload-config ()
  "Reloads emacs configs"
  (interactive)
  (org-babel-load-file (expand-file-name "packages.org" user-emacs-directory))
  (org-babel-load-file (expand-file-name "subliminal.org" user-emacs-directory))
  (org-babel-load-file (expand-file-name "myconfig.org" user-emacs-directory))
  ;; run subliminal
  (subl/init))

(my/reload-config)
(global-set-key (kbd "s-R") 'my/reload-config)
