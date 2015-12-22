
use v6;
use LibraryMake;

# this is relative to the path in the makefile
my $destdir = 'resources';
my %vars = get-vars($destdir);
mkdir $destdir;
process-makefile('./src', %vars);
make("./src", $destdir);
