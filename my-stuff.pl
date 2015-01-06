#!/usr/bin/env perl

use strict;
use warnings;

my $home      = "/home/iron";
my $encrypted = "$home/stuff/others/.private";
my $decrypted = "$home/stuff/others/private";

my $usage = "Usage: $0 [mount|umount]

mount:  mounts the private storage
umount: umounts the private storage\n";

if ( $ARGV[0] ne "mount" and $ARGV[0] ne "umount" ) {
    die $usage;
}
elsif ( $ARGV[0] eq "mount" ) {
    qx(/usr/bin/encfs ~/$encrypted ~/$decrypted);
}
elsif ( $ARGV[0] eq "umount" ) {
    qx(/bin/fusermount -u ~/$decrypted);
}
else {
    die $usage;
}
