;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Taskpaper file handler.
;;

;;; Code:

(use-package taskpaper-mode)
(add-to-list 'auto-mode-alist '("\\.todo\\'" . taskpaper-mode))

(provide 'init-taskpaper)
