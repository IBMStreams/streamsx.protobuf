.PHONY: all clean

APPDIR = $(shell basename `pwd`)

all:
	../../com.ibm.streamsx.protobuf/bin/spl-schema-from-protobuf . main.proto
	sc -c -M BuildParseSample -t ../../com.ibm.streamsx.protobuf:$(STREAMS_SPLPATH) -w -Wl,-rpath="'\$$\$$ORIGIN/../toolkits/$(APPDIR)/impl/lib'"

clean:
	rm -rf output
	rm -f toolkit.xml
	rm -rf impl/lib
	rm -rf com.ibm.streamsx.protobuf.person
	rm -rf impl
