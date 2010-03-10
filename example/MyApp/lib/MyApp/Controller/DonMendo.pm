package MyApp::Controller::DonMendo;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

MyApp::Controller::DonMendo - Random sentences from Don Mendo

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 say

=cut

sub say : Local {
    my ( $self, $c ) = @_;

    my $lines = $c->model('DonMendo')->jornadas->[ int rand(4) ]
        ->lines_for_character('Mendo');
    $c->res->body( $lines->[ time % scalar @$lines ]->say );
}


=head1 AUTHOR

Diego Kuperman

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
