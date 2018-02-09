.PHONY: all toolkit samples clean

all: toolkit doc

toolkit:
	make -C streamsx.protobuf impl || exit 1
	make -C streamsx.protobuf toolkit || exit 1

doc:
	make -C streamsx.protobuf doc || exit 1

samples:
	make -C streamsx.protobuf.samples || exit 1

clean:
	make -C streamsx.protobuf.samples clean
	make -C streamsx.protobuf clean
