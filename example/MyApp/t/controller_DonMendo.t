use strict;
use warnings;
use Test::More;

BEGIN { use_ok 'Catalyst::Test', 'MyApp' }
BEGIN { use_ok 'MyApp::Controller::DonMendo' }

ok( request('/donmendo')->is_success, 'Request should succeed' );
done_testing();
