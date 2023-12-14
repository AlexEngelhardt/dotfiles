;;;; TEX

(setq TeX-PDF-mode t)
(setq TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Evince") (output-html "xdg-open"))))

;;;; AUCTEX
(load "auctex.el" nil t t)
; (load "preview-latex.el" nil t t)
