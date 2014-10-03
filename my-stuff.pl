#!/usr/bin/env perl

use strict;
use warnings;

my $encrypted=".private";
my $decrypted="private";

my $usage = "Usage: $0 [mount|umount]

mount:  mounts the private storage
umount: umounts the private storage\n";

if ( $ARGV[0] ne "mount" and $ARGV[0] ne "umount" ) {
  die $usage;
} elsif ( $ARGV[0] eq "mount" ) {
  qx(encfs ~/$encrypted ~/$decrypted);
} elsif ( $ARGV[0] eq "umount" ) {
  qx(fusermount -u ~/$decrypted);
} else {
  die $usage;
}
