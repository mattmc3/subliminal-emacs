;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Buffer tabs.
;;

;;; Code:

(use-package centaur-tabs)

;; Centaur tabs is nice
(centaur-tabs-mode t)
(global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

(provide 'init-tabs)
