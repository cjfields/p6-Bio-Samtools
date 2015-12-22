use v6;

use Bio::Samtools::Library;
use NativeCall;

#define bam_open(fn, mode) bgzf_open(fn, mode)
#define bam_dopen(fd, mode) bgzf_fdopen(fd, mode)
#define bam_close(fp) bgzf_close(fp)
#define bam_tell(fp) bgzf_tell(fp)
#define bam_seek(fp, pos, dir) bgzf_seek(fp, pos, dir)

# typedef bam_hdr_t bam_header_t;

class Bam-File is repr('CPointer') { * }

# /*! @typedef
#   @abstract Structure for the alignment header.
#   @field n_targets   number of reference sequences
#   @field target_name names of the reference sequences
#   @field target_len  lengths of the referene sequences
#   @field dict        header dictionary
#   @field hash        hash table for fast name lookup
#   @field rg2lib      hash table for @RG-ID -> LB lookup
#   @field l_text      length of the plain text in the header
#   @field text        plain text
#
#   @discussion Field hash points to null by default. It is a private
#   member.
#  */

class Bam-Header is repr('CStruct') {
    has int $.n_targets;
    has CArray[ Str ] $.target_name;
    has CArray[ int ] $.target_len;
}

sub bam_open(Str, Str) is native($LIBBAM) { * }
#sub bam_dopen(int, Str) is native($LIBBAM) { * }
sub bam_close(Bam-File) is native($LIBBAM) { * }
sub bam_tell(Bam-File) is native($LIBBAM) { * }
sub bam_seek(Bam-File, int, int) is native($LIBBAM) { * }
