#!/usr/bin/env perl

use strict;
use warnings;

{
  package CleanHome;

  sub new {
    my $this = shift;
    my $class = ref($this) || $this;
    my $self = bless {@_}, $class;
    return $self;
  }

  sub delete_files {
    my $self = shift;
    my @files_to_del = @_;
    for my $to_delete ( @files_to_del ) {
      unlink $to_delete;
    }
  }

  1;
}

sub create_and_delete_file_list {
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
    $delete->delete_files( @del_arr );
  } else {
    die "There is nothing to clean at the moment!\n";
  }

  return 1;
}

sub main {
  create_and_delete_file_list();
}

main();
