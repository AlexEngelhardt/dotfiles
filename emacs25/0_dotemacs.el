;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ALLGEMEINES / MISC

;; time the loading of the .emacs
;; keep this on top of your .emacs
;; https://www.emacswiki.org/emacs/OptimizingEmacsStartup
(defvar *emacs-load-start* (current-time))
(defun anarcat/time-to-ms (time)
  (+ (* (+ (* (car time) (expt 2 16)) (car (cdr time))) 1000000) (car (cdr (cdr time)))))
(defun anarcat/display-timing ()
  (message ".emacs loaded in %f seconds" (/ (- (anarcat/time-to-ms (current-time)) (anarcat/time-to-ms *emacs-load-start*)) 1000000.0)))
(add-hook 'after-init-hook 'anarcat/display-timing t)

;; Unset F1 (was: help, i.e. C-h) to use it for yasnippet bindings
(global-set-key (kbd "<f1>") nil)

;; This file must load *first*, it sets package path etc.
;; Hence the "0_" in the file name.
(add-to-list 'load-path "~/github/dotfiles/emacs25/packages/")

;; The emacs startup profiler
;; (add-to-list 'load-path "~/.emacs.d/elpa/esup-0.7.1")

(set-language-environment "UTF-8") ; UTF-8 as default encoding
;;(setq debug-on-error t)
(setq frame-title-format "%b")  ; buffer name as frame title instead of emacs@hostname
(setq default-fill-column 80)
(setq inhibit-startup-screen t)

;; Hide the "For information about GNU Emacs and the GNU system, type C-h C-a."
;; https://stackoverflow.com/questions/144983/how-do-i-make-emacs-start-without-so-much-fanfare:
(defun display-startup-echo-area-message () )

;; https://www.emacswiki.org/emacs/LockFiles
;; This prevents creating lock files when files are edited (this crashed gitbook for me)
(setq create-lockfiles nil)

;; Instead of audio alarm when e.g. Ctrl-G, make it visible:
(setq visible-bell 1)

;; These lines save the autosave backups in /tmp/
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

;; Set default browser:
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;;(server-start) ; Then set "emacsclient" as your default editor, and shit doesn't open a second instance of emacs but loads in the currently open emacs.

;; pop-up-window size and position (and maybe more)
(setq default-frame-alist
      '((width . 80) (height . 57)
	;; (cursor-color . "white")
	;; (cursor-type . box)
	;; (foreground-color . "yellow")
	;; (background-color . "black")
	;; (font . "-*-Courier-normal-r-*-*-12-*-*-*-c-*-iso8859-1")
	;; (font . "-*-Lucida Console-normal-r-*-*-12-*-*-*-c-*-iso8859-1")
        ))

;;;; FONT
;; Set default font (wtf emacs)
(set-face-attribute 'default nil :font "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" )

;;;; FAVORITE FILES
;; Example: F9-e opens this config file.
;; If you wish to keep your actual file paths and names private,
;; just link to a symlink to a file here :-)
(setq my-file-menu-keymap
      (let ((keymap (make-sparse-keymap)))
        (dolist (pair '(
                        ("e" . "~/github/dotfiles/emacs/0_dotemacs.el")
                        ("p" . "~/symlinks/f9p-symlink.org.gpg")
			("o" . "~/symlinks/f9o-symlink.md")
			("c" . "~/symlinks/f9c-symlink.md")
                        ))
          (define-key keymap (car pair)
            `(lambda () (interactive) (find-file ,(cdr pair)))))
        keymap))
(global-set-key (kbd "<f9>") my-file-menu-keymap)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; CUSTOM FUNCTIONS

;; Function to indent the whole buffer according to the current mode
(defun indentbuffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; KEYBINDS

;; Disable mouse scrolling cuz trackpad sucks:
(global-set-key (kbd "<f12>") 'mouse-wheel-mode); toggle scrolling by trackpad

;; Keybind for Rot13 region
(global-set-key "\C-cr" 'rot13-region)

;; Geometric window switching!
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<left>") 'windmove-left)

;; Coding
(global-set-key (kbd "C-#") 'comment-region)
(global-set-key (kbd "C-'") 'uncomment-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; CUSTOM MODES

;; Syntax highlighting (I think?)  (taken care of by doom-themes molokai)
;;(global-font-lock-mode 1)

;; Suppress Menu and Toolbar
;; (menu-bar-mode -1)
(tool-bar-mode -1)

;; Highlight sister parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Highlight lines (is weird when doom-themes molokai is on: the first window
;; looks fine, but when you C-x 5 2 a new window, the highlight is too bright)
;; (global-hl-line-mode 1)
;; (set-face-background hl-line-face "gray60")

;;;; TABBAR MODE
(require 'tabbar)
(tabbar-mode nil)
(setq tabbar-home-button (quote (("[Home]") "[x]")))
(customize-set-variable 'tabbar-background-color "gray20")
(custom-set-faces '(tabbar-unselected ((t (:inherit tabbar-default :foreground "dark gray")))))

;;;; MARKDOWN MODE
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq markdown-indent-on-enter nil)

;;;; CSV MODE
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; package.el: Enable MELPA too

(require 'package)

;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;;(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/"))
(add-to-list 'package-archives (cons "melpa-stable" "https://stable.melpa.org/packages/"))
(package-initialize)
