.PHONY: all build-parse-sample tcp-sample clean

all: build-parse-sample tcp-sample addressbookSample

build-parse-sample:
	make -C BuildParseSample

tcp-sample:
	make -C TCPSample

addressbookSample:
	make -C AddressbookSample

clean:
	make -C BuildParseSample clean
	make -C TCPSample clean
	make -C AddressbookSample clean
