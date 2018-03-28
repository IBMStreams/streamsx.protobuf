.PHONY: all impl doc toolkit clean

TOOLKITNAME = com.ibm.streamsx.protobuf
TKDIR = ${TOOLKITNAME)

all: impl toolkit doc

doc:
	spl-make-doc --include-composite-operator-diagram --author IBMStreams at GitHub - https://github.com/IBMStreams/streamsx.protobuf/$(TOOLKITNAME} --directory $(TOOLKITNAME)

impl:
	make -C impl

toolkit: impl
	spl-make-toolkit -i . -m

clean:
	spl-make-toolkit -c -i .
	make -C impl clean
	rm -f toolkit.xml
	rm -rf doc
