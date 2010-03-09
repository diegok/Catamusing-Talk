package MyApp::ControllerRole::Foo;
use MooseX::MethodAttributes::Role;
use namespace::autoclean;

sub foo : Path('foo') {
    my ($self, $c) = @_;

    $c->res->body('Foo controller role!');
}

1;
