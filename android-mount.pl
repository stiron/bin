#!/usr/bin/env perl

use strict;
use Data::Dumper;
use IPC::Run3;

check_installed();

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

if ( !$ARGV[0] ) {
    exit_error();
}
my $action = $ARGV[0];

if ( $action ne "mount" and $action ne "umount" ) {
    exit_error();
}
elsif ( $action eq "mount" ) {
    mount_fs();
}
elsif ( $action eq "umount" ) {
    umount_fs();
}

sub mount_fs {
    my @cmd  = qw(/usr/bin/go-mtpfs /media/MyAndroid);
    my $data = run_cmd(@cmd);
    if ( $data->{exit} != 0 ) {
        die("Command run was not successful: $data->{stderr}\n");
    }
    print "The filesystem could not be mounted\n";
    return 1;
}

sub umount_fs {
    my @cmd = qw(/bin/fusermount -u /media/MyAndroid);
    my $data = run_cmd(@cmd);
    if ( $data->{exit} != 0 ) {
        die("Command run was not successful: $data->{stderr}\n");
    }
    return 1;
}

sub exit_error {
    print "Usage: $0 [mount|umount]\n";
    exit 1;
}

sub check_installed {
    my @cmd  = qw(which go-mtpfs);
    my $data = run_cmd(@cmd);
    if ( $data->{exit} != 0 ) {
        print "Please install the go-mtpfs command before!\n";
        print
"http://www.webupd8.org/2012/12/how-to-mount-android-40-ubuntu-go-mtpfs.html\n";
        exit 1;
    }
}
