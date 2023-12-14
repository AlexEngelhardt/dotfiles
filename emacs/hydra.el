;; Hydra for custom hierarchical keybindings:
;; https://emacs.stackexchange.com/questions/45743/how-do-i-add-custom-hierarchical-keybindings

;; Giant example here:
;; https://github.com/jkitchin/scimax/blob/master/scimax-hydra.el

(global-set-key (kbd "<f5>") 'hydra-main/body)

(defhydra hydra-main (:color blue)
  "Main Hydra"
  ("s" hydra-shortcuts/body "shortcuts")
  ("m" hydra-toggle-modes/body "toggle modes")
  ("r" hydra-org-ref/body "ref")
  ("d" hydra-deft/body "deft")
  ("h" hydra-helm/body "helm")
  ("w" hydra-org-wiki/body "wiki")
  ("b" hydra-org-brain/body "brain")
  ("o" hydra-org/body "org"))

(defhydra hydra-shortcuts (:color blue)
  "Command shortcuts"
  ("q" nil "quit" :column "Shortcuts")
  ("i" indentbuffer "indent buffer" :color pink :column "Do")
  )

(defhydra hydra-org (:color blue)
  "Org-Mode stuff"
  ("q" nil "quit" :column "Org")
  ("c" org-capture "capture" :color pink :column "Do")
  ("l" org-store-link "store link"))

;; TODO have these be the variables org-ref-bibliography-notes and
;; org-ref-default-bibliography
(defhydra hydra-org-ref (:color blue)
  "Org-Ref stuff"
  ("q" nil "quit" :column "Ref")
  ("n" (lambda () (interactive) (find-file org-ref-bibliography-notes)) "Open org-ref notes" :color pink :column "Do")
  ("b" (lambda () (interactive) (find-file org-ref-default-bibliography)) "Open org-ref bibliography"))

(defhydra hydra-helm (:color blue)
  "Helm"
  ("q" nil "quit" :column "Helm")
  ("b" helm-bookmarks "Bookmarks (set/get)" :color pink :column "Do")
  ("s" helm-occur "Search in buffer")
  ("p" helm-list-elisp-packages "List elisp packages")
  ("r" helm-org-rifle-directories "Rifle directory")
  )

(defhydra hydra-deft (:color blue)
  "Deft"
  ("q" nil "quit" :column "Deft")
  ("r" (lambda () (interactive) (deft-start-in-dir "~/Dropbox/refmat/")) "refmat" :color pink :column "Do")
  ("e" (lambda () (interactive) (deft-start-in-dir "~/symlinks/folder-1/")) "Project 1")
  ("b" (lambda () (interactive) (deft-start-in-dir "~/symlinks/folder-2/")) "Project 2")
  ("p" (lambda () (interactive) (deft-start-in-dir "~/symlinks/job-a/")) "Job A"))

(defhydra hydra-org-wiki (:color blue)
  "Org-Wiki stuff"
  ("q" nil "quit" :column "Wiki")
  ("c" org-capture "capture" :color pink :column "Do")
  ("l" org-store-link "store link"))

(defhydra hydra-org-brain (:color blue)
  "Org-Brain stuff"
  ("q" nil "quit" :column "Brain")
  ("v" org-brain-visualize "visualize" :color pink :column "Do")
  ("l" org-store-link "store link"))

(defhydra hydra-toggle-modes (:color blue)
  "Toggle rarely used modes"
  ("q" nil "cancel" :column "Toggle")
  ("a" abbrev-mode "abbrev" :column "Do")
  ("d" toggle-debug-on-error "debug")
  ("f" auto-fill-mode "fill")
  ("t" toggle-truncate-lines "truncate")
  ("w" whitespace-mode "whitespace"))
