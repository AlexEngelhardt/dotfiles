
;; helm-mode 1 e.g. already binds C-x b to helm-buffers-list
(helm-mode 1)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-org-rifle: Quickly rifle through org buffers

(require 'helm-org-rifle)

