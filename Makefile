.PHONY: all toolkit samples clean

all: toolkit doc

toolkit:
	make -C com.ibm.streamsx.protobuf impl || exit 1
	make -C com.ibm.streamsx.protobuf toolkit || exit 1

doc:
	make -C com.ibm.streamsx.protobuf doc || exit 1

samples:
	make -C com.ibm.streamsx.protobuf.samples || exit 1

clean:
	make -C com.ibm.streamsx.protobuf.samples clean
	make -C com.ibm.streamsx.protobuf clean
