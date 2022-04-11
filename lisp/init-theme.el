;; -*- lexical-binding: t -*-

;;; Commentary:

;;
;; Look-and-feel.
;;

;;; Code:

;; (use-package modus-themes)

;; ;; vivendi is a dark theme
;; ;; operandi is a light theme
;; ;;(modus-themes-load-operandi)
;; (modus-themes-load-vivendi)

(use-package all-the-icons)
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t   ; if nil, bold is universally disabled
      doom-themes-enable-italic t)  ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
(load-theme 'doom-vibrant t)

;; Show line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(global-display-line-numbers-mode)

;; Make the cursor a bar, not a blinking box
(setq-default cursor-type 'bar)

;; Remove the toolbar
(tool-bar-mode -1)

;; highlight the current line
(global-hl-line-mode +1)

;; Set the font
;; On a Mac, fonts can be found in the FontBook app
(ignore-errors (set-frame-font "MesloLGL Nerd Font 13"))

(provide 'init-theme)
