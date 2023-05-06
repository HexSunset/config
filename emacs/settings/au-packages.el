;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'smex)

(require 'which-key)
(which-key-mode)

(require 'ido)
(ido-everywhere)

(require 'magit)

(require 'eglot)


(provide 'au-packages)
