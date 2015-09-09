use v6;
use Test;
use lib './lib';
use lib './src/htslib';
use Bio::Samtools;

#use Bio::Samtools;

plan 3;

ok my $lib = Bio::Samtools.new(), 'module loads';
lives-ok { $lib.install-library() }, 'installed libbam library found';
ok $lib.install-library() ~~ /libbam\./, "Lib found:" ~ $lib.install-library()
