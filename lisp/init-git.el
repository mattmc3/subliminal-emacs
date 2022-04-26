;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Git integrations.
;;

;;; Code:

(use-package magit
  :bind ("C-c g" . magit-status))

;; Show word-granularity differences within diff hunks
(setq magit-diff-refine-hunk t)

;; Indication of local VCS changes
(use-package diff-hl
  :init (global-diff-hl-mode))

;; Update the highlighting without saving
(diff-hl-flydiff-mode t)

(provide 'init-git)
