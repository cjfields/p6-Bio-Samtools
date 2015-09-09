use v6;
use NativeCall;

###/*! @abstract BAM file handler */
###/*! @typedef
###  @abstract Structure for the alignment header.
###  @field n_targets   number of reference sequences
###  @field target_name names of the reference sequences
###  @field target_len  lengths of the referene sequences
###  @field dict        header dictionary
###  @field hash        hash table for fast name lookup
###  @field rg2lib      hash table for @RG-ID -> LB lookup
###  @field l_text      length of the plain text in the header
###  @field text        plain text
###
###  @discussion Field hash points to null by default. It is a private
###  member.
### */
###typedef bam_hdr_t bam_header_t;
###
###// TODO This flag-formatting functionality does not currently exist in htslib
####define BAM_OFDEC          0
####define BAM_OFHEX          1
####define BAM_OFSTR          2
###
###/*! @abstract defautl mask for pileup */
####define BAM_DEF_MASK (BAM_FUNMAP | BAM_FSECONDARY | BAM_FQCFAIL | BAM_FDUP)

### BAM FILE I/O

#define bam_open(fn, mode) bgzf_open(fn, mode)
sub bam_open($fn, :$mode) is native('libbam');

#define bam_dopen(fd, mode) bgzf_fdopen(fd, mode)
sub bam_dopen(:$fd, :$mode) is native('libbam');

#define bam_close(fp) bgzf_close(fp)
sub bam_close(:$fp) is native('libbam');

#define bam_tell(fp) bgzf_tell(fp)
sub bam_tell(:$fp) is native('libbam');

#define bam_seek(fp, pos, dir) bgzf_seek(fp, pos, dir)
sub bam_seek(:$fp, :$pos, :$dir) is native('libbam');

