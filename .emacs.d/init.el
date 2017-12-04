;; INSTALL PACKAGES
;;------------------------------------------------------------------------------
(require 'package) ;; You might already have this line
(setq package-archives
             '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives
               '("gnu"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))


(package-initialize) ;; You might already have this line

;; There is no need refresh every time.
;;
;;(defun my-packages-reset()
;;  "Reset package manifest to the defined set."
;;  (interactive)
;;  (package-refresh-contents))
;;
;;(my-packages-reset)


(defun installPackage (p)
  (unless (package-installed-p p)
    (package-install p)))


(defvar commonPackage
  '(neotree
    auto-complete
    color-theme
    sr-speedbar
    find-file-in-project
    markdown-mode ; markdown
    tuareg ; ocaml
    py-autopep8 ; python
    ;js2-mode ; javascript
    )
  )

(mapc 'installPackage commonPackage)

(require 'sr-speedbar)
;;(setq sr-speedbar-right-side nil)
(global-set-key [f12] 'sr-speedbar-toggle)

(require 'find-file-in-project)
(global-set-key (kbd "M-p") 'find-file-in-project)

(require 'auto-complete-config)
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)
(ac-config-default)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'color-theme)
(color-theme-initialize)
(color-theme-gnome2)
(global-set-key [f9] 'color-theme-gnome2)

;; column 80 highlight, TAB highlight
(require 'whitespace)
(setq whitespace-style '(face tabs lines-tail trailing))
;;(global-whitespace-mode t)


;; BASIC CUSTOMIZATION
;;---------------------------------------------
(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally
(column-number-mode t) ;; display column in bottom
(define-key global-map [C-return] 'set-mark-command)


(setq-default indent-tabs-mode nil) ;; using space instead of TAB


(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;(set-default-font "Dejavu Sans Mono 10")
;;(set-fontset-font "fontset-default" 'unicode"WenQuanYi Bitmap Song 12") ;;for linux
;;(set-fontset-font "fontset-default" 'unicode "宋体 12") ;; for windows


(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)


(show-paren-mode)
(electric-pair-mode)
(winner-mode)
(delete-selection-mode)
(setq make-backup-file nil)
(setq save-abbrevs nil)
