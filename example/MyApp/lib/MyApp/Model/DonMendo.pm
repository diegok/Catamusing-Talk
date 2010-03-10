package MyApp::Model::DonMendo;
use Moose;
use namespace::autoclean;
extends 'Catalyst::Model::Adaptor';

__PACKAGE__->config( class => 'Don::Mendo' );

=head1 NAME

MyApp::Model::DonMendo - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

Diego Kuperman

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
