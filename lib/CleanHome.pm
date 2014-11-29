package CleanHome;

=head1 OBJECT METHODS

=over 4

=item new()

  Creates a new object instance

=cut

sub new {
  my $this = shift;
  my $class = ref($this) || $this;
  my $self = bless {@_}, $class;
  return $self;
}

=item del_trash()

  Deletes an array of files

Parameters:

  param del_arr : (array) list of files to be deleted
  return        : nothing

=cut

sub del_trash {
  my $self = shift;
  my @files_to_del = @_;
  for my $to_delete ( @files_to_del ) {
    unlink $to_delete;
  }
}

1;

=back

=cut
