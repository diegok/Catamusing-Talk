package MyApp::Controller::Example;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller::ActionRole'; }
    with 'MyApp::ControllerRole::Foo';

has saludo => (
    is => 'ro',
    isa => 'Str',
    lazy => 1,
    default => sub { 'Hola mundo!' },
);

sub hello : Path('hello') Does('Stored') {
    my ($self, $c) = @_;
    $c->res->content_type('text/plain');
    $c->res->body( $self->saludo );
}

=head1 NAME

MyApp::Controller::Example - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head1 AUTHOR

Diego Kuperman

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
