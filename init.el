
;;; INSTALL

;; Install the following ubuntu packages:
;; sudo apt-get install ttf-droid magit emacs



(column-number-mode)

(setq-default tab-width 4)
(setq require-final-newline t)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq c-default-style "k&r")

(setq ediff-split-window-function 'split-window-horizontally)

(require 'ido)
(ido-mode t)


;; Load the library and start it up
(require 'rosemacs)
(invoke-rosemacs)
(setq ros-completion-function 'ido-completing-read)

;; Optional but highly recommended: add a prefix for quick access
;; to the rosemacs commands
(global-set-key "\C-x\C-r" ros-keymap)

;;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
(set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

(setq confirm-kill-emacs 'yes-or-no-p)

(global-set-key [f9] 'recompile)
(global-set-key [f10] 'compile)
(global-set-key [f5] 'revert-buffer)

(global-set-key (kbd "C-x C-;") 'comment-or-uncomment-region)



(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/magit"))
(require 'magit-svn)
(global-set-key (kbd "C-x g") 'magit-status)


(defun gitg ()
  (interactive)
  (start-process "gitg" "*gitg*" "gitg"))



(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))



;; dired
(setq dired-dwim-target t) ;; suggest copying/moving to other dired buffer in split view


(require 'dired)
;; literature
(let ((file "~/work/literature/scripts/lit.el"))
  (if (file-exists-p file)
	  (load file)))



;; emacs backup files all in one place
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

;; safe (but slow) backup files
(setq backup-by-copying t)



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
