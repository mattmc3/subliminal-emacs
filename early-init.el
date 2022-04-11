;;; early-init.el --- -*- lexical-binding: t -*-

;; Documentation: (info "(emacs) Early Init File")
;;                (info "(emacs) Package Installation")

;; Unless 'package-enable-at-startup' is set to 'nil' Emacs will automatically
;; "activate" all installed packages after early-init.el but before init.el.
;; To prevent an installed package from loading at startup, customize the
;; `package-load-list' like this:
;; (setq package-load-list '((org-journal nil) all))
(setq package-enable-at-startup nil)

;; Set these settings before the GUI frame is created.

;; References
;; - https://github.com/hlissner/doom-emacs/blob/master/early-init.el
;; - https://github.com/seagle0128/.emacs.d/blob/master/early-init.el
;; - https://github.com/purcell/emacs.d/blob/master/early-init.el

(setq tool-bar-mode nil
      menu-bar-mode t)

;;(scroll-bar-mode 0)

;; Switch off garbage collection (will be switched on later).
;; This is step 1 of 2. Step 2 is in init.
;; Taken from Doom Emacs (https://github.com/hlissner/doom-emacs/blob/master/docs/faq.org#how-does-doom-start-up-so-quickly)
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(setq package-quickstart t)

;; Premature redisplays can substantially affect startup times and produce
;; ugly flashes of unstyled Emacs.
(setq-default inhibit-redisplay t
              inhibit-message t)
(add-hook 'window-setup-hook
      (lambda ()
            (setq-default inhibit-redisplay nil
                          inhibit-message nil)
            (redisplay)))

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize t)

;; Faster to disable these here (before they've been initialized)
;;(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(when (featurep 'ns)
  (push '(ns-transparent-titlebar . t) default-frame-alist))

;; Contrary to what many Emacs users have in their configs, you don't need
;; more than this to make UTF-8 the default coding system:
(set-language-environment "UTF-8")

;; set-language-enviornment sets default-input-method, which is unwanted
(setq default-input-method nil)

;; end early-init.el
