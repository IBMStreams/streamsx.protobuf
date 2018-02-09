package ParseTreeGen;

use ProtoParser;
use Cwd "abs_path";

sub getFileContents {
    my $fileName = shift;
    open(my $file, "<", $fileName) or die("Couldn't open file: $fileName");
    my @lines = <$file>;
    return join("", @lines);
}

my $lineNumber = 1;
my $charNumber = 0;

sub consumeWhitespace {
    my $str = $_[0]->YYData->{DATA};

    while (length($str) > 0) {
        if (substr($str, 0, 1) =~ /[\t ]/) {
            #print "Found tab/space\n";
            $charNumber += 1;
            $str =~ s/^.//;
        } elsif (substr($str, 0, 1) =~ /\n/) {
            #print "Found newline\n";
            $lineNumber += 1;
            $charNumber = 0;
            $str =~ s/^\n//;
        } elsif (substr($str, 0, 2) =~ /\/\//) {
            #print "Found line comment\n";
            $str =~ s/^..//;
            while (not substr($str, 0, 1) eq "\n") {
                $str =~ s/^.//;
            }
            $lineNumber += 1;
            $charNumber = 0;
        } elsif (substr($str, 0, 2) =~ /\/\*/) {
            #print "Found block comment\n";
            $str =~ s/^..//;
            while (not substr($str, 0, 2) eq "*/") {
                if (substr($str, 0, 1) eq "\n") {
                    $lineNumber += 1;
                    $charNumber = 0;
                    $str =~ s/^\n//;
                } else {
                    $charNumber += 1;
                    $str =~ s/^.//;
                }
            }
            $str =~ s/\*\///;
        } else {
            #print "Returning from whitspace chomper\n";
            $_[0]->YYData->{DATA} = $str;
            return;
        }
    }
    #print "Returning from whitspace chomper\n";
    $_[0]->YYData->{DATA} = $str;
    return;
}

sub lexicalParser {
    #my $lineComment = qr/\/\/[^\n]*\n/;
    #my $blockComment = qr/\/\*(?:.|\n)*\*\//;
    #$_[0]->YYData->{DATA} =~ s/^(?:\s+|$lineComment|$blockComment)*//;

    consumeWhitespace($_[0]);
    my $data = $_[0]->YYData->{DATA};

    my @symbols = (
        qr/bool/,
        qr/bytes/,
        qr/double/,
        qr/enum/,
        qr/extend/,
        qr/extensions/,
        qr/fixed32/,
        qr/fixed64/,
        qr/float/,
        qr/group/,
        qr/import/,
        qr/int32/,
        qr/int64/,
        qr/map/,
        qr/max/,
        qr/message/,
        qr/oneof/,
        qr/option/,
        qr/optional/,
        qr/package/,
        qr/public/,
        qr/repeated/,
        qr/required/,
        qr/reserved/,
        qr/returns/,
        qr/rpc/,
        qr/service/,
        qr/sfixed32/,
        qr/sfixed64/,
        qr/sint32/,
        qr/sint64/,
        qr/stream/,
        qr/string/,
        qr/syntax/,
        qr/to/,
        qr/uint32/,
        qr/uint64/,
        qr/weak/
    );

    my @specialSymbols = (
        qr/,/,
        qr/;/,
        qr/-/,
        qr/=/,
        qr/\(/,
        qr/\)/,
        qr/\./,
        qr/\</,
        qr/\>/,
        qr/\[/,
        qr/\]/,
        qr/\{/,
        qr/\}/
    );

    my $b = qr/[\s!@#\$%\^&\*\(\)\+-=\/\?<>\.,;:"'\\|`~\[\]\{\}]/;

    #print "Looping through all the symbols\n";
    foreach my $symbol (@symbols) {
        if ($data =~ /^(?<symbolValue>$symbol)$b/) {
            my $symbolValue = $+{symbolValue};
            #print "Found: \"" . $symbolValue . "\"\n";
            $_[0]->YYData->{DATA} =~ s/^(?<symbolValue>$symbol)//;
            return ($symbolValue, $symbolValue);
        }
    }

    #print "Looping through all the SPECIAL symbols\n";
    foreach my $symbol (@specialSymbols) {
        if ($data =~ /^(?<symbolValue>$symbol)/) {
            my $symbolValue = $+{symbolValue};
            #print "Found: \"" . $symbolValue . "\"\n";
            $_[0]->YYData->{DATA} =~ s/^(?<symbolValue>$symbol)//;
            return ($symbolValue, $symbolValue);
        }
    }

    # Utilities for IDENT
    my $ident = qr/[A-Za-z][A-Za-z0-9_]*/;

    # Utilities for STR_LITERAL
    my $charEscape = qr/(?:\\(?:a|b|f|n|r|t|v|\\|'|"))/;
    my $octEscape = qr/(?:\\[0-7][0-7][0-7])/;
    my $hexEscape = qr/(?:\\[xX][0-9A-Fa-f][0-9A-Fa-f])/;
    my $charValue = qr/(?:$hexEscape|$octEscape|$charEscape|[^\0\n\\])/;

    # Checking literals and identifiers
    if ($data =~ /^(?<identValue>$ident)$b/) {
        $identValue = $+{identValue};
        $_[0]->YYData->{DATA} =~ s/^(?<identValue>$ident)//;
        return (IDENT, $identValue);
    } elsif ($data =~ /^(?<intValue>[1-9][0-9]*)$b/) {
        $intValue = $+{intValue};
        $_[0]->YYData->{DATA} =~ s/^(?<intValue>[1-9][0-9]*)//;
        return (INT_LITERAL, $intValue);
    } elsif ($data =~ /^(?<intValue>0[0-7]*)$b/) {
        $intValue = $+{intValue};
        $_[0]->YYData->{DATA} =~ s/^(?<intValue>0[0-7]*)//;
        return (INT_LITERAL, $intValue);
    } elsif ($data =~ /^(?<intValue>0[xX][0-9A-Fa-f]+)$b/) {
        $intValue = $+{intValue};
        $_[0]->YYData->{DATA} =~ s/^(?<intValue>0[xX][0-9A-Fa-f]+)//;
        return (INT_LITERAL, $intValue);
    } elsif ($data =~ /^(?<boolValue>true|false)$b/) {
        $boolValue = $+{boolValue};
        $_[0]->YYData->{DATA} =~ s/^(?<boolValue>true|false)//;
        return (BOOL_LITERAL, $boolValue);
    } elsif ($data =~ /^(?<strValue>'$charValue*'|"$charValue*")$b/) {
        $strValue = $+{strValue};
        $_[0]->YYData->{DATA} =~ s/^(?<strValue>'$charValue*'|"$charValue*")//;
        return (STR_LITERAL, $strValue);
    }

    #print "Found nothing?\n";
    if ($data eq "") {
        return ("", undef);
    }

    #die("Unexpected token near: \"$data\"");
}

sub defaultErrorHandler {
    my $errorString = "Unexpected token on [Line $lineNumber]: value=\"" . $_[0]->YYCurval . "\", token=[" . $_[0]->YYCurtok . "]";
    #$errorString .= "\n" . $_[0]->YYData->{DATA};
    die($errorString);
    #die("Unexpected token near: value=\"" . $_[0]->YYCurval . "\", token=[" . $_[0]->YYCurtok . "]");
}

sub compileMessageNames {
    my $message = shift;
    my $package = shift;
    my $protoData = shift;
    my $prefix = shift or "";

    my @newPrefix = @{$prefix};
    push @newPrefix, $message->{"name"};

    my $protoName = $package . "." . join(".", @newPrefix);
    my $cppName = $package . "." . join("_", @newPrefix);

    $protoData->{"identifiers"}->{$protoName} = $cppName;

    foreach my $subMessage (@{$message->{"body"}->{"messages"}}) {
        compileMessageNames($subMessage, $package, $protoData, \@newPrefix);
    }

    foreach my $subEnum (@{$message->{"body"}->{"enums"}}) {
        compileEnumNames($subEnum, $package, $protoData, \@newPrefix);
    }
}

sub compileEnumNames {
    my $enum = shift;
    my $package = shift;
    my $protoData = shift;
    my $prefix = shift or "";

    my @newPrefix = @{$prefix};
    push @newPrefix, $enum->{"name"};

    my $protoName = $package . "." . join(".", @newPrefix);
    my $cppName = $package . "." . join("_", @newPrefix);

    $protoData->{"identifiers"}->{$protoName} = $cppName;
}

sub searchInScope {
    my $package = $_[0];
    my $name = $_[1];
    my @scope = @{$_[2]};
    my $protoData = $_[3];

    my @tmp = map { $_->{"name"} } @scope;
    #print "\n\n$package." . join("_", @tmp) . ".$name\n";
    while (scalar @scope > 0) {
        my @names = map { $_->{"name"} } @scope;

        my $protoName = $package . "." . join(".", @names) . "." . $name;
        #print "Checking \"$protoName\"\n";
        if (exists $protoData->{"identifiers"}->{$protoName}) {
            #print "Found\n";
            return $protoData->{"identifiers"}->{$protoName};
        }

        my $next = pop @scope;
    }

    my $protoName = $package . "." . $name;
    #print "Checking \"$protoName\"\n";
    if (exists $protoData->{"identifiers"}->{$protoName}) {
        #print "Found\n";
        return $protoData->{"identifiers"}->{$protoName};
    } else {
        #print "Not found\n";
        return "";
    }
}

sub parseMessageHash {
    my $message = shift;
    my $package = shift;
    my $protoData = shift;

    my $prefix = shift or "";
    my $isNested = shift or 0;
    my $parents = shift or [];

    my $newFields = [];
    foreach my $field (@{$message->{"body"}->{"fields"}}) {
        my $dataType = $field->{"dataType"};
        my $count = ($dataType =~ tr/\.//);
        if ($field->{"type"} eq "primitive" or $count > 0) {
            push @{$newFields}, $field;
        } elsif ($field->{"type"} eq "map") {
            $dataType = $field->{"valDataType"};
            $count = ($dataType =~ tr/\.//);

            if ($field->{"valType"} eq "primitive" or $count > 0) {
                push @{$newFields}, $field;
            } else {
                my @newParents = @{$parents};
                push @newParents, $message;

                my $scopedName = searchInScope($package, $field->{"dataType"}, \@newParents, $protoData);
                die("Could not find " . $field->{"valDataType"} . " in scope from $package." . $message->{"name"}) if ($scopedName eq "");
                $field->{"valDataType"} = $scopedName;
                push @{$newFields}, $field;
            }
        } else {
            my @newParents = @{$parents};
            push @newParents, $message;

            my $scopedName = searchInScope($package, $field->{"dataType"}, \@newParents, $protoData);
            die("Could not find " . $field->{"dataType"} . " in scope from $package." . $message->{"name"}) if ($scopedName eq "");

            $field->{"dataType"} = $scopedName;
            #$field->{"dataType"} = "$package.$scopedName" . $field->{"dataType"};
            push @{$newFields}, $field;
        }
    }

    my @newPrefix = @{$prefix};
    push @newPrefix, $message->{"name"};

    my $newMessage = {
        "type" => "message",
        "package" => $package,
        #"name" => join("_", $prefix) . "_" . $message->{"name"},
        "name" => $prefix . $message->{"name"},
        #"fqdn" => $package . "." . join("_", $prefix) . "_" . $message->{"name"},
        "fqdn" => $package . "." . $prefix . $message->{"name"},
        "fields" => $newFields,
    };

    my @newParents = @{$parents};
    push @newParents, $message;
    foreach my $subMessage (@{$message->{"body"}->{"messages"}}) {
        parseMessageHash($subMessage, $package, $protoData, $newMessage->{"name"} . "_", 1, \@newParents);
    }

    foreach my $subEnum (@{$message->{"body"}->{"enums"}}) {
        parseEnumHash($subEnum, $package, $protoData, $newMessage->{"name"} . "_", 1);
    }

    #$protoData->{"messages"}->{$package . "." . $message->{"name"}} = $newMessage;
    # Temporarily removed to leave room for the "real name" vs the "simple name" distinction
    $protoData->{"messages"}->{$newMessage->{"fqdn"}} = $newMessage;
}

sub parseEnumHash {
    my $enum = shift;
    my $package = shift;
    my $protoData = shift;

    my $prefix = shift or "";
    my $isNested = shift or 0;

    my $newFields = [];
    foreach my $field (@{$enum->{"body"}->{"fields"}}) {
        if ($isNested) {
            $field->{"name"} = $prefix . $enum->{"name"} . "_" . $field->{"name"};

        }
        push @{$newFields}, $field;
    }

    my $newEnum = {
        "type" => "enum",
        "package" => $package,
        "name" => $prefix . $enum->{"name"},
        "fqdn" => $package . "." . $prefix . $enum->{"name"},
        "fields" => $newFields,
        #"fields" => $enum->{"body"}->{"fields"}
    };

    $protoData->{"enums"}->{$newEnum->{"fqdn"}} = $newEnum;
}

sub parseProtoFile {
    my $protoDirectory = shift;
    my $protoName = $_[0];
    my $fileName = $protoDirectory . "/" . $_[0];
    if ($_[0] =~ /^\//) {
        $fileName = $_[0];
    }
    my $processedFiles = $_[1] or {};

    #$processedFiles->{abs_path($protoDirectory . "/" . $protoName)} = 1;
    $processedFiles->{$protoName} = 1;
    #print "// Parsing \"$fileName\"\n";

    my $parser = new ProtoParser;
    $parser->YYData->{DATA} = getFileContents($fileName);
    my $tree = $parser->YYParse(yylex => \&lexicalParser, yyerror => \&defaultErrorHandler);
    my $protoData = {
        "messages" => {},
        "enums" => {},
        "identifiers" => {},
    };

    my $package = $tree->{"package"};
    foreach my $def (@{$tree->{"defs"}}) {
        if ($def->{"type"} eq "message") {
            compileMessageNames($def, $package, $protoData);
        } elsif ($def->{"type"} eq "enum") {
            compileEnumNames($def, $package, $protoData);
        }
    }

    foreach my $def (@{$tree->{"defs"}}) {
        if ($def->{"type"} eq "message") {
            parseMessageHash($def, $package, $protoData);
        } elsif ($def->{"type"} eq "enum") {
            parseEnumHash($def, $package, $protoData);
        } elsif ($def->("type") eq "extend") {
            die("extend keyword is not currently supported by GenericProtoParser");
        } elsif ($def->("type") eq "service") {
            die("service keyword is not currently supported by GenericProtoParser");
        }
    }

    foreach my $import (@{$tree->{"imports"}}) {
        $import =~ s/(^\")|(\"$)//g;
        #$import = abs_path($protoDirectory . "/" . $import);
        if ($processedFiles->{$import}) {
            next;
        }

        $lineNumber = 1;
        $charNumber = 0;
        my $newProtoFile = parseProtoFile($protoDirectory, $import, $processedFiles);

        foreach my $message (keys %{$newProtoFile->{"messages"}}) {
            $protoData->{"messages"}->{$message} = $newProtoFile->{"messages"}->{$message};
        }
        foreach my $enum (keys %{$newProtoFile->{"enums"}}) {
            $protoData->{"enums"}->{$enum} = $newProtoFile->{"enums"}->{$enum};
        }

        #@{$protoData->{"messages"}}{keys %{$newProtoFile->{"messages"}}} = values %{$newProtoFile->{"messages"}};
        #@{$protoData->{"enums"}}{keys %{$newProtoFile->{"enums"}}} = values %{$newProtoFile->{"enums"}};
    }

    $protoData->{"files"} = [keys %$processedFiles];
    return $protoData;
}

1;
