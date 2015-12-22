use v6;

# Find our compiled library.
# It was installed along with this .pm6 file, so it should be somewhere in
# @*INC
use Bio::Samtools::Library;

class Bio::Samtools {

    method install-library {
        return $LIBBAM;
    }

}
