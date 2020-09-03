
;;; INSTALL

;; Install the following ubuntu packages:
;; sudo apt-get install ttf-droid magit emacs


;;  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;(require 'cask "/usr/local/opt/cask/cask.el")
;;(require 'cask "~/.emacs.d/.cask/cask.el")
;;(cask-initialize)
;;(require 'pallet)

;;(require 's)
;;(require 'f)
;;(require 'ht)
;;(require 'git)
;;(require 'ert)
;;(require 'use-package)

;; https://github.com/dimitri/el-get#basic-setup
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)



;; turn off bell
(setq ring-bell-function 'ignore)




(setq inhibit-splash-screen t)


(setq-default tab-width 4)
(setq require-final-newline t)
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil) ;;(setq indent-tabs-mode nil)
(setq c-default-style "k&r")

(setq ediff-split-window-function 'split-window-horizontally)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;;; Python
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/python.el"))
;(require 'python)


;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

(require 'auto-complete)
(global-auto-complete-mode t)



;; Load the library and start it up
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/rosemacs"))
;(require 'rosemacs)
;(invoke-rosemacs)
;(setq ros-completion-function 'ido-completing-read)

;; Optional but highly recommended: add a prefix for quick access
;; to the rosemacs commands
;(global-set-key "\C-x\C-r" ros-keymap)

;;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")


;; Specify the default font as =Source Code Pro=, which should already
;;    be [[http://blogs.adobe.com/typblography/2012/09/source-code-pro.html][downloaded]] and installed.

;;(set-frame-font "Source Code Pro")
;;(set-face-attribute 'default nil :font "Source Code Pro" :height 100)
;;(set-face-font 'default "Source Code Pro")

;(set-default-font "Source_Code_Pro-11")


(setq confirm-kill-emacs 'yes-or-no-p)

(global-set-key [f9] 'recompile)
(global-set-key [f10] 'compile)
(global-set-key [f5] 'revert-buffer)

(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)

;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))



;(require 'magit-svn)
;(add-hook 'magit-mode-hook 'turn-on-magit-svn)
(global-set-key (kbd "C-x g") 'magit-status)



;; change magit diff colors

;(custom-set-faces
 ;; other faces
; '(magit-diff-added ((((type tty)) (:foreground "green"))))
; '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
; '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
; '(magit-diff-file-heading ((((type tty)) nil)))
; '(magit-diff-removed ((((type tty)) (:foreground "red"))))
; '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
; '(magit-section-highlight ((((type tty)) nil))))



(defun gitg ()
  (interactive)
  (if (string-equal system-type "darwin")
    (start-process-shell-command "gitx" "*gitg*" "gitx")
    (start-process "gitg" "*gitg*" "gitg" )))



;(setq-default fill-column 80)




;; dired
(require 'dired)
(require 'dired-aux)
(require 'dired-x)
(require 'dired+)


(setq dired-dwim-target t) ;; suggest copying/moving to other dired buffer in split view



(setq
   backup-by-copying t            ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves")) ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)             ; use versioned backups







;;; Doc View
(setq doc-view-continuous t)





;;; COMPILATION MODE

;; auto scroll in compilation buffer
(setq compilation-scroll-output t)
;; jump to first error
;;(setq compilation-auto-jump-to-first-error t)




;; mouse scrolling
(mouse-wheel-mode t)

;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)

;; highlight current line
(global-hl-line-mode 1)




;; not tool bar
(tool-bar-mode -1)


;;; I prefer cmd key for meta
;(setq mac-option-key-is-meta nil
;      mac-command-key-is-meta t
;      mac-command-modifier 'meta
;     mac-option-modifier 'super)

(setq mac-option-key-is-meta t
      mac-command-key-is-meta nil
      mac-command-modifier 'command
      mac-option-modifier 'meta)






;;; Source: http://www.emacswiki.org/emacs/UnfillParagraph
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

;;; Source: http://www.emacswiki.org/emacs/UnfillRegion
(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
   logical line.  This is useful, e.g., for use with
   `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

;; Handy key definition
(define-key global-map "\C-\M-Q" 'unfill-region)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(web-mode el-get auctex cmake-mode gh ghub ghub+ git-commit magit magit-gh-pulls magit-gitflow magit-lfs magit-popup magithub markdown-mode markdown-mode+)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
