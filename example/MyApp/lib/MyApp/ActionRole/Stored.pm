package MyApp::ActionRole::Stored;
use Moose::Role;
use MooseX::Types::Path::Class;
use MIME::Types;

has base_dir => (
    is      => 'rw',
    isa     => 'Path::Class::Dir',
    lazy    => 1,
    coerce  => 1,
    default => '/tmp/MyApp/htdocs',
);

has mime_types => (
    is      => 'ro',
    lazy    => 1,
    default => sub { MIME::Types->new() },
);

after execute => sub {
    my ( $self, $controller, $c ) = @_;
    $self->store( $c ) if $c->res->code == 200;
};

sub store {
    my ( $self, $c ) = @_;

    my $file = $self->base_dir->file( $c->req->path . $self->file_extension($c->res) );
    $c->log->info('Saving into: ' . $file );
    $file->dir->mkpath;
    my $fh = $file->openw();
    print $fh $c->res->body;
}

sub file_extension {
    my ( $self, $res ) = @_;
    if ( $res->content_type ) {
        my @ext = $self->mime_types->type( $res->content_type )->extensions;
        return @ext ? '.' . $ext[0] : '';
    }
    return '';
}

1;
