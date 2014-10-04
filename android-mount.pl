#!/usr/bin/env perl

use strict;
use warnings;

check_installed();

if ( ! $ARGV[0] ) {
  exit_error();
}
my $action = $ARGV[0];

if ( $action ne "mount" and $action ne "umount" ) {
  exit_error();
} elsif ( $action eq "mount" ) {
  mount_fs();
} elsif ( $action eq "umount" ) {
  umount_fs();
}

sub mount_fs {
  qx(/usr/bin/go-mtpfs /media/MyAndroid);
  my $check_mount = qx(/bin/mount |grep /media/MyAndroid);
  if ( length( $check_mount ) > 0 ) {
    print "The filesystem has been mounted\n";
  } else {
    print "The filesystem could not be mounted\n";
  }
}

sub umount_fs {
  qx(/bin/fusermount -u /media/MyAndroid);
  my $check_umount = qx(/bin/mount |grep /media/MyAndroid);
  if ( length( $check_umount ) == 0 ) {
    print "The filesystem has been umounted\n";
  } else {
    print "The filesystem could not be umounted\n";
  }
}

sub exit_error {
  print "Usage: $0 [mount|umount]\n";
  exit 1;
}

sub check_installed {
  my $cmd = qx(which go-mtpfs);
  if ( length( $cmd ) == 0 ) {
    print "Please install the go-mtpfs command before!\n";
    print "http://www.webupd8.org/2012/12/how-to-mount-android-40-ubuntu-go-mtpfs.html\n";
    exit 1;
  }
}
