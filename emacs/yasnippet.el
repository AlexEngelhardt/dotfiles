;;;; YASNIPPET

;; Install with (list-packages)
;; Then make sure (package-initialize) appears in your init file
;; The menu-bar now has an extra point "YASnippet".

;; Introductory description:
;; https://elpa.gnu.org/packages/yasnippet.html

;; Tons of information:
;; https://joaotavora.github.io/yasnippet/snippet-organization.html

;; (setq yas-snippet-dirs '("/home/alexx/.emacs.d/elpa/yasnippet-0.12.2/snippets"
;; 			 "~/Dropbox/config/emacs/snippets"))
(setq yas-snippet-dirs '("~/Dropbox/config/emacs/snippets"))
(yas-global-mode 1)
