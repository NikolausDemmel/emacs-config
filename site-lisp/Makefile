
.PHONY: all python.el

all:
	$(MAKE) -C org-mode
	$(MAKE) python.el

python.el:
	cd python.el && emacs -Q -L . -batch -f batch-byte-compile python.el
