use v6;
use LibraryMake;

module Bio::Samtools::Library {

    BEGIN {
        our sub library {
            for @*INC {
            my ($type, $path) = .split("#",2);
                if ($path ~ '/libbam.a').IO ~~ :f {
                    return $_~'/libbam.a';
                }
            }
            die "Unable to find libbam.a";
        }
        
        our $LIBBAM is export = library()
    }

}
