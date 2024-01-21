;;;; Custom packages from MELPA (e.g. markdown-mode)
;; You must run M-x package-refresh-contents after adding these lines.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;;;; Basic configuration
(set-language-environment "UTF-8") ; UTF-8 as default encoding
;;(setq debug-on-error t)
(setq frame-title-format "%b")  ; buffer name as frame title instead of emacs@hostname
(setq default-fill-column 80)
(setq inhibit-startup-screen t)
;; Suppress Menu and Toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)
;; https://www.emacswiki.org/emacs/LockFiles
;; This prevents creating lock files when files are edited (this crashed gitbook for me)
(setq create-lockfiles nil)
;; These lines save the autosave backups in /tmp/
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))
;; Instead of audio alarm when e.g. Ctrl-G, make it visible:
(setq visible-bell 1)
;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
;; Highlight sister parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)


;; Set default browser:
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;;;; FAVORITE FILES
;; Example: F9-e opens this config file.
;; If you wish to keep your actual file paths and names private,
;; just link to a symlink to a file here :-)
(setq my-file-menu-keymap
      (let ((keymap (make-sparse-keymap)))
        (dolist (pair '(
                        ("e" . "~/git/dotfiles/dot-emacs27.el")
                        ("p" . "~/symlinks/f9p-symlink.org.gpg")
			("o" . "~/symlinks/f9o-symlink.md")
			("c" . "~/symlinks/f9c-symlink.md")
                        ))
          (define-key keymap (car pair)
            `(lambda () (interactive) (find-file ,(cdr pair)))))
        keymap))
(global-set-key (kbd "<f9>") my-file-menu-keymap)


;;;; Key bindings

;; Keybind for Rot13 region
(global-set-key "\C-cr" 'rot13-region)
;; Coding
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "C-'") 'uncomment-region)


;; Tabbar is builtin in emacs 27:
(tab-bar-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("88cb0f9c0c11dbb4c26a628d35eb9239d1cf580cfd28e332e654e7f58b4e721b" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(cl-libify helm-org-rifle use-package helm-org deft helm markdown-mode cmake-mode modus-themes))
 '(vc-follow-symlinks t))


;; Theme
;; Run M-x package-install and install `modus-themes`
(load-theme 'modus-vivendi-tinted)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "MesloLGS NF" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))


;;;; Load other init files too
(load-file "~/git/dotfiles/emacs27/deft.el")
(load-file "~/git/dotfiles/emacs27/helm.el")


;;;; Start with a file instead of empty
(find-file "~/Dropbox/inbox.org")

