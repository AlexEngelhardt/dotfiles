(setq org-ref-bibliography-notes "~/Dropbox/org-ref/notes.org"
      my-bib-file "~/Dropbox/org-ref/bibliography.bib"
      org-ref-default-bibliography '(my-bib-file)
      org-ref-pdf-directory "~/files/bibtex-pdfs/")

(add-to-list
 'org-capture-templates
 '("n"  ; hotkey
   "New org-ref Note"  ; name
   entry  ; type
   (file+headline org-ref-bibliography-notes "Uncategorized")  ; heading type (and title)
   "* %?\n%u")  ; template
  )

(add-to-list
 'org-capture-templates
 '("r"  ; hotkey
   "New org-ref Reference"  ; name
   plain  ; type
   (file my-bib-file)  ; Heading type (and title)
   "@%^{Entry Type|misc|book|article|manual}{%?,\n title={%^{Title}},\n author={%^{Author}},\n url={%^{URL}}\n}")  ; template
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; some requires for basic org-ref usage
;; (require 'org-ref)
;; (require 'org-ref-pdf)
;; (require 'org-ref-url-utils)

;; use-package is a package that enables lazy loading. Activate it by
;; specifying *any* keybinding inside:

(use-package org-ref
    :bind ("C-." . org-ref-help))
(use-package org-ref-pdf
    :bind ("C-." . org-ref-help))
(use-package org-ref-url-utils
    :bind ("C-." . org-ref-help))
