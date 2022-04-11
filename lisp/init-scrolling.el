;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Scrolling config.
;;

;;; Code:

(setq scroll-step 1
      scroll-margin 30
      scroll-conservatively 100000
      auto-window-vscroll nil
      scroll-preserve-screen-position t)
(scroll-bar-mode -1)

(provide 'init-scrolling)
