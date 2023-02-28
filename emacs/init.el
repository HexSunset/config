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
(add-to-list 'completion-styles 'substring)


;; ------------------------
;; --- CUSTOM FUNCTIONS ---
;; ------------------------

;; multi-occur
(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (eq mode major-mode)
          (push buf buffer-mode-matches))))
    buffer-mode-matches))

(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))

;; recent files
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; mark functions
(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
   Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
  This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))

;; reload file from disk
(defun revert-this-buffer ()
  (interactive)
  (revert-buffer nil t t)
  (message (concat "Reverted buffer " (buffer-name))))


;; ------------------
;; --- APPEARANCE ---
;; ------------------
(add-to-list 'custom-theme-load-path "~/.config/emacs/elisp/themes/")
(load-theme 'gruber-darker t) ;; The t makes emacs not ask before loading
(set-face-attribute 'default nil :font "Iosevka Fixed Slab" :height 160)

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
;;(global-visual-line-mode)

(use-package magit)
(use-package dired-x)
(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
        '("~/.config/emacs/snippets/"))
  :bind
  ("C-c SPC" . yas-expand)
  ("C-c TAB" . yas-insert-snippet))
(use-package which-key
  :config
  (which-key-mode))
(use-package ido
  :config
  (setq ido-create-new-buffer 'always)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1))
(use-package recentf
  :config
  (recentf-mode t)
  :bind
  ("C-x C-r" . 'ido-recentf-open))
(use-package find-dired
  :config
  (setq find-ls-option '("-exec ls -ldh {} +" . "-ldh")))
(use-package smex
  :bind
  ("M-x" . 'smex))


;; ----------------
;; --- KEYBINDS ---
;; ----------------

;; kill current buffer
(global-set-key (kbd "C-x C-k") 'kill-current-buffer)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; shell
(global-set-key (kbd "<f1>") 'eshell)

;; find
(setq grep-find-command "find . -type f -exec rg --color=auto -nH --null -e")
(global-set-key (kbd "<f2>") 'rgrep)
(global-set-key (kbd "C-<f2>") 'multi-occur-in-this-mode)

;; revert buffer
(global-set-key (kbd "<f6>") 'revert-this-buffer)

;; other-window
(global-set-key (kbd "M-o") 'other-window)

;; set mark without selection
(global-set-key (kbd "C-`") 'push-mark-no-activate)
(global-set-key (kbd "M-`") 'jump-to-mark)


;; ----------------------
;; --- OTHER SETTINGS ---
;; ----------------------

;; compilation buffer
(setq compilation-scroll-output t)

;; C-n inserts newline at end of buffer
;;(setq next-line-add-newlines t)

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
   '(paredit undo-tree tree-sitter racket-mode auctex zig-mode rainbow-mode org-bullets yasnippet which-key company haskell-mode vterm sudo-edit ac-html systemd markdown-mode use-package smex rust-mode popup magit async)))
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Iosevka Fixed Normal"))))
 '(fixed-pitch-serif ((t (:family "Iosevka Fixed Slab"))))
 '(variable-pitch ((t (:family "Iosevka Etoile")))))
