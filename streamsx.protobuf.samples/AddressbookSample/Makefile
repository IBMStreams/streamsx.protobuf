.PHONY: all distributed clean 

SPLC_FLAGS ?= -a -t ../../streamsx.protobuf:$(STREAMS_SPLPATH) -w -Wl,-rpath="'\$$\$$ORIGIN/../toolkits/$(APPDIR)/impl/lib'"
SPLC = $(STREAMS_INSTALL)/bin/sc
SPL_CMD_ARGS ?= 
SPL_MAIN_COMPOSITE = AddressbookSample
PROTOFILEBASE = addressbook
PROTOFILE = $(PROTOFILEBASE).proto
PROTOPACKAGE = tutorial

all: protoschema distributed

protoschema:
	../../streamsx.protobuf/bin/spl-schema-from-protobuf impl $(PROTOFILE)

distributed:
	$(SPLC) $(SPLC_FLAGS) -M $(SPL_MAIN_COMPOSITE) $(SPL_CMD_ARGS)

clean: 
	$(SPLC) $(SPLC_FLAGS) -C -M $(SPL_MAIN_COMPOSITE)
	rm -f impl/include/$(PROTOFILEBASE).*
	rm -f impl/lib/libcustomproto.so
	rm -rf $(PROTOPACKAGE)

