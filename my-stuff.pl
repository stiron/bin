#!/usr/bin/env perl

use strict;
use warnings;
use IPC::Run3;

my $home      = "/home/tmolnar";
my $encrypted = "$home/stuff/others/.private";
my $decrypted = "$home/stuff/others/private";

my $usage = "Usage: $0 [mount|umount]
mount:  mounts the private storage
umount: umounts the private storage\n";

sub run_cmd {
    my @cmd = @_;
    my $stderr;
    my $stdout;

    run3( \@cmd, undef, \$stdout, \$stderr );
    my $exit = $?;

    my %retval = (
        stdout => $stdout,
        stderr => $stderr,
        exit   => $exit,
    );

    return \%retval;
}

if ( $ARGV[0] ne "mount" and $ARGV[0] ne "umount" ) {
    die $usage;
}
elsif ( $ARGV[0] eq "mount" ) {
    my @cmd = qw(/usr/bin/encfs);
    push @cmd, $encrypted;
    push @cmd, $decrypted;
    my $data = run_cmd(@cmd);
    if ( $data->{exit} != 0 ) {
        die("Command run was not successful: $data->{stderr}\n");
    }
}
elsif ( $ARGV[0] eq "umount" ) {
    my @cmd = qw(/bin/fusermount -u);
    push @cmd, $decrypted;
    my $data = run_cmd(@cmd);
    if ( $data->{exit} != 0 ) {
        die("Command run was not successful: $data->{stderr}\n");
    }
}
else {
    die $usage;
}
