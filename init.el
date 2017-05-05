;;;; settings for server

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defun auto-install-package (pkg)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg)))

(defun auto-install-packages (pkgs)
  (dolist (p pkgs)
    (auto-install-package p)))


(setq inhibit-startup-message t)

;; indent with spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4 indent-tabs-mode nil)

(transient-mark-mode)

;; show correspond paren
(show-paren-mode)

(define-key key-translation-map [?\C-h] [?\C-?])

(auto-install-package 'visual-regexp)
(require 'visual-regexp)

(auto-install-package 'slime)
(require 'slime)

(setq slime-net-coding-system 'utf-8-unix)

(setq slime-lisp-implementations
      '((ros ("ros" "-Q" "run"))))

(setq slime-contribs '(slime-fancy))
(slime-setup)
(slime-autodoc-mode)

(auto-install-package 'paredit-mode)
(require 'paredit-mode)

(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'slime-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
