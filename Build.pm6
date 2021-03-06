use v6;
use Panda::Common;
use Panda::Builder;
use Shell::Command;
use LibraryMake;

class Build is Panda::Builder {
    method build($workdir) {
        my $makefiledir = "$workdir/src";
        my $destdir = "$workdir/resources";
        mkpath $destdir;
        make($makefiledir, $destdir);
    }

    # method build($dir) {
    #     my Str $ext = "$dir/src";
    #     my Str $blib = "$dir/blib";
    #     rm_rf($blib);
    #     mkdir($blib);
    #     mkdir("$blib/lib");
    #     make($ext, "$blib/lib");
    # }
}
