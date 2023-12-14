;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; R/ESS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq ess-ask-for-ess-directory nil)
(setq ess-local-process-name "R")
(setq ansi-color-for-comint-mode 'filter)
(setq comint-prompt-read-only t)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)

;; Disable right-indenting of single comments in ESS:
;; https://stackoverflow.com/questions/26312317/wrong-indentation-of-comments-in-emacs
(setq ess-indent-with-fancy-comments nil)  ; doesn't work?!
(setq comment-column 0)


;; Vertical line in column 80
;; https://www.emacswiki.org/emacs/FillColumnIndicator
;; To toggle graphical indication of the fill column in a buffer, use the command fci-mode.
(require 'fill-column-indicator)
(setq fci-rule-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
(add-hook 'ess-mode-hook 'fci-mode)


(defun my-ess-start-R ()
  (interactive)
  (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn
        (delete-other-windows)
        (setq w1 (selected-window))
        (setq w1name (buffer-name))
        (setq w2 (split-window w1))
        (R)
        (set-window-buffer w2 "*R*")
        (set-window-buffer w1 w1name))))

(defun my-ess-eval ()
  (interactive)
  (my-ess-start-R)
  (if (and transient-mark-mode mark-active)
      (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-region-or-line-and-step)))

(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(shift return)] 'my-ess-eval)))

;; Make C-<return> eval a whole paragraph
(add-hook 'ess-mode-hook
          '(lambda()
             (local-set-key [(control return)] 'ess-eval-region-or-function-or-paragraph-and-step)))

;;  (add-hook 'inferior-ess-mode-hook
;;           '(lambda()
;;              (local-set-key [C-up] 'comint-previous-input)
;;              (local-set-key [C-down] 'comint-next-input)))

(require 'ess-site)

;; C-<up> und down unsetten, damit man damit geometric window switchen kann
(define-key comint-mode-map (kbd "C-<up>") nil)
(define-key comint-mode-map (kbd "C-<down>") nil)

;; Underscore soll nicht mehr mit ' <- ' replaced werden
(ess-toggle-underscore nil)

