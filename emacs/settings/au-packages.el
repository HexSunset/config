;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'smex)

(require 'which-key)
(which-key-mode)

(require 'company)
(global-company-mode)

(require 'ido)
(ido-everywhere)

(require 'magit)

(require 'eglot)

(save-place-mode 1)

(global-auto-revert-mode 1)


(provide 'au-packages)
