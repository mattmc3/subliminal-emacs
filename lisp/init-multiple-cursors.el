;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Multi-cursor support.
;;

;;; Code:

(use-package multiple-cursors)

;; Keybindings
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this-word)
(global-set-key (kbd "s-L") 'mc/edit-ends-of-lines)

(provide 'init-multiple-cursors)
