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
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq initial-buffer-choice nil)
(setq frame-title-format nil)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq indicate-empty-lines nil)
(setq cursor-in-non-selected-windows nil)
(setq completion-styles '(basic substring))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)


;; ------------------
;; --- APPEARANCE ---
;; ------------------
(add-to-list 'custom-theme-load-path "~/.config/emacs/elisp/themes/")
(load-theme 'gruber-darker t) ;; The t makes emacs not ask before loading
(set-face-attribute 'default nil :font "Iosevka" :height 160)

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

(use-package magit)
(use-package company
  :ensure
  :config
  (company-mode 1)
  (global-company-mode)
  )
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package which-key
  :ensure
  :config
  (which-key-mode))


;; ----------------------
;; --- OTHER SETTINGS ---
;; ----------------------

;; tab width
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
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
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(rainbow-mode company-quickhelp org-bullets yasnippet which-key company haskell-mode vterm sudo-edit ac-html systemd markdown-mode use-package smex rust-mode popup magit gruvbox-theme async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 162 :width normal :foundry "UKWN" :family "Iosevka")))))
(put 'dired-find-alternate-file 'disabled nil)
