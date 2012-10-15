

(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq c-default-style "k&r")

;; Load the library and start it up
(require 'rosemacs)
(invoke-rosemacs)

;; Optional but highly recommended: add a prefix for quick access
;; to the rosemacs commands
(global-set-key "\C-x\C-r" ros-keymap)

(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

(setq confirm-kill-emacs 'yes-or-no-p)

(global-set-key [f9] 'recompile)