;; http://www.mycpu.org/emacs-productivity-setup/

(require 'doom-themes)

(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "dimgray")

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
;;;; Molokai is true monospace, e.g. it doesn't have different font sizes for
;;;; different org-mode heading levels:
(load-theme 'doom-molokai t)
;;;; Doom-One is the default theme:
;;(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Some special fonts for org-mode
(doom-themes-org-config)

;;(require 'doom-modeline)
;;(doom-modeline-mode 1)
