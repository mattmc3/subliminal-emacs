;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Misc settings that have no better home.
;;

;;; Code:

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold (* 100 1024 1024))

;; always allow 'y' instead of 'yes'
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-misc)
