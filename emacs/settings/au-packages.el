;; -*- lexical-binding: t; -*-

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'smex)
(ido-everywhere)
(require 'magit)


(provide 'au-packages)
