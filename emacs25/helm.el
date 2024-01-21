;;;; IDO MODE
;;(setq ido-everywhere t)
;; To fix a strange unix dir size bug:
;;(setq ido-max-directory-size 100000)
;; "Herp A Derp" wird mit "had" gefunden
;;(setq ido-enable-flex-matching t)
;; (require 'ido)
;; (ido-mode 1)

;;;; Use HELM instead of IDO

;; https://www.youtube.com/watch?v=k78f8NYYIto

(require 'helm-config)

;; helm-mode 1 e.g. already binds C-x b to helm-buffers-list
(helm-mode 1)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-org-rifle: Quickly rifle through org buffers

(require 'helm-org-rifle)

;; see hydra.el for command bindings
