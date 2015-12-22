use v6;
use LibraryMake;

module Bio::Samtools::Library {

    BEGIN {
        our sub library {
            my $so = get-vars('')<SO>;
            if %?RESOURCES{"libbam.a."} {
                return ~(%?RESOURCES{"libbam.a"});
            } else {
                die "Unable to find libbam.a";
            }
        }

        our $LIBBAM is export = library()
    }

}
