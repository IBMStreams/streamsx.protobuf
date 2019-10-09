####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package ProtoParser;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;



sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		ACTIONS => {
			"syntax" => 2
		},
		GOTOS => {
			'proto' => 1,
			'syntax' => 3
		}
	},
	{#State 1
		ACTIONS => {
			'' => 4
		}
	},
	{#State 2
		ACTIONS => {
			"=" => 5
		}
	},
	{#State 3
		ACTIONS => {
			"package" => 16,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"import" => 19,
			"service" => 10,
			"extend" => 23,
			"message" => 12
		},
		DEFAULT => -2,
		GOTOS => {
			'extend' => 15,
			'protoA' => 8,
			'service' => 18,
			'emptyStatement' => 9,
			'message' => 22,
			'package' => 21,
			'import' => 20,
			'topLevelDef' => 11,
			'enum' => 13,
			'option' => 14
		}
	},
	{#State 4
		DEFAULT => 0
	},
	{#State 5
		ACTIONS => {
			'STR_LITERAL' => 24
		}
	},
	{#State 6
		DEFAULT => -139
	},
	{#State 7
		ACTIONS => {
			"(" => 27,
			'IDENT' => 25
		},
		GOTOS => {
			'optionName' => 26
		}
	},
	{#State 8
		DEFAULT => -1
	},
	{#State 9
		ACTIONS => {
			"package" => 16,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"import" => 19,
			"service" => 10,
			"extend" => 23,
			"message" => 12
		},
		DEFAULT => -2,
		GOTOS => {
			'extend' => 15,
			'protoA' => 28,
			'service' => 18,
			'emptyStatement' => 9,
			'import' => 20,
			'package' => 21,
			'message' => 22,
			'topLevelDef' => 11,
			'enum' => 13,
			'option' => 14
		}
	},
	{#State 10
		ACTIONS => {
			'IDENT' => 29
		},
		GOTOS => {
			'serviceName' => 30
		}
	},
	{#State 11
		ACTIONS => {
			"package" => 16,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"import" => 19,
			"service" => 10,
			"extend" => 23,
			"message" => 12
		},
		DEFAULT => -2,
		GOTOS => {
			'extend' => 15,
			'protoA' => 31,
			'service' => 18,
			'emptyStatement' => 9,
			'import' => 20,
			'package' => 21,
			'message' => 22,
			'topLevelDef' => 11,
			'enum' => 13,
			'option' => 14
		}
	},
	{#State 12
		ACTIONS => {
			'IDENT' => 32
		},
		GOTOS => {
			'messageName' => 33
		}
	},
	{#State 13
		DEFAULT => -9
	},
	{#State 14
		ACTIONS => {
			"package" => 16,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"import" => 19,
			"service" => 10,
			"extend" => 23,
			"message" => 12
		},
		DEFAULT => -2,
		GOTOS => {
			'extend' => 15,
			'protoA' => 34,
			'service' => 18,
			'emptyStatement' => 9,
			'import' => 20,
			'package' => 21,
			'message' => 22,
			'topLevelDef' => 11,
			'enum' => 13,
			'option' => 14
		}
	},
	{#State 15
		DEFAULT => -10
	},
	{#State 16
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 36
		}
	},
	{#State 17
		ACTIONS => {
			'IDENT' => 37
		},
		GOTOS => {
			'enumName' => 38
		}
	},
	{#State 18
		DEFAULT => -11
	},
	{#State 19
		ACTIONS => {
			"weak" => 39,
			'STR_LITERAL' => 41,
			"public" => 40
		}
	},
	{#State 20
		ACTIONS => {
			"package" => 16,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"import" => 19,
			"service" => 10,
			"extend" => 23,
			"message" => 12
		},
		DEFAULT => -2,
		GOTOS => {
			'extend' => 15,
			'protoA' => 42,
			'service' => 18,
			'emptyStatement' => 9,
			'import' => 20,
			'package' => 21,
			'message' => 22,
			'topLevelDef' => 11,
			'enum' => 13,
			'option' => 14
		}
	},
	{#State 21
		ACTIONS => {
			"package" => 16,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"import" => 19,
			"service" => 10,
			"extend" => 23,
			"message" => 12
		},
		DEFAULT => -2,
		GOTOS => {
			'extend' => 15,
			'protoA' => 43,
			'service' => 18,
			'emptyStatement' => 9,
			'import' => 20,
			'package' => 21,
			'message' => 22,
			'topLevelDef' => 11,
			'enum' => 13,
			'option' => 14
		}
	},
	{#State 22
		DEFAULT => -8
	},
	{#State 23
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 45,
			'messageType' => 44
		}
	},
	{#State 24
		DEFAULT => -126
	},
	{#State 25
		ACTIONS => {
			"." => 47
		},
		DEFAULT => -120,
		GOTOS => {
			'optionNameA' => 46
		}
	},
	{#State 26
		ACTIONS => {
			"=" => 48
		}
	},
	{#State 27
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 49
		}
	},
	{#State 28
		DEFAULT => -7
	},
	{#State 29
		DEFAULT => -135
	},
	{#State 30
		ACTIONS => {
			"{" => 50
		}
	},
	{#State 31
		DEFAULT => -6
	},
	{#State 32
		DEFAULT => -130
	},
	{#State 33
		ACTIONS => {
			"{" => 52
		},
		GOTOS => {
			'messageBody' => 51
		}
	},
	{#State 34
		DEFAULT => -5
	},
	{#State 35
		ACTIONS => {
			"." => 54
		},
		DEFAULT => -128,
		GOTOS => {
			'fullIdentA' => 53
		}
	},
	{#State 36
		ACTIONS => {
			";" => 55
		}
	},
	{#State 37
		DEFAULT => -131
	},
	{#State 38
		ACTIONS => {
			"{" => 57
		},
		GOTOS => {
			'enumBody' => 56
		}
	},
	{#State 39
		ACTIONS => {
			'STR_LITERAL' => 58
		}
	},
	{#State 40
		ACTIONS => {
			'STR_LITERAL' => 59
		}
	},
	{#State 41
		ACTIONS => {
			";" => 60
		}
	},
	{#State 42
		DEFAULT => -3
	},
	{#State 43
		DEFAULT => -4
	},
	{#State 44
		ACTIONS => {
			"{" => 61
		}
	},
	{#State 45
		DEFAULT => -138
	},
	{#State 46
		DEFAULT => -118
	},
	{#State 47
		ACTIONS => {
			'IDENT' => 62
		}
	},
	{#State 48
		ACTIONS => {
			'BOOL_LITERAL' => 66,
			"-" => 63,
			"+" => 64,
			'IDENT' => 35,
			'STR_LITERAL' => 70,
			'INT_LITERAL' => 65,
			'FLOAT_LITERAL' => 67
		},
		GOTOS => {
			'fullIdent' => 68,
			'constant' => 69
		}
	},
	{#State 49
		ACTIONS => {
			")" => 71
		}
	},
	{#State 50
		ACTIONS => {
			"rpc" => 73,
			"stream" => 75,
			"option" => 7,
			";" => 6
		},
		DEFAULT => -45,
		GOTOS => {
			'serviceA' => 78,
			'rpc' => 76,
			'stream' => 77,
			'option' => 74,
			'emptyStatement' => 72
		}
	},
	{#State 51
		DEFAULT => -25
	},
	{#State 52
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 85,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 53
		DEFAULT => -127
	},
	{#State 54
		ACTIONS => {
			'IDENT' => 99
		}
	},
	{#State 55
		DEFAULT => -122
	},
	{#State 56
		DEFAULT => -12
	},
	{#State 57
		ACTIONS => {
			"option" => 7,
			";" => 6,
			'IDENT' => 101
		},
		DEFAULT => -14,
		GOTOS => {
			'enumBodyA' => 104,
			'enumField' => 100,
			'option' => 103,
			'emptyStatement' => 102
		}
	},
	{#State 58
		ACTIONS => {
			";" => 105
		}
	},
	{#State 59
		ACTIONS => {
			";" => 106
		}
	},
	{#State 60
		DEFAULT => -123
	},
	{#State 61
		ACTIONS => {
			"required" => 95,
			"optional" => 80,
			";" => 6,
			"repeated" => 90
		},
		DEFAULT => -40,
		GOTOS => {
			'group' => 109,
			'extendA' => 107,
			'label' => 97,
			'emptyStatement' => 108,
			'field' => 110
		}
	},
	{#State 62
		ACTIONS => {
			"." => 47
		},
		DEFAULT => -120,
		GOTOS => {
			'optionNameA' => 111
		}
	},
	{#State 63
		ACTIONS => {
			'INT_LITERAL' => 112,
			'FLOAT_LITERAL' => 113
		}
	},
	{#State 64
		ACTIONS => {
			'INT_LITERAL' => 114,
			'FLOAT_LITERAL' => 115
		}
	},
	{#State 65
		DEFAULT => -143
	},
	{#State 66
		DEFAULT => -148
	},
	{#State 67
		DEFAULT => -146
	},
	{#State 68
		DEFAULT => -140
	},
	{#State 69
		ACTIONS => {
			";" => 116
		}
	},
	{#State 70
		DEFAULT => -147
	},
	{#State 71
		ACTIONS => {
			"." => 47
		},
		DEFAULT => -120,
		GOTOS => {
			'optionNameA' => 117
		}
	},
	{#State 72
		ACTIONS => {
			"rpc" => 73,
			"stream" => 75,
			"option" => 7,
			";" => 6
		},
		DEFAULT => -45,
		GOTOS => {
			'serviceA' => 118,
			'rpc' => 76,
			'stream' => 77,
			'option' => 74,
			'emptyStatement' => 72
		}
	},
	{#State 73
		ACTIONS => {
			'IDENT' => 119
		},
		GOTOS => {
			'rpcName' => 120
		}
	},
	{#State 74
		ACTIONS => {
			"rpc" => 73,
			"stream" => 75,
			"option" => 7,
			";" => 6
		},
		DEFAULT => -45,
		GOTOS => {
			'serviceA' => 121,
			'rpc' => 76,
			'stream' => 77,
			'option' => 74,
			'emptyStatement' => 72
		}
	},
	{#State 75
		ACTIONS => {
			'IDENT' => 122
		},
		GOTOS => {
			'streamName' => 123
		}
	},
	{#State 76
		ACTIONS => {
			"rpc" => 73,
			"stream" => 75,
			"option" => 7,
			";" => 6
		},
		DEFAULT => -45,
		GOTOS => {
			'serviceA' => 124,
			'rpc' => 76,
			'stream' => 77,
			'option' => 74,
			'emptyStatement' => 72
		}
	},
	{#State 77
		ACTIONS => {
			"rpc" => 73,
			"stream" => 75,
			"option" => 7,
			";" => 6
		},
		DEFAULT => -45,
		GOTOS => {
			'serviceA' => 125,
			'rpc' => 76,
			'stream' => 77,
			'option' => 74,
			'emptyStatement' => 72
		}
	},
	{#State 78
		ACTIONS => {
			"}" => 126
		}
	},
	{#State 79
		ACTIONS => {
			'IDENT' => 128,
			'INT_LITERAL' => 129
		},
		GOTOS => {
			'fieldNames' => 131,
			'range' => 127,
			'fieldName' => 132,
			'ranges' => 130
		}
	},
	{#State 80
		DEFAULT => -72
	},
	{#State 81
		ACTIONS => {
			'IDENT' => 134
		},
		GOTOS => {
			'oneofName' => 133
		}
	},
	{#State 82
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 135,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 83
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 136,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 84
		ACTIONS => {
			'INT_LITERAL' => 129
		},
		GOTOS => {
			'range' => 127,
			'ranges' => 137
		}
	},
	{#State 85
		ACTIONS => {
			"}" => 138
		}
	},
	{#State 86
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 139,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 87
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 140,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 88
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 141,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 89
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 142,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 90
		DEFAULT => -73
	},
	{#State 91
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 143,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 92
		ACTIONS => {
			"<" => 144
		}
	},
	{#State 93
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 145,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 94
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 146,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 95
		DEFAULT => -71
	},
	{#State 96
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 147,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 97
		ACTIONS => {
			"string" => 148,
			'IDENT' => 35,
			"bool" => 149,
			"uint64" => 150,
			"sfixed64" => 151,
			"double" => 153,
			"sint32" => 154,
			"fixed64" => 155,
			"fixed32" => 156,
			"int32" => 157,
			"bytes" => 158,
			"group" => 159,
			"uint32" => 160,
			"float" => 161,
			"sfixed32" => 162,
			"int64" => 165,
			"sint64" => 164
		},
		GOTOS => {
			'fullIdent' => 45,
			'type' => 163,
			'messageType' => 152
		}
	},
	{#State 98
		ACTIONS => {
			"map" => 92,
			"reserved" => 79,
			"optional" => 80,
			"option" => 7,
			";" => 6,
			"enum" => 17,
			"oneof" => 81,
			"extensions" => 84,
			"extend" => 23,
			"required" => 95,
			"message" => 12,
			"repeated" => 90
		},
		DEFAULT => -27,
		GOTOS => {
			'extend' => 93,
			'mapField' => 82,
			'emptyStatement' => 83,
			'message' => 94,
			'messageBodyA' => 166,
			'extensions' => 86,
			'group' => 87,
			'oneof' => 96,
			'enum' => 88,
			'label' => 97,
			'option' => 89,
			'reserved' => 98,
			'field' => 91
		}
	},
	{#State 99
		ACTIONS => {
			"." => 54
		},
		DEFAULT => -128,
		GOTOS => {
			'fullIdentA' => 167
		}
	},
	{#State 100
		ACTIONS => {
			"option" => 7,
			";" => 6,
			'IDENT' => 101
		},
		DEFAULT => -14,
		GOTOS => {
			'enumBodyA' => 168,
			'enumField' => 100,
			'option' => 103,
			'emptyStatement' => 102
		}
	},
	{#State 101
		ACTIONS => {
			"=" => 169
		}
	},
	{#State 102
		ACTIONS => {
			"option" => 7,
			";" => 6,
			'IDENT' => 101
		},
		DEFAULT => -14,
		GOTOS => {
			'enumBodyA' => 170,
			'enumField' => 100,
			'option' => 103,
			'emptyStatement' => 102
		}
	},
	{#State 103
		ACTIONS => {
			"option" => 7,
			";" => 6,
			'IDENT' => 101
		},
		DEFAULT => -14,
		GOTOS => {
			'enumBodyA' => 171,
			'enumField' => 100,
			'option' => 103,
			'emptyStatement' => 102
		}
	},
	{#State 104
		ACTIONS => {
			"}" => 172
		}
	},
	{#State 105
		DEFAULT => -124
	},
	{#State 106
		DEFAULT => -125
	},
	{#State 107
		ACTIONS => {
			"}" => 173
		}
	},
	{#State 108
		ACTIONS => {
			"required" => 95,
			"optional" => 80,
			";" => 6,
			"repeated" => 90
		},
		DEFAULT => -40,
		GOTOS => {
			'group' => 109,
			'extendA' => 174,
			'label' => 97,
			'emptyStatement' => 108,
			'field' => 110
		}
	},
	{#State 109
		ACTIONS => {
			"required" => 95,
			"optional" => 80,
			";" => 6,
			"repeated" => 90
		},
		DEFAULT => -40,
		GOTOS => {
			'group' => 109,
			'extendA' => 175,
			'label' => 97,
			'emptyStatement' => 108,
			'field' => 110
		}
	},
	{#State 110
		ACTIONS => {
			"required" => 95,
			"optional" => 80,
			";" => 6,
			"repeated" => 90
		},
		DEFAULT => -40,
		GOTOS => {
			'group' => 109,
			'extendA' => 176,
			'label' => 97,
			'emptyStatement' => 108,
			'field' => 110
		}
	},
	{#State 111
		DEFAULT => -121
	},
	{#State 112
		DEFAULT => -141
	},
	{#State 113
		DEFAULT => -144
	},
	{#State 114
		DEFAULT => -142
	},
	{#State 115
		DEFAULT => -145
	},
	{#State 116
		DEFAULT => -117
	},
	{#State 117
		DEFAULT => -119
	},
	{#State 118
		DEFAULT => -49
	},
	{#State 119
		DEFAULT => -136
	},
	{#State 120
		ACTIONS => {
			"(" => 177
		}
	},
	{#State 121
		DEFAULT => -46
	},
	{#State 122
		DEFAULT => -137
	},
	{#State 123
		ACTIONS => {
			"(" => 178
		}
	},
	{#State 124
		DEFAULT => -47
	},
	{#State 125
		DEFAULT => -48
	},
	{#State 126
		DEFAULT => -44
	},
	{#State 127
		ACTIONS => {
			"," => 180
		},
		DEFAULT => -61,
		GOTOS => {
			'rangesA' => 179
		}
	},
	{#State 128
		DEFAULT => -132
	},
	{#State 129
		ACTIONS => {
			"to" => 181
		},
		DEFAULT => -63
	},
	{#State 130
		ACTIONS => {
			";" => 182
		}
	},
	{#State 131
		ACTIONS => {
			";" => 183
		}
	},
	{#State 132
		ACTIONS => {
			"," => 185
		},
		DEFAULT => -69,
		GOTOS => {
			'fieldNamesA' => 184
		}
	},
	{#State 133
		ACTIONS => {
			"{" => 186
		}
	},
	{#State 134
		DEFAULT => -133
	},
	{#State 135
		DEFAULT => -36
	},
	{#State 136
		DEFAULT => -38
	},
	{#State 137
		ACTIONS => {
			";" => 187
		}
	},
	{#State 138
		DEFAULT => -26
	},
	{#State 139
		DEFAULT => -32
	},
	{#State 140
		DEFAULT => -33
	},
	{#State 141
		DEFAULT => -29
	},
	{#State 142
		DEFAULT => -34
	},
	{#State 143
		DEFAULT => -28
	},
	{#State 144
		ACTIONS => {
			"fixed32" => 194,
			"int32" => 195,
			"string" => 188,
			"bool" => 189,
			"uint64" => 190,
			"sfixed64" => 191,
			"uint32" => 197,
			"sfixed32" => 198,
			"sint32" => 192,
			"int64" => 200,
			"sint64" => 199,
			"fixed64" => 193
		},
		GOTOS => {
			'keyType' => 196
		}
	},
	{#State 145
		DEFAULT => -31
	},
	{#State 146
		DEFAULT => -30
	},
	{#State 147
		DEFAULT => -35
	},
	{#State 148
		DEFAULT => -87
	},
	{#State 149
		DEFAULT => -86
	},
	{#State 150
		DEFAULT => -79
	},
	{#State 151
		DEFAULT => -85
	},
	{#State 152
		DEFAULT => -89
	},
	{#State 153
		DEFAULT => -74
	},
	{#State 154
		DEFAULT => -80
	},
	{#State 155
		DEFAULT => -83
	},
	{#State 156
		DEFAULT => -82
	},
	{#State 157
		DEFAULT => -76
	},
	{#State 158
		DEFAULT => -88
	},
	{#State 159
		ACTIONS => {
			'IDENT' => 201
		}
	},
	{#State 160
		DEFAULT => -78
	},
	{#State 161
		DEFAULT => -75
	},
	{#State 162
		DEFAULT => -84
	},
	{#State 163
		ACTIONS => {
			'IDENT' => 128
		},
		GOTOS => {
			'fieldName' => 202
		}
	},
	{#State 164
		DEFAULT => -81
	},
	{#State 165
		DEFAULT => -77
	},
	{#State 166
		DEFAULT => -37
	},
	{#State 167
		DEFAULT => -129
	},
	{#State 168
		DEFAULT => -16
	},
	{#State 169
		ACTIONS => {
			"-" => 203
		},
		DEFAULT => -20,
		GOTOS => {
			'enumFieldA' => 204
		}
	},
	{#State 170
		DEFAULT => -17
	},
	{#State 171
		DEFAULT => -15
	},
	{#State 172
		DEFAULT => -13
	},
	{#State 173
		DEFAULT => -39
	},
	{#State 174
		DEFAULT => -43
	},
	{#State 175
		DEFAULT => -42
	},
	{#State 176
		DEFAULT => -41
	},
	{#State 177
		ACTIONS => {
			"stream" => 205
		},
		DEFAULT => -51,
		GOTOS => {
			'oStream' => 206
		}
	},
	{#State 178
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 45,
			'messageType' => 207
		}
	},
	{#State 179
		DEFAULT => -60
	},
	{#State 180
		ACTIONS => {
			'INT_LITERAL' => 129
		},
		GOTOS => {
			'range' => 208
		}
	},
	{#State 181
		ACTIONS => {
			"max" => 209,
			'INT_LITERAL' => 210
		}
	},
	{#State 182
		DEFAULT => -66
	},
	{#State 183
		DEFAULT => -67
	},
	{#State 184
		DEFAULT => -68
	},
	{#State 185
		ACTIONS => {
			'IDENT' => 128
		},
		GOTOS => {
			'fieldName' => 211
		}
	},
	{#State 186
		ACTIONS => {
			"string" => 148,
			";" => 6,
			'IDENT' => 35,
			"bool" => 149,
			"uint64" => 150,
			"sfixed64" => 151,
			"double" => 153,
			"sint32" => 154,
			"fixed64" => 155,
			"fixed32" => 156,
			"int32" => 157,
			"bytes" => 158,
			"uint32" => 160,
			"float" => 161,
			"sfixed32" => 162,
			"int64" => 165,
			"sint64" => 164
		},
		DEFAULT => -100,
		GOTOS => {
			'oneofField' => 214,
			'fullIdent' => 45,
			'type' => 215,
			'messageType' => 152,
			'emptyStatement' => 212,
			'oneofA' => 213
		}
	},
	{#State 187
		DEFAULT => -59
	},
	{#State 188
		DEFAULT => -116
	},
	{#State 189
		DEFAULT => -115
	},
	{#State 190
		DEFAULT => -108
	},
	{#State 191
		DEFAULT => -114
	},
	{#State 192
		DEFAULT => -109
	},
	{#State 193
		DEFAULT => -112
	},
	{#State 194
		DEFAULT => -111
	},
	{#State 195
		DEFAULT => -105
	},
	{#State 196
		ACTIONS => {
			"," => 216
		}
	},
	{#State 197
		DEFAULT => -107
	},
	{#State 198
		DEFAULT => -113
	},
	{#State 199
		DEFAULT => -110
	},
	{#State 200
		DEFAULT => -106
	},
	{#State 201
		ACTIONS => {
			"=" => 217
		}
	},
	{#State 202
		ACTIONS => {
			"=" => 218
		}
	},
	{#State 203
		DEFAULT => -21
	},
	{#State 204
		ACTIONS => {
			'INT_LITERAL' => 219
		}
	},
	{#State 205
		DEFAULT => -52
	},
	{#State 206
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 45,
			'messageType' => 220
		}
	},
	{#State 207
		ACTIONS => {
			"," => 221
		}
	},
	{#State 208
		ACTIONS => {
			"," => 180
		},
		DEFAULT => -61,
		GOTOS => {
			'rangesA' => 222
		}
	},
	{#State 209
		DEFAULT => -65
	},
	{#State 210
		DEFAULT => -64
	},
	{#State 211
		ACTIONS => {
			"," => 185
		},
		DEFAULT => -69,
		GOTOS => {
			'fieldNamesA' => 223
		}
	},
	{#State 212
		ACTIONS => {
			"string" => 148,
			";" => 6,
			'IDENT' => 35,
			"bool" => 149,
			"uint64" => 150,
			"sfixed64" => 151,
			"double" => 153,
			"sint32" => 154,
			"fixed64" => 155,
			"fixed32" => 156,
			"int32" => 157,
			"bytes" => 158,
			"uint32" => 160,
			"float" => 161,
			"sfixed32" => 162,
			"int64" => 165,
			"sint64" => 164
		},
		DEFAULT => -100,
		GOTOS => {
			'oneofField' => 214,
			'fullIdent' => 45,
			'type' => 215,
			'messageType' => 152,
			'emptyStatement' => 212,
			'oneofA' => 224
		}
	},
	{#State 213
		ACTIONS => {
			"}" => 225
		}
	},
	{#State 214
		ACTIONS => {
			"string" => 148,
			";" => 6,
			'IDENT' => 35,
			"bool" => 149,
			"uint64" => 150,
			"sfixed64" => 151,
			"double" => 153,
			"sint32" => 154,
			"fixed64" => 155,
			"fixed32" => 156,
			"int32" => 157,
			"bytes" => 158,
			"uint32" => 160,
			"float" => 161,
			"sfixed32" => 162,
			"int64" => 165,
			"sint64" => 164
		},
		DEFAULT => -100,
		GOTOS => {
			'oneofField' => 214,
			'fullIdent' => 45,
			'type' => 215,
			'messageType' => 152,
			'emptyStatement' => 212,
			'oneofA' => 226
		}
	},
	{#State 215
		ACTIONS => {
			'IDENT' => 128
		},
		GOTOS => {
			'fieldName' => 227
		}
	},
	{#State 216
		ACTIONS => {
			"string" => 148,
			'IDENT' => 35,
			"bool" => 149,
			"uint64" => 150,
			"sfixed64" => 151,
			"double" => 153,
			"sint32" => 154,
			"fixed64" => 155,
			"fixed32" => 156,
			"int32" => 157,
			"bytes" => 158,
			"uint32" => 160,
			"float" => 161,
			"sfixed32" => 162,
			"sint64" => 164,
			"int64" => 165
		},
		GOTOS => {
			'fullIdent' => 45,
			'type' => 228,
			'messageType' => 152
		}
	},
	{#State 217
		ACTIONS => {
			'INT_LITERAL' => 230
		},
		GOTOS => {
			'fieldNumber' => 229
		}
	},
	{#State 218
		ACTIONS => {
			'INT_LITERAL' => 230
		},
		GOTOS => {
			'fieldNumber' => 231
		}
	},
	{#State 219
		ACTIONS => {
			";" => 232,
			"[" => 233
		}
	},
	{#State 220
		ACTIONS => {
			")" => 234
		}
	},
	{#State 221
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 45,
			'messageType' => 235
		}
	},
	{#State 222
		DEFAULT => -62
	},
	{#State 223
		DEFAULT => -70
	},
	{#State 224
		DEFAULT => -102
	},
	{#State 225
		DEFAULT => -99
	},
	{#State 226
		DEFAULT => -101
	},
	{#State 227
		ACTIONS => {
			"=" => 236
		}
	},
	{#State 228
		ACTIONS => {
			">" => 237
		}
	},
	{#State 229
		ACTIONS => {
			"{" => 52
		},
		GOTOS => {
			'messageBody' => 238
		}
	},
	{#State 230
		DEFAULT => -90
	},
	{#State 231
		ACTIONS => {
			"[" => 240
		},
		DEFAULT => -92,
		GOTOS => {
			'fieldA' => 239
		}
	},
	{#State 232
		DEFAULT => -18
	},
	{#State 233
		ACTIONS => {
			"(" => 27,
			'IDENT' => 25
		},
		GOTOS => {
			'optionName' => 241,
			'enumValueOption' => 242,
			'enumValueOptions' => 243
		}
	},
	{#State 234
		ACTIONS => {
			"returns" => 244
		}
	},
	{#State 235
		ACTIONS => {
			")" => 245
		}
	},
	{#State 236
		ACTIONS => {
			'INT_LITERAL' => 230
		},
		GOTOS => {
			'fieldNumber' => 246
		}
	},
	{#State 237
		ACTIONS => {
			'IDENT' => 247
		},
		GOTOS => {
			'mapName' => 248
		}
	},
	{#State 238
		DEFAULT => -98
	},
	{#State 239
		ACTIONS => {
			";" => 249
		}
	},
	{#State 240
		ACTIONS => {
			"(" => 27,
			'IDENT' => 25
		},
		GOTOS => {
			'fieldOptions' => 252,
			'fieldOption' => 251,
			'optionName' => 250
		}
	},
	{#State 241
		ACTIONS => {
			"=" => 253
		}
	},
	{#State 242
		ACTIONS => {
			"," => 254
		},
		DEFAULT => -22
	},
	{#State 243
		ACTIONS => {
			"]" => 255
		}
	},
	{#State 244
		ACTIONS => {
			"(" => 256
		}
	},
	{#State 245
		ACTIONS => {
			";" => 258,
			"{" => 259
		},
		GOTOS => {
			'rpcA' => 257
		}
	},
	{#State 246
		ACTIONS => {
			"[" => 240
		},
		DEFAULT => -92,
		GOTOS => {
			'fieldA' => 260
		}
	},
	{#State 247
		DEFAULT => -134
	},
	{#State 248
		ACTIONS => {
			"=" => 261
		}
	},
	{#State 249
		DEFAULT => -91
	},
	{#State 250
		ACTIONS => {
			"=" => 262
		}
	},
	{#State 251
		ACTIONS => {
			"," => 263
		},
		DEFAULT => -95,
		GOTOS => {
			'fieldOptionsA' => 264
		}
	},
	{#State 252
		ACTIONS => {
			"]" => 265
		}
	},
	{#State 253
		ACTIONS => {
			'BOOL_LITERAL' => 66,
			"-" => 63,
			"+" => 64,
			'IDENT' => 35,
			'STR_LITERAL' => 70,
			'INT_LITERAL' => 65,
			'FLOAT_LITERAL' => 67
		},
		GOTOS => {
			'fullIdent' => 68,
			'constant' => 266
		}
	},
	{#State 254
		ACTIONS => {
			"(" => 27,
			'IDENT' => 25
		},
		GOTOS => {
			'optionName' => 241,
			'enumValueOption' => 242,
			'enumValueOptions' => 267
		}
	},
	{#State 255
		ACTIONS => {
			";" => 268
		}
	},
	{#State 256
		ACTIONS => {
			"stream" => 205
		},
		DEFAULT => -51,
		GOTOS => {
			'oStream' => 269
		}
	},
	{#State 257
		DEFAULT => -58
	},
	{#State 258
		DEFAULT => -54
	},
	{#State 259
		ACTIONS => {
			"option" => 7,
			";" => 6
		},
		DEFAULT => -55,
		GOTOS => {
			'option' => 272,
			'rpcB' => 271,
			'emptyStatement' => 270
		}
	},
	{#State 260
		ACTIONS => {
			";" => 273
		}
	},
	{#State 261
		ACTIONS => {
			'INT_LITERAL' => 230
		},
		GOTOS => {
			'fieldNumber' => 274
		}
	},
	{#State 262
		ACTIONS => {
			'BOOL_LITERAL' => 66,
			"-" => 63,
			"+" => 64,
			'IDENT' => 35,
			'STR_LITERAL' => 70,
			'INT_LITERAL' => 65,
			'FLOAT_LITERAL' => 67
		},
		GOTOS => {
			'fullIdent' => 68,
			'constant' => 275
		}
	},
	{#State 263
		ACTIONS => {
			"(" => 27,
			'IDENT' => 25
		},
		GOTOS => {
			'fieldOption' => 276,
			'optionName' => 250
		}
	},
	{#State 264
		DEFAULT => -94
	},
	{#State 265
		DEFAULT => -93
	},
	{#State 266
		DEFAULT => -24
	},
	{#State 267
		DEFAULT => -23
	},
	{#State 268
		DEFAULT => -19
	},
	{#State 269
		ACTIONS => {
			'IDENT' => 35
		},
		GOTOS => {
			'fullIdent' => 45,
			'messageType' => 277
		}
	},
	{#State 270
		ACTIONS => {
			"option" => 7,
			";" => 6
		},
		DEFAULT => -55,
		GOTOS => {
			'option' => 272,
			'rpcB' => 278,
			'emptyStatement' => 270
		}
	},
	{#State 271
		ACTIONS => {
			"}" => 279
		}
	},
	{#State 272
		ACTIONS => {
			"option" => 7,
			";" => 6
		},
		DEFAULT => -55,
		GOTOS => {
			'option' => 272,
			'rpcB' => 280,
			'emptyStatement' => 270
		}
	},
	{#State 273
		DEFAULT => -103
	},
	{#State 274
		ACTIONS => {
			"[" => 240
		},
		DEFAULT => -92,
		GOTOS => {
			'fieldA' => 281
		}
	},
	{#State 275
		DEFAULT => -97
	},
	{#State 276
		ACTIONS => {
			"," => 263
		},
		DEFAULT => -95,
		GOTOS => {
			'fieldOptionsA' => 282
		}
	},
	{#State 277
		ACTIONS => {
			")" => 283
		}
	},
	{#State 278
		DEFAULT => -57
	},
	{#State 279
		DEFAULT => -53
	},
	{#State 280
		DEFAULT => -56
	},
	{#State 281
		ACTIONS => {
			";" => 284
		}
	},
	{#State 282
		DEFAULT => -96
	},
	{#State 283
		ACTIONS => {
			";" => 258,
			"{" => 259
		},
		GOTOS => {
			'rpcA' => 285
		}
	},
	{#State 284
		DEFAULT => -104
	},
	{#State 285
		DEFAULT => -50
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'proto', 2,
sub
#line 15 "grammar.yp"
{
          return $_[2];
      }
	],
	[#Rule 2
		 'protoA', 0,
sub
#line 18 "grammar.yp"
{
           return {
               "imports" => [],
               "package" => "",
               "options" => [],
               "defs" => [],
           };
       }
	],
	[#Rule 3
		 'protoA', 2,
sub
#line 26 "grammar.yp"
{
           push @{$_[2]->{"imports"}}, $_[1];
           return $_[2];
       }
	],
	[#Rule 4
		 'protoA', 2,
sub
#line 30 "grammar.yp"
{
           $_[2]->{"package"} = $_[1];
           return $_[2];
       }
	],
	[#Rule 5
		 'protoA', 2,
sub
#line 34 "grammar.yp"
{
           push @{$_[2]->{"options"}}, $_[1];
           return $_[2];
       }
	],
	[#Rule 6
		 'protoA', 2,
sub
#line 38 "grammar.yp"
{
           push @{$_[2]->{"defs"}}, $_[1];
           return $_[2];
       }
	],
	[#Rule 7
		 'protoA', 2,
sub
#line 42 "grammar.yp"
{
           return $_[2];
       }
	],
	[#Rule 8
		 'topLevelDef', 1,
sub
#line 47 "grammar.yp"
{ return $_[1]; }
	],
	[#Rule 9
		 'topLevelDef', 1,
sub
#line 48 "grammar.yp"
{ return $_[1]; }
	],
	[#Rule 10
		 'topLevelDef', 1,
sub
#line 49 "grammar.yp"
{ return $_[1]; }
	],
	[#Rule 11
		 'topLevelDef', 1,
sub
#line 50 "grammar.yp"
{ return $_[1]; }
	],
	[#Rule 12
		 'enum', 3,
sub
#line 60 "grammar.yp"
{
         return {
             "type" => "enum",
             "name" => $_[2],
             "body" => $_[3],
         };
     }
	],
	[#Rule 13
		 'enumBody', 3,
sub
#line 68 "grammar.yp"
{
             return $_[2];
         }
	],
	[#Rule 14
		 'enumBodyA', 0,
sub
#line 71 "grammar.yp"
{
              return {
                  "options" => [],
                  "fields" => [],
              };
          }
	],
	[#Rule 15
		 'enumBodyA', 2,
sub
#line 77 "grammar.yp"
{
              push @{$_[2]->{"options"}}, $_[1];
              return $_[2];
          }
	],
	[#Rule 16
		 'enumBodyA', 2,
sub
#line 81 "grammar.yp"
{
              push @{$_[2]->{"fields"}}, $_[1];
              return $_[2];
          }
	],
	[#Rule 17
		 'enumBodyA', 2,
sub
#line 85 "grammar.yp"
{ return $_[2]; }
	],
	[#Rule 18
		 'enumField', 5,
sub
#line 89 "grammar.yp"
{
              return {
                  "type" => "enumField",
                  "name" => $_[1],
                  "value" => $_[4],
              }
          }
	],
	[#Rule 19
		 'enumField', 8,
sub
#line 96 "grammar.yp"
{
              return {
                  "type" => "enumField",
                  "name" => $_[1],
                  "value" => $_[4],
              }
          }
	],
	[#Rule 20
		 'enumFieldA', 0, undef
	],
	[#Rule 21
		 'enumFieldA', 1, undef
	],
	[#Rule 22
		 'enumValueOptions', 1, undef
	],
	[#Rule 23
		 'enumValueOptions', 3, undef
	],
	[#Rule 24
		 'enumValueOption', 3, undef
	],
	[#Rule 25
		 'message', 3,
sub
#line 116 "grammar.yp"
{
            return {
                "type" => "message",
                "name" => $_[2],
                "body" => $_[3],
            };
        }
	],
	[#Rule 26
		 'messageBody', 3,
sub
#line 124 "grammar.yp"
{
                return $_[2];
            }
	],
	[#Rule 27
		 'messageBodyA', 0,
sub
#line 127 "grammar.yp"
{
                 return {
                     "fields" => [],
                     "messages" => [],
                     "enums" => [],
                     "extends" => [],
                     "extensions" => [],
                     "groups" => [],
                     "options" => [],
                     "reserves" => [],
                 };
             }
	],
	[#Rule 28
		 'messageBodyA', 2,
sub
#line 139 "grammar.yp"
{
                 push @{$_[2]->{"fields"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 29
		 'messageBodyA', 2,
sub
#line 143 "grammar.yp"
{
                 push @{$_[2]->{"enums"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 30
		 'messageBodyA', 2,
sub
#line 147 "grammar.yp"
{
                 push @{$_[2]->{"messages"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 31
		 'messageBodyA', 2,
sub
#line 151 "grammar.yp"
{
                 push @{$_[2]->{"extends"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 32
		 'messageBodyA', 2,
sub
#line 155 "grammar.yp"
{
                 push @{$_[2]->{"extensions"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 33
		 'messageBodyA', 2,
sub
#line 159 "grammar.yp"
{
                 push @{$_[2]->{"groups"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 34
		 'messageBodyA', 2,
sub
#line 163 "grammar.yp"
{
                 push @{$_[2]->{"options"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 35
		 'messageBodyA', 2,
sub
#line 167 "grammar.yp"
{
                 push @{$_[2]->{"fields"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 36
		 'messageBodyA', 2,
sub
#line 171 "grammar.yp"
{
                 push @{$_[2]->{"fields"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 37
		 'messageBodyA', 2,
sub
#line 175 "grammar.yp"
{
                 push @{$_[2]->{"reserves"}}, $_[1];
                 return $_[2];
             }
	],
	[#Rule 38
		 'messageBodyA', 2,
sub
#line 179 "grammar.yp"
{ return $_[2] }
	],
	[#Rule 39
		 'extend', 5,
sub
#line 185 "grammar.yp"
{
           return {
               "type" => "extend",
               "name" => $_[2],
               "body" => $_[3],
           };
       }
	],
	[#Rule 40
		 'extendA', 0,
sub
#line 192 "grammar.yp"
{
            return {
                "fields" => [],
                "groups" => [],
            };
        }
	],
	[#Rule 41
		 'extendA', 2,
sub
#line 198 "grammar.yp"
{
            push @{$_[2]->{"fields"}}, $_[1];
            return $_[2];
        }
	],
	[#Rule 42
		 'extendA', 2,
sub
#line 202 "grammar.yp"
{
            push @{$_[2]->{"groups"}}, $_[1];
            return $_[2];
        }
	],
	[#Rule 43
		 'extendA', 2,
sub
#line 206 "grammar.yp"
{ return $_[2]; }
	],
	[#Rule 44
		 'service', 5,
sub
#line 212 "grammar.yp"
{
            return {
                "type" => "service",
            };
        }
	],
	[#Rule 45
		 'serviceA', 0, undef
	],
	[#Rule 46
		 'serviceA', 2, undef
	],
	[#Rule 47
		 'serviceA', 2, undef
	],
	[#Rule 48
		 'serviceA', 2, undef
	],
	[#Rule 49
		 'serviceA', 2, undef
	],
	[#Rule 50
		 'rpc', 12,
sub
#line 224 "grammar.yp"
{
        return {
            "type" => "rpc",
        };
    }
	],
	[#Rule 51
		 'oStream', 0, undef
	],
	[#Rule 52
		 'oStream', 1, undef
	],
	[#Rule 53
		 'rpcA', 3, undef
	],
	[#Rule 54
		 'rpcA', 1, undef
	],
	[#Rule 55
		 'rpcB', 0, undef
	],
	[#Rule 56
		 'rpcB', 2, undef
	],
	[#Rule 57
		 'rpcB', 2, undef
	],
	[#Rule 58
		 'stream', 8,
sub
#line 240 "grammar.yp"
{
           return {
               "type" => "stream",
           };
       }
	],
	[#Rule 59
		 'extensions', 3,
sub
#line 253 "grammar.yp"
{
               return $_[2];
           }
	],
	[#Rule 60
		 'ranges', 2,
sub
#line 257 "grammar.yp"
{
           push @{$_[2]}, $_[1];
           return $_[2];
       }
	],
	[#Rule 61
		 'rangesA', 0,
sub
#line 261 "grammar.yp"
{ return []; }
	],
	[#Rule 62
		 'rangesA', 3,
sub
#line 262 "grammar.yp"
{
            push @{$_[3]}, $_[2];
            return $_[3];
        }
	],
	[#Rule 63
		 'range', 1,
sub
#line 268 "grammar.yp"
{ return $_[1]; }
	],
	[#Rule 64
		 'range', 3,
sub
#line 269 "grammar.yp"
{
          return {
              "min" => $_[1],
              "max" => $_[3],
          };
      }
	],
	[#Rule 65
		 'range', 3,
sub
#line 275 "grammar.yp"
{
          return {
              "min" => $_[1],
              "max" => "max",
          };
      }
	],
	[#Rule 66
		 'reserved', 3,
sub
#line 285 "grammar.yp"
{
             return {
                 "type" => "ranges",
                 "values" => $_[2],
             };
         }
	],
	[#Rule 67
		 'reserved', 3,
sub
#line 291 "grammar.yp"
{
             return {
                 "type" => "fields",
                 "values" => $_[2],
             };
         }
	],
	[#Rule 68
		 'fieldNames', 2,
sub
#line 299 "grammar.yp"
{
               push @{$_[2]}, $_[1];
               return $_[2];
           }
	],
	[#Rule 69
		 'fieldNamesA', 0,
sub
#line 303 "grammar.yp"
{ return []; }
	],
	[#Rule 70
		 'fieldNamesA', 3,
sub
#line 304 "grammar.yp"
{
                push @{$_[3]}, $_[2];
                return $_[3];
            }
	],
	[#Rule 71
		 'label', 1,
sub
#line 315 "grammar.yp"
{ return "required"; }
	],
	[#Rule 72
		 'label', 1,
sub
#line 316 "grammar.yp"
{ return "optional"; }
	],
	[#Rule 73
		 'label', 1,
sub
#line 317 "grammar.yp"
{ return "repeated"; }
	],
	[#Rule 74
		 'type', 1,
sub
#line 320 "grammar.yp"
{ return {"t" => "float64", "c" => "primitive", "cpp" => "double"}; }
	],
	[#Rule 75
		 'type', 1,
sub
#line 321 "grammar.yp"
{ return {"t" => "float32", "c" => "primitive", "cpp" => "float"}; }
	],
	[#Rule 76
		 'type', 1,
sub
#line 322 "grammar.yp"
{ return {"t" => "int32", "c" => "primitive", "cpp" => "int32_t"}; }
	],
	[#Rule 77
		 'type', 1,
sub
#line 323 "grammar.yp"
{ return {"t" => "int64", "c" => "primitive", "cpp" => "int64_t"}; }
	],
	[#Rule 78
		 'type', 1,
sub
#line 324 "grammar.yp"
{ return {"t" => "uint32", "c" => "primitive", "cpp" => "uint32_t"}; }
	],
	[#Rule 79
		 'type', 1,
sub
#line 325 "grammar.yp"
{ return {"t" => "uint64", "c" => "primitive", "cpp" => "uint64_t"}; }
	],
	[#Rule 80
		 'type', 1,
sub
#line 326 "grammar.yp"
{ return {"t" => "int32", "c" => "primitive", "cpp" => "int32_t"}; }
	],
	[#Rule 81
		 'type', 1,
sub
#line 327 "grammar.yp"
{ return {"t" => "int64", "c" => "primitive", "cpp" => "int64_t"}; }
	],
	[#Rule 82
		 'type', 1,
sub
#line 328 "grammar.yp"
{ return {"t" => "uint32", "c" => "primitive", "cpp" => "uint32_t"}; }
	],
	[#Rule 83
		 'type', 1,
sub
#line 329 "grammar.yp"
{ return {"t" => "uint64", "c" => "primitive", "cpp" => "uint64_t"}; }
	],
	[#Rule 84
		 'type', 1,
sub
#line 330 "grammar.yp"
{ return {"t" => "int32", "c" => "primitive", "cpp" => "int32_t"}; }
	],
	[#Rule 85
		 'type', 1,
sub
#line 331 "grammar.yp"
{ return {"t" => "int64", "c" => "primitive", "cpp" => "int64_t"}; }
	],
	[#Rule 86
		 'type', 1,
sub
#line 332 "grammar.yp"
{ return {"t" => "boolean", "c" => "primitive", "cpp" => "bool"}; }
	],
	[#Rule 87
		 'type', 1,
sub
#line 333 "grammar.yp"
{ return {"t" => "rstring", "c" => "primitive", "cpp" => "std::string"}; }
	],
	[#Rule 88
		 'type', 1,
sub
#line 334 "grammar.yp"
{ return {"t" => "blob", "c" => "primitive", "cpp" => "std::string"}; }
	],
	[#Rule 89
		 'type', 1,
sub
#line 335 "grammar.yp"
{ return {"t" => $_[1], "c" => "complex"}; }
	],
	[#Rule 90
		 'fieldNumber', 1, undef
	],
	[#Rule 91
		 'field', 7,
sub
#line 344 "grammar.yp"
{
          return {
              "label" => $_[1],
              "type" => $_[2]->{"c"},
              "dataType" => $_[2]->{"t"},
              "cppType" => $_[2]->{"cpp"},
              "name" => $_[3],
          };
      }
	],
	[#Rule 92
		 'fieldA', 0, undef
	],
	[#Rule 93
		 'fieldA', 3, undef
	],
	[#Rule 94
		 'fieldOptions', 2, undef
	],
	[#Rule 95
		 'fieldOptionsA', 0, undef
	],
	[#Rule 96
		 'fieldOptionsA', 3, undef
	],
	[#Rule 97
		 'fieldOption', 3, undef
	],
	[#Rule 98
		 'group', 6,
sub
#line 367 "grammar.yp"
{
          return {
              "type" => "group",
              "name" => $_[3],
              "body" => $_[6],
          };
      }
	],
	[#Rule 99
		 'oneof', 5,
sub
#line 378 "grammar.yp"
{
          return {
              "type" => "oneof",
              "name" => $_[2],
              "fields" => $_[4],
          };
      }
	],
	[#Rule 100
		 'oneofA', 0,
sub
#line 385 "grammar.yp"
{
           return [];
       }
	],
	[#Rule 101
		 'oneofA', 2,
sub
#line 388 "grammar.yp"
{
           push @{$_[2]}, $_[1];
           return $_[2];
       }
	],
	[#Rule 102
		 'oneofA', 2,
sub
#line 392 "grammar.yp"
{
           return $_[2];
       }
	],
	[#Rule 103
		 'oneofField', 6,
sub
#line 397 "grammar.yp"
{
               return {
                   "label" => "optional",
                   "type" => $_[1]->{"c"},
                   "dataType" => $_[1]->{"t"},
                   "name" => $_[2],
               };
           }
	],
	[#Rule 104
		 'mapField', 11,
sub
#line 409 "grammar.yp"
{
             return {
                 "type" => "map",
                 "name" => $_[7],
                 "keyType" => $_[3]->{"t"},
                 "keyCppType" => $_[3]->{"cpp"},
                 "valType" => $_[5]->{"c"},
                 "valCppType" => $_[5]->{"cpp"},
                 "valDataType" => $_[5]->{"t"},
             };
         }
	],
	[#Rule 105
		 'keyType', 1,
sub
#line 421 "grammar.yp"
{ return {"t" => "int32", "c" => "primitive", "cpp" => "int32_t"}; }
	],
	[#Rule 106
		 'keyType', 1,
sub
#line 422 "grammar.yp"
{ return {"t" => "int64", "c" => "primitive", "cpp" => "int64_t"}; }
	],
	[#Rule 107
		 'keyType', 1,
sub
#line 423 "grammar.yp"
{ return {"t" => "uint32", "c" => "primitive", "cpp" => "uint32_t"}; }
	],
	[#Rule 108
		 'keyType', 1,
sub
#line 424 "grammar.yp"
{ return {"t" => "uint64", "c" => "primitive", "cpp" => "uint64_t"}; }
	],
	[#Rule 109
		 'keyType', 1,
sub
#line 425 "grammar.yp"
{ return {"t" => "int32", "c" => "primitive", "cpp" => "int32_t"}; }
	],
	[#Rule 110
		 'keyType', 1,
sub
#line 426 "grammar.yp"
{ return {"t" => "int64", "c" => "primitive", "cpp" => "int64_t"}; }
	],
	[#Rule 111
		 'keyType', 1,
sub
#line 427 "grammar.yp"
{ return {"t" => "uint32", "c" => "primitive", "cpp" => "uint32_t"}; }
	],
	[#Rule 112
		 'keyType', 1,
sub
#line 428 "grammar.yp"
{ return {"t" => "uint64", "c" => "primitive", "cpp" => "uint64_t"}; }
	],
	[#Rule 113
		 'keyType', 1,
sub
#line 429 "grammar.yp"
{ return {"t" => "int32", "c" => "primitive", "cpp" => "int32_t"}; }
	],
	[#Rule 114
		 'keyType', 1,
sub
#line 430 "grammar.yp"
{ return {"t" => "int64", "c" => "primitive", "cpp" => "int64_t"}; }
	],
	[#Rule 115
		 'keyType', 1,
sub
#line 431 "grammar.yp"
{ return {"t" => "boolean", "c" => "primitive", "cpp" => "bool"}; }
	],
	[#Rule 116
		 'keyType', 1,
sub
#line 432 "grammar.yp"
{ return {"t" => "rstring", "c" => "primitive", "cpp" => "std::string"}; }
	],
	[#Rule 117
		 'option', 5,
sub
#line 440 "grammar.yp"
{
           return {
               "type" => "option",
               "name" => $_[2],
               "val" => $_[4],
           };
       }
	],
	[#Rule 118
		 'optionName', 2, undef
	],
	[#Rule 119
		 'optionName', 4, undef
	],
	[#Rule 120
		 'optionNameA', 0, undef
	],
	[#Rule 121
		 'optionNameA', 3, undef
	],
	[#Rule 122
		 'package', 3,
sub
#line 460 "grammar.yp"
{
            return $_[2];
        }
	],
	[#Rule 123
		 'import', 3,
sub
#line 469 "grammar.yp"
{
           return $_[2];
       }
	],
	[#Rule 124
		 'import', 4,
sub
#line 472 "grammar.yp"
{
           return $_[2];
       }
	],
	[#Rule 125
		 'import', 4,
sub
#line 475 "grammar.yp"
{
           return $_[2];
       }
	],
	[#Rule 126
		 'syntax', 3,
sub
#line 485 "grammar.yp"
{
           unless ($_[3] eq "\"proto2\"") {
               die("Expected to find a proto2 file");
           }
           return $_[3];
       }
	],
	[#Rule 127
		 'fullIdent', 2,
sub
#line 499 "grammar.yp"
{
              return $_[1] . $_[2];
          }
	],
	[#Rule 128
		 'fullIdentA', 0,
sub
#line 502 "grammar.yp"
{ return ""; }
	],
	[#Rule 129
		 'fullIdentA', 3,
sub
#line 503 "grammar.yp"
{
               return "." . $_[2] . $_[3];
           }
	],
	[#Rule 130
		 'messageName', 1, undef
	],
	[#Rule 131
		 'enumName', 1, undef
	],
	[#Rule 132
		 'fieldName', 1, undef
	],
	[#Rule 133
		 'oneofName', 1, undef
	],
	[#Rule 134
		 'mapName', 1, undef
	],
	[#Rule 135
		 'serviceName', 1, undef
	],
	[#Rule 136
		 'rpcName', 1, undef
	],
	[#Rule 137
		 'streamName', 1, undef
	],
	[#Rule 138
		 'messageType', 1, undef
	],
	[#Rule 139
		 'emptyStatement', 1, undef
	],
	[#Rule 140
		 'constant', 1, undef
	],
	[#Rule 141
		 'constant', 2, undef
	],
	[#Rule 142
		 'constant', 2, undef
	],
	[#Rule 143
		 'constant', 1, undef
	],
	[#Rule 144
		 'constant', 2, undef
	],
	[#Rule 145
		 'constant', 2, undef
	],
	[#Rule 146
		 'constant', 1, undef
	],
	[#Rule 147
		 'constant', 1, undef
	],
	[#Rule 148
		 'constant', 1, undef
	]
],
                                  @_);
    bless($self,$class);
}

#line 538 "grammar.yp"


1;
