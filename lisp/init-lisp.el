;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Lisp language syntax and config.
;;

;;; Code:

;; The default is 600
(setq max-lisp-eval-depth 2000)

;; Always load newest byte code
(setq load-prefer-newer t)

(provide 'init-lisp)
