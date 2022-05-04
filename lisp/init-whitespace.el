;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Whitespace handling.
;;

;;; Code:

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; https://emacs.stackexchange.com/questions/54305/show-white-spaces-only-when-region-is-selected
(use-package whitespace4r
  :straight (whitespace4r :type git :host github :repo "twlz0ne/whitespace4r.el"))

(provide 'init-whitespace)
