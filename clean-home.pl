#!/usr/bin/env perl

use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
use Term::ANSIColor;
use CleanHome;

my %opts;

GetOptions(
  \%opts,
  'help',
);

pod2usage( -verbose => 2 ) if defined $opts{'help'};

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

__END__

=head1 NAME

I<clean-home.pl> - Keeps my ~ clean

=head1 SYNOPSYS

   clean-home.pl

=cut

=head1 DESCRIPTION

CleanHome package, to keep my ~ clean.

Package and script in one file.

I know it is not good, but it is enough for me
to clean my home directory.

It is rather a technical preview than a 
real program.

=cut

=head1 OPTIONS

=over 4

=item --help

Prints this help message to stdout

=back

=cut

=head1 AUTHOR

Tamas Molnar <stiron@gmail.com>

=head1 SEE ALSO

http://perl.org

=cut
