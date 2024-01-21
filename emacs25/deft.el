;;;; DEFT

;; https://jblevins.org/projects/deft/
;; http://www.emacswiki.org/emacs/DeftMode
;; http://www.jontourage.com/2013/08/15/setting-up-deft-mode-in-emacs-with-org-mode/

(require 'deft)
;;(setq deft-extension "md")
(setq deft-extension "org")

(setq deft-directory "~/Dropbox/refmat")

(setq deft-recursive t)
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Taken from https://www.emacswiki.org/emacs/DeftMode

(define-minor-mode deft-note-mode "Deft notes" nil " Deft-Notes" nil)
(setq deft-text-mode 'deft-note-mode)

(defun kill-all-deft-notes ()
  (interactive)
  (save-excursion
    (let((count 0))
      (dolist(buffer (buffer-list))
        (set-buffer buffer)
        (when (not (eq nil deft-note-mode))  
          (setq count (1+ count))
          (kill-buffer buffer)))
      )))

(defun deft-or-close ()
  (interactive)
  (if (or (eq major-mode 'deft-mode) (not (eq nil deft-note-mode)))
      (progn
	(kill-all-deft-notes)
	(kill-buffer "*Deft*"))
    (deft)))

(global-set-key [f4] 'deft-or-close)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To run deft in a specific directory
;; from: http://pragmaticemacs.com/emacs/deft-as-a-file-search-tool/

;; Note that deft-directory is changed in this emacs session then!
;; Variables are not local in elisp.

(defun deft-start-in-dir (dir)
  "Run deft in directory DIR"
  (setq deft-directory dir)
  (switch-to-buffer "*Deft*")
  (kill-this-buffer)
  (deft)
  )
