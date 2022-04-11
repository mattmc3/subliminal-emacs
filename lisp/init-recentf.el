;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Recent file tracking.
;;

;;; Code:

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(provide 'init-recentf)
