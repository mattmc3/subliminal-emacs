;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Cross session save/restore.
;;

;;; Code:

;; desktop save mode (session restore)
(setq desktop-dirname user-emacs-directory
      desktop-save t)
(desktop-save-mode 1)

(provide 'init-sessions)
