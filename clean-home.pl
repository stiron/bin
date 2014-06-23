#!/usr/bin/perl

use strict;
use warnings;

my $home_dir = $ENV{"HOME"};

unlink glob "$home_dir/*debuglog.txt";
unlink glob "$home_dir/.goutputstream-*";
unlink glob "$home_dir/libpeerconnection*";
unlink "C:\\nppdf32Log\\debuglog.txt";
