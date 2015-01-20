#!/usr/bin/env perl

use strict;
use warnings;

sub unlink_them {
    my @files_to_del = @_;
    for my $to_delete (@files_to_del) {
        unlink $to_delete;
    }
}

sub create_file_list {
    my @del_arr;
    my $home_dir = $ENV{"HOME"};
    my @debug    = glob "$home_dir/*debuglog.txt";
    my @gout     = glob "$home_dir/.goutputstream-*";
    my @libp     = glob "$home_dir/libpeerconnection*";
    my $debug    = $home_dir . '/C:\nppdf32Log\debuglog.txt';

    push @del_arr, @debug;
    push @del_arr, @gout;
    push @del_arr, @libp;
    push @del_arr, $debug if -e $debug;

    return \@del_arr;
}

sub delete_files {
    my @del_arr = @_;
    if ( @del_arr > 0 ) {
        unlink_them(@del_arr);
    }
    else {
        exit 0;
    }

    return 1;
}

sub main {
    my $del_arr = create_file_list();
    delete_files( @{$del_arr} );
}

main();
