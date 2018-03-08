.PHONY: all clean

APPDIR = $(shell basename `pwd`)

all:
	sc -c -M TCPSample -t ../../com.ibm.streamsx.protobuf -w -Wl,-rpath="'\$$\$$ORIGIN/../toolkits/$(APPDIR)/impl/lib'"

clean:
	rm -rf output
	rm -f toolkit.xml
	rm -rf impl/lib
