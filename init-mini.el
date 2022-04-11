;;; init-mini.el --- Minimum Config -*- lexical-binding: t -*-

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

;; Discovering the exact behavior of the below settings is left as an exercise
;; for the reader. Documentation can be found with "C-h o <symbol>".
;; `custom-set-variables' is a good general purpose tool for both setting the
;; value of variables and activating modes.
(custom-set-variables
 '(delete-selection-mode t)
 '(mark-even-if-inactive nil)
 '(ring-bell-function 'ignore)
 '(set-language-environment "UTF-8")
 '(create-lockfiles nil)
 '(make-backup-files nil)
 '(auto-save-default nil)
 '(word-wrap t)
 '(truncate-lines t)
 '(global-auto-revert-mode t)
 '(uniquify-buffer-name-style 'forward)
 '(save-interprogram-paste-before-kill t)
 '(require-final-newline t)
 '(global-auto-revert-mode t))


;;; Package Management

(require 'package)

;; By default, the only source of packages is elpa.gnu.org, but there are tons
;; of great packages on MELPA (a repository of packages). To be able to
;; install those we add the URL to the following variable:
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; A list of all packages you'd like to install. Install packages with
;; `package-install-selected-packages' Remove packages, once removed from this
;; list, with `package-autoremove'.
(setq package-selected-packages
      '(modus-themes
        orderless
        transient
        undo-fu
        vertico
        marginalia
        visual-regexp
        visual-regexp-steroids
        evil-nerd-commenter
        multiple-cursors
        centaur-tabs))

;; I use a lot of transients in this config, so I need to make sure it is
;; loaded and configured before those are declared below.
(autoload 'transient-define-prefix "transient" nil t)
(setq transient-detect-key-conflicts t)

;; Orderless allows for "fuzzy matching" when filtering lists of commands,
;; variables, and functions. This is extremely useful since it is not always
;; easy to predict how those symbols are named.
(setq completion-styles '(orderless))

;; Vertico creates a useful interface for picking things from a list, which
;; is something you do all the time in Emacs.
(vertico-mode)

;; Marginalia displays useful information about completion candidates in
;; Vertico.
(marginalia-mode)

;; Centaur tabs is nice
(centaur-tabs-mode t)
(global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
(global-set-key (kbd "C-<next>") 'centaur-tabs-forward)

;; Set theme
;; vivendi is a dark theme
;; operandi is a light theme
;;(modus-themes-load-operandi)
(modus-themes-load-vivendi)

;; Visual Regexp, and Visual Regexp on Steroids, provides a sensible and
;; predictable search/replace interface using a regular expression engine that
;; you're already familiar with.
(define-key global-map [remap query-replace] 'vr/query-replace)
(with-eval-after-load 'visual-regexp
  (with-eval-after-load 'visual-regexp-steroids
    (custom-set-variables
     '(vr/engine 'pcre2el))))

;;; More settings

;; desktop save mode (session restore)
(setq desktop-dirname user-emacs-directory
      desktop-save t)
(desktop-save-mode 1)

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;; Look-and-feel

;; Make the cursor a bar, not a blinking box
(setq-default cursor-type 'bar)

;; Remove the toolbar
(tool-bar-mode -1)

;; Show line numbers
(global-display-line-numbers-mode)

;; highlight the current line
(global-hl-line-mode +1)

;; Set the font
;; On a Mac, fonts can be found in the FontBook app
(ignore-errors (set-frame-font "MesloLGL Nerd Font 13"))

;;;  Whitespace
;; Create a variable for our preferred tab width
(setq custom-tab-width 4
      custom-tab-width2 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width2)     ;; Javascript

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

(progn
  (setq whitespace-style '(face tabs tab-mark trailing))
  (setq whitespace-display-mappings
    '((tab-mark 9 [9655 9] [92 9])))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

;;; Functions

(defun my/find-user-init-file ()
  "Find the user-init-file."
  (interactive)
  (find-file user-init-file))

(defun my/reload-user-init-file ()
  "Reload the user-init-file."
  (interactive)
  (load user-init-file))

; http://ergoemacs.org/emacs/emacs_auto_save.html
(defun my/save-all-unsaved ()
  "Save all unsaved files without prompting."
  (interactive)
  (save-some-buffers t))

;;; Terminal

;; (global-set-key (kbd "C-`") 'my/vterm-buffer)

;;; Keybindings

;; In the old days ESC was used as a prefix key, but I want ESC to act like it
;; does everywhere else on my system and, you know, escape from things. So
;; I've remapped ESC to `keyboard-quit'.
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

;; Make shift-click extend the selection (region)
(global-set-key [S-down-mouse-1] 'ignore)
(global-set-key [S-mouse-1] 'mouse-save-then-kill)

;; Use M-drag-mouse-1 to create rectangle regions
(global-set-key [M-down-mouse-1] #'mouse-drag-region-rectangle)
(global-set-key [M-drag-mouse-1] #'ignore)
(global-set-key [M-mouse-1]      #'mouse-set-point)

;; Make emacs keybindings work like other Mac apps
;; https://osdn.net/projects/macwiki/svn/view/zenitani/CarbonEmacs/src/lisp/mac-key-mode.el?root=macwiki&view=markup
(global-set-key [(super up)] 'beginning-of-buffer)
(global-set-key [(super down)] 'end-of-buffer)
(global-set-key [(super left)] 'beginning-of-line)
(global-set-key [(super right)] 'end-of-line)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)
;; (global-set-key (kbd "s-/") 'comment-dwim)

;; sublime ⌘-P opens the command window
(global-set-key (kbd "s-P") 'execute-extended-command)

;; multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this-word)
(global-set-key (kbd "s-L") 'mc/edit-ends-of-lines)

;; I am of the opinion that you shouldn't need to learn Emacs's archaic
;; keybindings to use Emacs. You will probably need to eventually but until
;; then there should be an easier way to get around. To me this means
;; interacting with Emacs using responsive visual menus. Below is a 'Main
;; Menu' that offers the primary commands you'll need to get around.

(transient-define-prefix main-menu-transient ()
  "A 'Main Menu' for Emacs."
  ["Main Menu -- Press ESC to exit"
   ["Emacs"
    ("q" "Quit Emacs" save-buffers-kill-terminal)
    ("n" "New Frame" make-frame-command)
    ("o" "Open File" find-file)
    ("s" "Save" save-buffer)
    ("," "Settings" my/find-user-init-file)
    ("e" "Reload Emacs init" my/reload-user-init-file)]
   ["Commands"
    ("z" "Undo" undo-fu-only-undo :transient t)
    ("Z" "Redo" undo-fu-only-redo :transient t)
    ("x" "M-x" execute-extended-command)
    ("h" "Help For..." describe-symbol)
    ("f" "Find" isearch-forward)
    ("r" "Replace" vr/query-replace)]
   ["Buffers"
    ("k" "Kill This Buffer" kill-current-buffer)
    ("b" "Switch to Buffer" switch-to-buffer)
    ("l" "List Buffers" ibuffer)
    "Toggle"
    ("t w" "Wrap Lines" visual-line-mode)
    ("t l" "Line Numbers" display-line-numbers-mode)
    ("t a" "Auto Hard-Wrap Lines" auto-fill-mode)]
   ["Windows"
    ("w h" "Split Horizontal" split-window-below)
    ("w v" "Split Vertical"   split-window-right)
    ("w b" "Balance"    balance-windows)
    ("w k" "Kill" delete-window)
    ("w o" "Kill Others"  delete-other-windows)
    ("w c" "Clone Window" clone-indirect-buffer)
    ("w t" "Tear Off" tear-off-window)]])

;; If you use the Main Menu you'll only ever need to learn one keybinding:
(define-key global-map (kbd "C-<return>") 'main-menu-transient)


;;; End of Config --- Good luck out there!
