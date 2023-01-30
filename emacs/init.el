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
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq initial-scratch-message nil)
(setq initial-buffer-choice nil)
(setq frame-title-format nil)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
;; (setq pop-up-windows nil)
(setq indicate-empty-lines nil)
(setq cursor-in-non-selected-windows nil)
;; (setq initial-major-mode 'text-mode)
(setq default-major-mode 'text-mode)
(setq completion-styles '(basic substring))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)


;; ------------------
;; --- APPEARANCE ---
;; ------------------
(set-face-attribute 'default nil :font "Iosevka" :height 142)
(add-to-list 'custom-theme-load-path "~/.config/emacs/elisp/themes/")
(load-theme 'gruber-darker t) ;; The t makes emacs not ask before loading

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

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-surround
  :ensure
  :config
  (global-evil-surround-mode))
(use-package magit)
(use-package helm
  :ensure
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1))
(use-package company
  :ensure
  :config
  (company-mode 1))
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package which-key
  :ensure
  :config
  (which-key-mode))
(use-package evil-collection
  :ensure
  :custom (evil-collection-setup-minibuffer t)
  :init
  (evil-collection-init))

(use-package kbd-mode)


;; ----------------
;; --- KEYBINDS ---
;; ----------------
(use-package general
  :config
  (general-create-definer my-leader-def
    :prefix "SPC")
  (my-leader-def
   :keymaps 'normal
   "bk" 'kill-current-buffer ;; Mnemonic Buffer Kill
   "bl" 'helm-buffers-list   ;; Mnemonic Buffer List
   "ff" 'helm-find-files     ;; Mnemonic File Find
   "d"  'dired
   "e"  'helm-M-x
   "m"  'magit
   "c"  'compile
   )
  ;; Org-mode motion commands
  (general-define-key
    :keymaps 'normal
    :mode 'org
    "gn" 'org-next-visible-heading
    "gp" 'org-previous-visible-heading
    "gf" 'org-forward-heading-same-level
    "gb" 'org-backward-heading-same-level
    )
  (general-define-key
   "C-s" 'save-buffer
   "M-x" 'helm-M-x
   )
)

;; Helm stuff
(setq completion-styles '(flex))

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


;; ----------------------
;; --- OTHER SETTINGS ---
;; ----------------------

;; Make underscore a word character
(modify-syntax-entry ?_ "w")

;; tab width
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; define function to shutdown emacs server instance
(defun kill-server ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )

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
   '(evil-easymotion rainbow-mode company-quickhelp org-bullets yasnippet which-key company evil-commentary haskell-mode vterm sudo-edit evil-surround ac-html general evil-collection evil-leader systemd markdown-mode helm use-package smex rust-mode popup magit gruvbox-theme evil async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
