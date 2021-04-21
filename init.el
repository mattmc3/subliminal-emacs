(defun my/reload-config ()
  "Reloads emacs configs"
  (interactive)
  (org-babel-load-file "~/.config/emacs/myconfig.org")
  (org-babel-load-file "~/.config/emacs/subliminal.org"))

(my/reload-config)
(global-set-key (kbd "s-R") 'my/reload-config)
