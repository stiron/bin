#!/usr/bin/env perl

use strict;
use warnings;

sub unlink_files {
    my @files_to_del = @_;
    for my $to_delete (@files_to_del) {
        unlink $to_delete or warn "Cannot unlink $to_delete: $!\n";
    }
}

sub create_file_list {
    my $home_dir = $ENV{"HOME"};
    my @del_arr  = glob "$home_dir/.goutputstream-*";
    return \@del_arr;
}

sub delete_files {
    my @del_arr = @_;
    if ( @del_arr > 0 ) {
        unlink_files(@del_arr);
    }
    else {
        exit 0;
    }
    return 1;
}

sub main {
    my $del_arr = create_file_list();
    delete_files(@{$del_arr});
}

main();
