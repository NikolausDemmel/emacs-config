
;;; INSTALL

;; Install the following ubuntu packages:
;; sudo apt-get install ttf-droid magit emacs


;;  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

(require 'cask "/usr/local/opt/cask/cask.el")
;;(require 'cask "~/.emacs.d/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;;(require 's)
;;(require 'f)
;;(require 'ht)
;;(require 'git)
;;(require 'ert)
(require 'use-package)





(setq inhibit-splash-screen t)


(setq-default tab-width 4)
(setq require-final-newline t)
(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil) ;;(setq indent-tabs-mode nil)
(setq c-default-style "k&r")

(setq ediff-split-window-function 'split-window-horizontally)

(require 'ido)
(ido-mode t)


;;; Python
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/python.el"))
(require 'python)


;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

(require 'auto-complete)
(global-auto-complete-mode t)



;; Load the library and start it up
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/rosemacs"))
(require 'rosemacs)
(invoke-rosemacs)
(setq ros-completion-function 'ido-completing-read)

;; Optional but highly recommended: add a prefix for quick access
;; to the rosemacs commands
(global-set-key "\C-x\C-r" ros-keymap)

;;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")


;; Specify the default font as =Source Code Pro=, which should already
;;    be [[http://blogs.adobe.com/typblography/2012/09/source-code-pro.html][downloaded]] and installed.

;;(set-frame-font "Source Code Pro")
;;(set-face-attribute 'default nil :font "Source Code Pro" :height 100)
;;(set-face-font 'default "Source Code Pro")

(set-default-font "Source_Code_Pro-11")


(setq confirm-kill-emacs 'yes-or-no-p)

(global-set-key [f9] 'recompile)
(global-set-key [f10] 'compile)
(global-set-key [f5] 'revert-buffer)

(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))



(require 'magit-svn)
(add-hook 'magit-mode-hook 'turn-on-magit-svn)
(global-set-key (kbd "C-x g") 'magit-status)


;; change magit diff colors

(custom-set-faces
 ;; other faces
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "LimeGreen"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default"))))
 '(magit-diff-file-heading ((((type tty)) nil)))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) nil))))

;;(eval-after-load 'magit
;;  '(progn
;;     (set-face-foreground 'magit-diff-add "green3")
;;     (set-face-foreground 'magit-diff-del "red3")
;;     (when (not window-system)
;;       (set-face-background 'magit-item-highlight "black"))))



(defun gitg ()
  (interactive)
  (if (string-equal system-type "darwin")
    (start-process-shell-command "gitx" "*gitg*" "gitx")
    (start-process "gitg" "*gitg*" "gitg" )))



(setq-default fill-column 80)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("open" "open %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "open") (output-pdf "open") (output-html "open"))))
 '(ido-enable-flex-matching t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; dired
(require 'dired)
(require 'dired-aux)
(require 'dired-x)
(require 'dired+)


(setq dired-dwim-target t) ;; suggest copying/moving to other dired buffer in split view

;; literature
(let ((file "~/work/literature/scripts/lit.el"))
  (if (file-exists-p file)
	  (load file)))



(setq
   backup-by-copying t            ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves")) ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)             ; use versioned backups



;;;; gnome open

;; source: (2012.12.25) http://psung.blogspot.com/2007/05/bridging-gap-between-emacs-and-gnome.html

(defun gnome-open-file (filename)
  "gnome-opens the specified file."
  (interactive "fFile to open: ")
  (let ((process-connection-type nil))
    (start-process "" nil "/usr/bin/gnome-open" filename)))

(defun dired-gnome-open-file ()
  "Opens the current file in a Dired buffer."
  (interactive)
  (gnome-open-file (dired-get-file-for-visit)))

(add-hook 'dired-mode-hook (lambda () (local-set-key "E" 'dired-gnome-open-file)))



;;; ORG mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/org-mode/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/org-mode/contrib/lisp"))

(eval-after-load "org"
  '(progn
     ;; Change .pdf association directly within the alist
	 (setcdr (assoc "\\.pdf\\'" org-file-apps) "evince %s")))



;;; Doc View
(setq doc-view-continuous t)



;;; ispell
(setq ispell-dictionary "english")


;;; flyspell

(dolist (hook '(text-mode-hook org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))
(dolist (hook '(c++-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode 1))))



;;; symbols-mode (only emacs24 out of the box?)
;(require 'tabulated-list)
;(require 'symbols-mode)
;(require 'list-symbols)



;;; Scons files
(add-to-list 'auto-mode-alist '("\\.sco$" . python-mode))




;;; COMPILATION MODE

;; auto scroll in compilation buffer
(setq compilation-scroll-output t)
;; jump to first error
;;(setq compilation-auto-jump-to-first-error t)




;;; LATEX

 ;; Math mode for LaTex
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; mouse scrolling
(mouse-wheel-mode t)

;; spellcheck in LaTex mode
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)

;; Show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)

;; highlight current line
(global-hl-line-mode 1)



;;; trim ws mode
(require 'ws-trim)
(dolist (hook '(c++-mode-hook
                c-mode-hook
                xml-mode-hook))
  (add-hook hook (lambda () (ws-trim-mode 1))))


;; Auto Modes by file ending
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))


;; not tool bar
(tool-bar-mode -1)






(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))



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




;;; cmake Mode
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)
