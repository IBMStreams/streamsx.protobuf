# streamsx.protobuf

The `streamsx.protobuf` toolkit contains operators for interacting with serialized protocol
buffer messages. It contains two conversion operators and two simple source operators.

Currently, this toolkit only supports `proto2` syntax.

Examples can be found in the `streamsx.protobuf.samples` directory.

## Conversion operators

1. `ProtobufParse` takes a tuple with a `blob` field and emits a tuple matching the `protoMessage`
   parameter type it is given.

2. `ProtobufBuild` takes a tuple as generated by the `spl-schema-from-protobuf` script (see below)
   and emits a serialized version in the Protobuf serialization format as a blob.

*Important!!* To compile these operators, your Makefile should include the following flag passed to `sc`:

    APPDIR = $(shell basename `pwd`)

    sc -M <main composite> -t <path to streamsx.protobuf> -w -Wl,-rpath="'\$$\$$ORIGIN/../toolkits/$(APPDIR)/impl/lib'"

Note, that `-Wl` is W followed by lowercase L. If this is not included, the sab bundle does not properly set
the runtime library path to include the generated `libcustomproto.so` that is placed in the application directory.

## Source operators

1. `ProtobufTCPSource` creates a TCP server that will accept connections which can pass 1 or
   more Protobuf messages, each prefixed with a 4-byte record length.

2. `ProtobufFileSource` reads binary files that contain Protobuf messages, each prefixed with
   a 4-byte record length.

## Configuration

The `streamsx.protobuf` toolkit requires the Protobuf libraries are installed on the compiling
machine.

The easiest way to install them is from the CentOS base yum repository
```
yum install protobuf.x86_64
yum install protobuf-devel.x86_64
```

Two environment variables are required:
:`$STREAMSX_PROTOBUF_LIBPATH`
:`$STREAMSX_PROTOBUF_INCLUDEPATH`.

The following statements will set them for protobuf and protobuf-devel that are available with CentOS:

```
export STREAMSX_PROTOBUF_LIBPATH=/usr/lib64
export STREAMSX_PROTOBUF_INCLUDEPATH=/usr/include/google/protobuf
```

## Generating SPL schemas from .proto files

This toolkit contains a script under `streamsx.protobuf/bin` called `spl-schema-from-protobuf`. This script
will generate tuples in SPL to match the Protobuf messages in .proto files.

This generated schema is required to use the
conversion operators.

`ProtobufParse` emits the tuple generated by the script corresponding to the
Protobuf message it is receiving.

`ProtobufBuild` receives the tuple generated by the script
corresponding to the Protobuf message it is producing.

### Naming Conventions
For all message and enum names, `_pb` is appended to the identifier.

For all field names or enum values, `_` (underscore)
is appended to the identifier. An example can be seen in `streamsx.protobuf.samples`.

## Usage

To use this toolkit, create an empty application. Place your `.proto` file inside your `<application>/impl` directory.

Run the command:
```
<path to streamsx.protobuf toolkit>/bin/spl-schema-from-protobuf impl <your protobuf file name>
```

This will generate the SPL schema to use with the conversion operators. The files will be placed in your `<application>` directory within a nested directory structure based on the .proto message structure.  For example, if your .proto file contains a package directive: `package tutorial`, then the generated files will be in `<application>/tutorial`.

The output will also include a console message providing the code snippet to add to your .spl application to use the generated SPL types.

As an example, if you use the protobuf tutorial file (address.proto), the directory structure created will include:
```
tutorial
├── AddressBook_pb.spl
├── Person_pb.spl
├── Person_PhoneNumber_pb.spl
└── Person_PhoneType_pb.spl
```

Next, you will use the operators within your application or composite operator.

## Simple Example

If you have a Protobuf message named `my.package.MyMessage`, the files will look like this:

### MyMessage.proto

    syntax = "proto2";

    package my.package;

    message MyMessage {
        required string field = 1;
    }

### my.package/MyMessage\_pb.spl

    namespace my.package;

    use my.package::*;

    type MyMessage_pb = tuple<
        rstring field_
    >;

### ProtobufParse invocation

    stream<blob recordData> serializedRecords = ProtobufFileSource() {
        param
            file: "<binary file>";
    }

    stream<my.package::MyMessage_pb> myMessages = ProtobufParse(serializedRecords) {
        param
            dataAttribute: recordData;
            protoMessage: "my.package.MyMessage";
            protoDirectory: "impl";
            protoRootFile: "MyMessage.proto";
    }

### ProtobufBuild invocation

    stream<my.package::MyMessage_pb> myMessages = Beacon() {
        param
            period: 1.0;
        output
            myMessages: field_ = "<value>";
    }

    stream<blob recordData> serializedRecords = ProtobufParse(myMessages) {
        param
            protoMessage: "my.package.MyMessage";
            protoDirectory: "impl";
            protoRootFile: "MyMessage.proto";
    }

## Under the hood

How do the converters work?

They utilize a grammar file in `yapp`, which is a Perl port of `yacc`. The grammar defines the `proto2` syntax
according to the Google language specification sheet. The `yapp` grammar is compiled into a Perl module, which
generates a parse tree containing all message and enum definitions within the file. For each import from the
root file, this process is repeated until all files have been processed.

The Build/Parse operators iterate through this parse tree to map Protobuf message values into and out of Streams
tuples. At compile time, these operators run this parser to create the tree, and then they run the `protoc`
command to generate the C++ that is the messages will use. The C++ is compiled into a shared object library
named `libcustomproto.so`, which is stored in the application directory's `impl/lib`. This means that if more
than one Build and/or Parse operator exists in the same composite, they cannot be compiled in parallel and they
must used the same Protobuf definitions. Otherwise, race conditions will occur and one or both will be
non-functional at run time.

Variable mapping is generated recursively, so infinitely complex messages can be handled. There are two limitations:
These operators cannot handle `group` fields or `oneof` fields. Oneof fields are planned for future implementation,
but group fields have been deprecated by Google in favor of nested messages.

Every available effort to ensure the readability of the generated code was made, as this makes debugging issues
much easier. Feel free to take a look. However, all variable names are randomly generated to reduce the likelihood
of a name collision. Name collisions are not checked beforehand, as the likelihood of not having a name collision in
a message with 100 fields is (1-1/52^20)^100, which is infintessimally small.

Some older versions of the `protoc` compiler do not require the first line to state `syntax = "proto2";`, but this
parser requires the statement to be present regardless of the version of `protoc` installed.
