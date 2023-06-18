;; -*- lexical-binding: t; -*-
;; ███████╗███╗   ███╗ █████╗  ██████╗███████╗
;; ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
;; █████╗  ██╔████╔██║███████║██║     ███████╗
;; ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
;; ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
;; ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝
;; Aurora's config <3

;; --- Fix defaults
(setq inhibit-startup-message t
      visible-bell nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; --- Appearance
;; we change default-frame-alist so that the appearance gets used by all spawned frames
(add-to-list 'default-frame-alist
             '(font . "Iosevka Fixed Slab-16")
	     '(tab-width . 4))

(require 'gruber-darker-theme)
(load-theme 'gruber-darker t)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq tab-width 4)


;; --- Packages
(require 'package)
(add-to-list 'package-archives
		 '("melpa" . "https://melpa.org/packages/") t)

(require 'smex)
(require 'which-key)
(require 'company)
(require 'ido)
(require 'magit)
(require 'eglot)


;; --- Hooks
(add-hook 'dired-load-hook (function (lambda () (load "dired-x"))))


;; --- Variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq make-backup-files nil)

;; Revert Dired and other non-file buffers
(setq global-auto-revert-non-file-buffers t)

;; Enable `a` keybind in dired
(put 'dired-find-alternate-file 'disabled nil)


;; --- Minor modes
(which-key-mode)
(global-company-mode)
(ido-everywhere)
(save-place-mode 1)
(global-auto-revert-mode 1)


;; --- Keybinds
(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-x C-f") 'ido-find-file)

(global-set-key (kbd "C-x C-k") 'kill-current-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-<tab>") 'company-complete)
