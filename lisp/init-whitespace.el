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

(progn
  (setq whitespace-style '(face tabs tab-mark trailing))
  (setq whitespace-display-mappings
    '((tab-mark 9 [9655 9] [92 9])))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

(provide 'init-whitespace)
