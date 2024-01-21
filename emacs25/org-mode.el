;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ORG-MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make chromium the default browser:
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "chromium")

(setq org-archive-location "~/Dropbox/refmat/MAYB/archive/archive.org::* From %s") ;; Archiving of DONE tasks

(require 'org-install)
(require 'org-mouse)  ; nice (right-) clicks in the agenda-view

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-special-ctrl-a/e t) ;; C-a and C-e first only consider the headline

(setq org-startup-truncated nil)  ; wrap lines instead of continuing lines
(setq org-startup-folded nil)  ; expand all headings

;; Hide the first n-1 stars
(setq org-hide-leading-stars t)

;; All files that should be included for generating an agenda
(setq org-agenda-files '("~/Dropbox/refmat/MAYB/Career.org" "~/Dropbox/refmat/MAYB/Body.org" "~/Dropbox/refmat/MAYB/Mind.org" "~/Dropbox/refmat/MAYB/Soul.org" "~/Dropbox/refmat/MAYB/Administrative.org"))
;; (setq org-agenda-files
;;       (file-expand-wildcards "~/Desktop/refmat/MAYB/*.org"))

(setq org-capture-templates '(
	("t"  ; hotkey
	 "Todo"  ; name
         entry  ; type
         (file "~/Desktop/inbox.org")
         "* TODO %?")  ; template
	))


;; Refiling and Ido-mode (von http://doc.norang.ca/org-mode.html#Refiling )
;; Where to should you be able to refile from a file? (C-c C-w)
(setq org-refile-targets (quote ((nil :maxlevel . 1)
                                 (org-agenda-files :maxlevel . 1))))

(setq org-reverse-note-order t)

(setq org-todo-keywords
      '((sequence "TODO(o)" "MAYB(m)" "WAIT(w)" "SUSP(s)" "TICK(t)" "|" "DONE(d)" "CANC(c)")))
;; This used to be:
;; (setq org-todo-keywords
;;       '((sequence "NEXT(n)" "GOAL(g)" "TODO(o)" "PROJ(p)" "WAIT(w!)" "SUSP(s)"
;;                   "MAYB(m)" "TICK(t)" "APPT(a)" "|" "DONE(d)" "CANC(c)")))



;; http://raebear.net/comp/emacscolors.html
(setq org-todo-keyword-faces '(
                               ("TODO" . (:foreground "red" :background "gray30" :bold t :weight bold))
                               ("SUSP" . (:foreground "salmon" :background "firebrick" ))
                               ("MAYB" . (:foreground "firebrick" :background "salmon" ))
                               ("TICK" . (:foreground "plum" :background "DarkOrchid" :bold t :weight bold))
                               ("WAIT" . (:foreground "yellow" :background "magenta2"))
                               ("DONE" . (:foreground "DarkOliveGreen" :background "SpringGreen"))
                               ("CANC" . (:foreground "DarkOliveGreen" :background "SpringGreen"))
                               ))

(setq org-todo-repeat-to-state "TICK")


;; FÜR EXPORT
;; Dadurch wird aus "alpha_1" beim exporten *kein* subscript aus der 1 gemacht
(setq org-use-sub-superscripts nil)

;; This is because the doom-molokai theme increases the font size of
;; level 1 and 2 headings in org-mode.
;; see: https://github.com/hlissner/emacs-doom-themes/issues/77#issuecomment-312313381
(set-face-attribute 'org-level-1 nil :height 1.0)

;;;; Here follows some old stuff from when I used org-mode as a GTD system

;; Not sure what this does
; (global-font-lock-mode 1)

;; This way you can specify multiple timestamps for one entry,
;; and e.g. summarize "work out" (2x/wk) in one heading
;(setq org-agenda-skip-additional-timestamps-same-entry nil)

;; Don't show DONE/CANC stuff in the agenda
;; (setq org-agenda-skip-scheduled-if-done 't)
;; (setq org-agenda-skip-deadline-if-done 't)
;; (setq org-agenda-skip-timestamp-if-done 't)

;; From http://doc.norang.ca/org-mode.html#sec-16-4
;(global-set-key (kbd "<f5>") 'org-agenda)  ; F5 is now Hydra, GTD is now paper-based
(global-set-key (kbd "<f6>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f7>") 'org-capture)
(global-set-key (kbd "<f8>") 'org-store-link)

;; stolen. org-habit you have to activate manually:
;(setq org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))

;; This block was already commented out back when I used GTD.
;; 
;; Stop using paths for refile targets - we file directly with IDO
;;(setq org-refile-use-outline-path nil)
;; Targets complete directly with IDO
;;(setq org-outline-path-complete-in-steps nil)
;; Allow refile to create parent tasks with confirmation
;;(setq org-refile-allow-creating-parent-nodes (quote confirm))
;; Use IDO for both buffer and file completion and ido-everywhere to t
;;(setq org-completion-use-ido t)

;; F5-! customizes stuck projects mit "GUI".
;; (setq org-stuck-projects '("+TODO=\"PROJ\"" ("NEXT" "APPT" "TICK") nil nil))

;; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html
;; (setq org-agenda-custom-commands
;;       '(
;;         ("a" "Advanced agenda"
;;          (
;;           (agenda "" ((org-agenda-ndays 2)))
;;          )
;;         )
;;         ("n"  "Next Action list"
;;          (
;;           (agenda "" ((org-agenda-ndays 1)))
;;           (tags-todo "/NEXT")
;;          )
;; 	)
;;         ("g" . "Person Agendas")
;;         ("gj" "Julien" tags "JULIEN")
;; 	("gu" "Markus" tags "MARKUS")
;; 	("ga" "Achim" tags "ACHIM")
;; 	("gw" "WG" tags "WG")
;;         ("d" . "Todo states") ;; gives label to "d"
;;         ("dt" "Todo" todo "TODO")
;;         ("dn" "Next Actions" todo "NEXT")
;;         ("da" "Appointments" todo "APPT")
;;         ("dk" "Tickled" todo "TICK")
;;         ("dw" "Waiting for" todo "WAIT")
;;         ("dp" "Projects" todo "PROJ")
;;         ("w" "Weekly Review"
;;          (
;;           (agenda "" ((org-agenda-ndays 7)))
;; 	  (todo "GOAL" ((org-agenda-overriding-header "Monthly goals (<= 3)")))
;;           (todo "PROJ" ((org-agenda-overriding-header "All Projects")))
;;           (todo "SUSP" ((org-agenda-overriding-header "Suspended Projects")))
;;           ;; (stuck "" ((org-agenda-overriding-header "Inactive projects")))
;;           (todo "NEXT" ((org-agenda-overriding-header "Next Action list")))
;;           (tags "JULIEN|ACHIM|MARKUS|WG/-DONE-CANC" ((org-agenda-overriding-header "Person agendas")))
;;           (todo "WAIT" ((org-agenda-overriding-header "Waiting For list")))
;;           (todo "MAYB" ((org-agenda-overriding-header "Someday/Maybe projects")))
;;           (todo "TICK" ((org-agenda-overriding-header "All TICKled tasks")))
;;           (tags "STYLE=\"habit\"" ((org-agenda-overriding-header "Habits")))
;;           (todo "TODO" ((org-agenda-overriding-header "All TODO tasks")))
;;           (todo "DONE|CANC" ((org-agenda-overriding-header "All DONE and CANC tasks (to archive)")))
;;           )
;;          )
;;         )
;;       )


;; http://raebear.net/comp/emacscolors.html
;; (setq org-todo-keyword-faces '(
;;                                ("NEXT" . (:foreground "yellow" :background "red" :bold t :weight bold))
;;                                ("TODO" . (:foreground "red" :background "gray30" :bold t :weight bold))
;;                                ("APPT" . (:foreground "white" :background "black" :bold t :weight bold))
;;                                ("PROJ" . (:foreground "SkyBlue" :background "RoyalBlue" ))
;; 			       ("SUSP" . (:foreground "salmon" :background "firebrick" ))
;;                                ("MAYB" . (:foreground "firebrick" :background "salmon" ))
;; 			       ("GOAL" . (:foreground "SeaGreen2" :background "gray25"  :bold t :weight bold))
;;                                ("TICK" . (:foreground "plum" :background "DarkOrchid" :bold t :weight bold))
;;                                ("WAIT" . (:foreground "yellow" :background "magenta2"))
;;                                ("DONE" . (:foreground "DarkOliveGreen" :background "SpringGreen"))
;;                                ("CANC" . (:foreground "DarkOliveGreen" :background "SpringGreen"))
;;                                ))

;; (setq org-todo-repeat-to-state "TICK")

;; FOR EXPORTING
;; This way "alpha_1" will *not* make a subscript out of the 1 when exporting:
;; (setq org-use-sub-superscripts nil)

