#!/usr/bin/env perl

use strict;
use warnings;

use FindBin qw($Bin);
use lib "$Bin/lib";

use CleanHome;

my @del_arr;
my $home_dir  = $ENV{"HOME"};
my @debug     = glob "$home_dir/*debuglog.txt";
my @gout      = glob "$home_dir/.goutputstream-*";
my @libp      = glob "$home_dir/libpeerconnection*";
my $debug     = $home_dir . '/C:\nppdf32Log\debuglog.txt';

push @del_arr, @debug;
push @del_arr, @gout;
push @del_arr, @libp;
push @del_arr, $debug if -e $debug;

if ( @del_arr > 0 ) {
  my $delete = CleanHome->new;
  $delete->del_trash( @del_arr );
}
