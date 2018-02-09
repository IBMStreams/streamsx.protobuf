#!/usr/bin/perl

use Cwd;
my $dir = getcwd;

my $file = "";
if ($ARGV[0] eq "lib") {
    print "customproto\n";
} elsif ($ARGV[0] eq "libPath") {
    print $dir . "/impl/lib/\n";
} elsif ($ARGV[0] eq "includePath") {
    print $dir . "/impl/include\n";
}
