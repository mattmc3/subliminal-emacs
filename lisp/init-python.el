;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Python.
;;

;;; Code:

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(provide 'init-python)
