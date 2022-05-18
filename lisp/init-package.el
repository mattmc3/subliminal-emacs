;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Emacs Package management configurations.
;;

;;; Code:

;; https://github.com/raxod502/straight.el#integration-with-use-package
;; https://github.com/jwiegley/use-package

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t
      use-package-always-ensure t
      straight-check-for-modifications nil)

(provide 'init-package)
