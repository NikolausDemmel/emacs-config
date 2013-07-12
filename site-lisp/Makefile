
.PHONY: all dired-plus python.el

all:
	$(MAKE) -C auto-complete
	$(MAKE) dired-plus
	$(MAKE) -C magit
	$(MAKE) -C org-mode
	$(MAKE) python.el


dired-plus:
	cd dired-plus && emacs -Q -L . -batch -f batch-byte-compile dired+.el

python.el:
	cd python.el && emacs -Q -L . -batch -f batch-byte-compile python.el

