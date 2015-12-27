#!/usr/bin/env perl

use strict;
use Data::Dumper;
use Pod::Usage;
use Getopt::Long;
use IPC::Run3;

my %opt;

GetOptions( \%opt, 'help' );
pod2usage( { -verbose => 2, -noperldoc => 1 } ) if $opt{'help'};

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

    if ( $retval{exit} != 0 ) {
        die("Command run was not successful: $retval{stderr}\n");
    }

    return \%retval;
}

if ( !$ARGV[0] ) {
    pod2usage( { -verbose => 1 } );
}

my $action = $ARGV[0];

if ( $action ne "mount" and $action ne "umount" ) {
    pod2usage( { -verbose => 1 } );
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
}

sub umount_fs {
    my @cmd  = qw(/bin/fusermount -u /media/MyAndroid);
    my $data = run_cmd(@cmd);
}

__END__

=head1 NAME

android-mount.pl - My simple tool for mounting MTP devices

=head1 SYNOPSYS

android-mount.pl [mount|umount]

Options:
  --help        brief help

=head1 USAGE

  android-mount.pl mount

  android-mount.pl umount

=head1 OPTIONS

=over 8

=item B<--help>

Prints out a short help for the tool

=back

=head1 DESCRIPTION

This is just a simple tool for mounting MTP devices with
go-mtpfs.

=cut
