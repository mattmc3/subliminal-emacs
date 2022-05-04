;;; init.el --- Emacs Config -*- lexical-binding: t -*-

;;; Commentary

;; Based on https://github.com/olivertaylor/dotfiles
;; There are many "Emacs starter kits" out there, this one is mine. It is
;; designed to be exceedingly simple. Just copy this one file to
;; ~/.emacs/init.el and open Emacs. Then install the required packages by
;; typing "M-x package-install-selected-packages".
;;
;; This config targets Emacs 27.1

;;; Quick tips

;; `C-RET':           bring up a basic menu for editing
;; `M-x load-file':   will reload this file to apply changes
;; `M-x eval-buffer': will run the lisp code in a buffer, accomplishing the same thing
;; `C-h k':           will provide help for a key sequence
;; `C-xC-e':          execute the current buffer

;;; Code

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s."
                     (emacs-init-time))))

;; Speed up startup
(setq auto-mode-case-fold nil)

;; Make sure garbage collection gets reset
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Recover GC values after startup."
            (setq gc-cons-threshold (* 16 1024 1024)
                  gc-cons-percentage 0.1)))

;;; Settings

;; There are 2 ways to customize Emacs, one is to edit your init file, which
;; is what this file is, and the other is to customize the settings
;; interactively (like any other program). Interactive customization is saved
;; to your `custom-file'. I, however, don't want any interactive
;; customization to be saved. This is because I want this init file to be the
;; single source of truth for how Emacs behaves. The below makes Emacs save
;; interactive customization in a temp file.
(setq custom-file (make-temp-file "emacs-custom-"))

;;; Package Management
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; first
(require 'init-const)
(require 'init-package)

;; other includes
(require 'init-commenting)
(require 'init-editing-utils)
(require 'init-treeview)
(require 'init-fish)
(require 'init-git)
(require 'init-lisp)
(require 'init-minibuffer)
(require 'init-misc)
(require 'init-multiple-cursors)
(require 'init-projectile)
(require 'init-recentf)
(require 'init-scrolling)
;;(require 'init-sessions)
(require 'init-shell)
(require 'init-snippets)
(require 'init-tabs)
(require 'init-taskpaper)
(require 'init-theme)
(require 'init-undo)
(require 'init-whitespace)

(when sys/macp
  (require 'init-macos))
