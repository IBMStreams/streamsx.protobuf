.PHONY: all impl doc toolkit clean

all: impl toolkit doc

doc:
	spl-make-doc

impl:
	make -C impl

toolkit: impl
	spl-make-toolkit -i . -m

clean:
	spl-make-toolkit -c -i .
	make -C impl clean
	rm -f toolkit.xml
	rm -rf doc
