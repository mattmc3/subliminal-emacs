;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; directory editor options.
;;

;;; Code:

(use-package dired
  :ensure nil
  :straight f)

(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "<mouse-2>") 'dired-find-alternate-file)

(provide 'init-dired)
