;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Snippets.
;;

;;; Code:

(use-package yasnippet
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))

(provide 'init-snippets)
