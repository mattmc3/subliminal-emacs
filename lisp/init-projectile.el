;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Projectile configurations.
;;

;;; Code:

(use-package projectile
  :bind (:map projectile-mode-map
         ("s-t" . projectile-find-file) ; `cmd-t' or `super-t'
         ("C-c p" . projectile-command-map))
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-mode-line-prefix " Proj"
        projectile-sort-order 'recentf
        projectile-use-git-grep t)
)

(when (executable-find "rg")
  (setq-default projectile-generic-command "rg --files --hidden"))

(provide 'init-projectile)
