;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Emacs startup
;;

;;; Code:

;; https://github.com/rougier/dotemacs/blob/master/dotemacs.org
(setq-default
 inhibit-startup-screen t               ; Disable start-up screen
 inhibit-startup-message t              ; Disable startup message
 inhibit-startup-echo-area-message t    ; Disable initial echo message
 initial-scratch-message ""             ; Empty the initial *scratch* buffer
 initial-buffer-choice t)               ; Open *scratch* buffer at init

(provide 'init-startup)
