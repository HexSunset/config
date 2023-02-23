;; -*- lexical-binding: t; -*-
;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
;; █████╗  ██╔████╔██║███████║██║     ███████╗
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
;; Config by Aurora<3


;; -----------------
;; --- INTERFACE ---
;; -----------------

;; Disable unwanted things
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq initial-buffer-choice nil)
(setq frame-title-format nil)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq indicate-empty-lines nil)
(setq cursor-in-non-selected-windows nil)
(setq completion-styles '(basic substring partial-completion emacs22))


;; ------------------
;; --- APPEARANCE ---
;; ------------------
(add-to-list 'custom-theme-load-path "~/.config/emacs/elisp/themes/")
(load-theme 'gruber-darker t) ;; The t makes emacs not ask before loading
(set-face-attribute 'default nil :font "Iosevka" :height 160)
;; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(menu-bar--display-line-numbers-mode-visual)


;; ----------------
;; --- ORG-MODE ---
;; ----------------
(setq org-hide-emphasis-markers t
      org-pretty-entities t)
(setq org-startup-folded t)
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*+]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))


;; ----------------
;; --- PACKAGES ---
;; ----------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; Folder for manually installed packages
(add-to-list 'load-path "~/.config/emacs/elisp/")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(electric-pair-mode)
(global-visual-line-mode)

(use-package magit)
(use-package company
  :config
  (company-mode 1)
  (global-company-mode))
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.config/emacs/snippets/"))
  (global-set-key (kbd "C-c SPC") 'yas-expand)
  (global-set-key (kbd "C-c TAB") 'yas-insert-snippet))
(use-package which-key
  :config
  (which-key-mode))
(use-package ido
  :config
  (setq ido-create-new-buffer 'always)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1))
(use-package smex
  :config
  (global-set-key (kbd "M-x") 'smex))


;; ----------------------
;; --- OTHER SETTINGS ---
;; ----------------------

;; compilation buffer
(setq compilation-scroll-output t)

(global-set-key (kbd "M-o") 'other-window)

;; indentation
(setq indent-tabs-mode nil)
(setq tab-width 4)

;; Make OS clipboard work
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Custom autosave folder
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(paredit god-mode undo-tree tree-sitter racket-mode auctex zig-mode rainbow-mode org-bullets yasnippet which-key company haskell-mode vterm sudo-edit ac-html systemd markdown-mode use-package smex rust-mode popup magit gruvbox-theme async)))
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Iosevka"))))
 '(fixed-pitch-serif ((t (:family "Iosevka"))))
 '(variable-pitch ((t (:family "IBM Plex Sans")))))
