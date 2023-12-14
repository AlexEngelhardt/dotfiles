;;; https://caiorss.github.io/org-wiki/

(require 'org-wiki)

(setq org-wiki-location "~/Dropbox/org-wiki")
(setq org-wiki-user-init-file "~/.emacs")

(setq org-wiki-template
      (string-trim
"
#+TITLE: %n
#+DESCRIPTION:
#+KEYWORDS:
#+STARTUP:  content
#+DATE: %d

- [[wiki:index][Index]]

- Related: 

* %n
"))
