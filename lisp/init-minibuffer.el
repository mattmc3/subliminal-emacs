;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Minibuffer packages and config.
;;

;;; Code:

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode))

;; Extended completion utilities
(use-package consult
  :config
  (progn
    (setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-ignore-case t)))

(global-set-key [rebind switch-to-buffer] #'consult-buffer)
(global-set-key (kbd "C-c j") #'consult-line)
(global-set-key (kbd "C-c i") #'consult-imenu)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

(provide 'init-minibuffer)
