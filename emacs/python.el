(setq python-python-command "/usr/bin/python3")

(setq python-shell-interpreter "python3")

;; The inline syntax check and highlighting is 'flymake-mode' (minor mode)

;; A better Python IDE in Emacs. Must install manually using M-x package-install
;; https://realpython.com/emacs-the-best-python-editor/
(package-initialize)
(elpy-enable)

(require 'py-autopep8)
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)  ; This auto-PEP8's your buffer when you save


