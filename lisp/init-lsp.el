;;; init-lsp.el --- LSP support via lsp          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; For Emacs >= 27
(setq read-process-output-max (* 1024 1024))

(use-package eglot)
(use-package consult-eglot)

(provide 'init-lsp)
;;; init-lsp.el ends here
