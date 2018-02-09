#!/usr/bin/perl

use ParseTreeGen;

if (scalar @ARGV < 2) {
    die("Usage: ./protoToTuple.pl <proto directory> <root proto file>");
}
my $protoDirectory = $ARGV[0];
my $protoRootFile = $ARGV[1];

my $protos = ParseTreeGen::parseProtoFile($protoDirectory, $protoRootFile);

my $packages = {};
print "Packages:\n";
foreach my $key (keys %{$protos->{"messages"}}) {
    my $message = $protos->{"messages"}->{$key};
    my $package = $message->{"package"};
    `mkdir -p $package`;
    unless ($packages->{$package}) {
        print "$package\n";
    }
    $packages->{$package} = 1;
}

print "\n";

sub splitPackage {
    my @components = split(/\./, $_[0]);
    if (scalar @components > 1) {
        my $dt = pop @components;
        my $package = join(".", @components);
        return {"dt" => $dt, "package" => $package};
    } else {
        return {"dt" => $_[0], "package" => ""};
    }
}

foreach my $key (keys %{$protos->{"enums"}}) {
    my $enum = $protos->{"enums"}->{$key};
    my $package = $enum->{"package"};

    my $fileName = "$package/" . $enum->{"name"} . "_pb.spl";
    print "   [enum] \"$fileName\"\n";
    open(my $fh, ">", $fileName);

    print $fh "namespace $package;\n\n";

    foreach my $usePackage (keys %$packages) {
        print $fh "use ${usePackage}::*;\n";
    }

    print $fh "\n";
    print $fh "type " . $enum->{"name"} . "_pb = enum {\n";

    my $started = 0;

    foreach my $field (@{$enum->{"fields"}}) {
        unless ($started == 0) {
            print $fh ",\n";
        }

        $started = 1;

        print $fh "\t";
        print $fh $field->{"name"} . "_";
    }

    print $fh "\n};\n";
    close $fh;
}

#my $newEnum = {
#    "type" => "enum",
#    "package" => $package,
#    "name" => $enum->{"name"},
#    "fqdn" => $package . "." . $enum->{"name"},
#    "fields" => $enum->{"body"}->{"fields"}
#};

foreach my $key (keys %{$protos->{"messages"}}) {
    my $message = $protos->{"messages"}->{$key};
    my $package = $message->{"package"};

    my $fileName = "$package/" . $message->{"name"} . "_pb.spl";
    print "[message] \"$fileName\"\n";
    open(my $fh, ">", $fileName);

    print $fh "namespace $package;\n\n";

    foreach my $usePackage (keys %$packages) {
        print $fh "use ${usePackage}::*;\n";
    }

    print $fh "\n";
    print $fh "type " . $message->{"name"} . "_pb = tuple<\n";

    my $started = 0;

    foreach my $field (@{$message->{"fields"}}) {
        unless ($started == 0) {
            print $fh ",\n";
        }

        $started = 1;

        print $fh "\t";
        if ($field->{"type"} =~ /^(primitive|complex)$/) {
            my $splitData = splitPackage($field->{"dataType"});
            if ($field->{"label"} eq "repeated") {
                if ($splitData->{"package"} eq "") {
                    print $fh "list<" . $splitData->{"dt"} . "> " . $field->{"name"} . "_";
                } else {
                    print $fh "list<" . $splitData->{"package"} . "::" . $splitData->{"dt"} . "_pb> " . $field->{"name"} . "_";
                }
                #print $fh "list<" . $field->{"dataType"} . "> " . $field->{"name"};
            } else {
                if ($splitData->{"package"} eq "") {
                    print $fh $splitData->{"dt"} . " " . $field->{"name"} . "_";
                } else {
                    print $fh $splitData->{"package"} . "::" . $splitData->{"dt"} . "_pb " . $field->{"name"} . "_";
                }
                #print $fh $field->{"dataType"} . " " . $field->{"name"};
            }
        } elsif ($field->{"type"} eq "group") {
            die("<group> keyword is currently unsupported by this tool (It is also deprecated by Google)");
        } elsif ($field->{"type"} eq "map") {
            my $splitData = splitPackage($field->{"valDataType"});
            if ($splitData->{"package"} eq "") {
                print $fh "map<" . $field->{"keyType"} . ", " . $splitData->{"dt"} . "> " . $field->{"name"} . "_";
            } else {
                print $fh "map<" . $field->{"keyType"} . ", " . $splitData->{"package"} . "::" . $splitData->{"dt"} . "_pb> " . $field->{"name"} . "_";
            }
            #print $fh "map<" . $field->{"keyType"} . ", " . $field->{"valDataType"} . "> " . $field->{"name"};
        } elsif ($field->{"type"} eq "oneof") {
            die("<oneof> keyword is currently unsupported by this tool");
        }
    }

    print $fh "\n>;\n";
    close $fh;
}

print "\n";
print "// Success!\n// To use, please include the following at the top of your composite file:\n\n";
foreach my $package (keys %$packages) {
    print "use ${package}::*;\n";
}

print "\n";
print "// Invoke the ProtobufParse operator as follows:\n\n";
print "// e.g. my.package::MyMessage_pb\n";
print "stream< [protobuf package name] :: [protobuf message name] _pb > deserializedProtos = ProtobufParse(serializedProtos) {\n";
print "  param\n";
print "    dataAttribute: data;\n";
print "    protoMessage: \"[fully-qualified protobuf message name]\"; // e.g. \"my.package.MyMessage\"\n";
print "    protoDirectory: \"$protoDirectory\";\n";
print "    protoRootFile: \"$protoRootFile\";\n";
print "}\n";

print "\n";
print "// Assuming that the serializedProtos stream is defined as \"stream<blob data>\"\n";
