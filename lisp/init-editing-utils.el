;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Editing configuration
;;

;;; Code:

(setq-default
 auto-save-default nil
 blink-cursor-interval 0.4
 bookmark-default-file (locate-user-emacs-file ".bookmarks.el")
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 create-lockfiles nil
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 mark-even-if-inactive nil
 mouse-yank-at-point t
 require-final-newline t
 ring-bell-function 'ignore
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines t
 truncate-partial-width-windows nil
 uniquify-buffer-name-style 'forward
 word-wrap t)

(add-hook 'after-init-hook 'delete-selection-mode)

(add-hook 'after-init-hook 'global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; In the old days ESC was used as a prefix key, but I want ESC to act like it
;; does everywhere else on my system and, you know, escape from things. So
;; I've remapped ESC to `keyboard-quit'.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Make shift-click extend the selection (region)
(global-set-key [S-down-mouse-1] 'ignore)
(global-set-key [S-mouse-1] 'mouse-save-then-kill)

;; Use M-drag-mouse-1 to create rectangle regions
(global-set-key [M-down-mouse-1] #'mouse-drag-region-rectangle)
(global-set-key [M-drag-mouse-1] #'ignore)
(global-set-key [M-mouse-1]      #'mouse-set-point)

;; make home and end work
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(provide 'init-editing-utils)
