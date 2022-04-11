;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Better comment handling
;;

;;; Code:

(use-package evil-nerd-commenter
  :bind ("s-/" . evilnc-comment-or-uncomment-lines))

(provide 'init-commenting)
