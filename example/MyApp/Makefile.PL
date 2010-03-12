#!/usr/bin/env perl

use inc::Module::Install;
use Module::Install::Catalyst; # Complain loudly if you don't have
                               # Catalyst::Devel installed or haven't said
                               # 'make dist' to create a standalone tarball.
name 'MyApp';
all_from 'lib/MyApp.pm';

requires 'Catalyst::Runtime' => '5.80021';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Config::General';
requires 'Catalyst::Controller::ActionRole';
requires 'Catalyst::Model::Adaptor';
requires 'MooseX::Types::Path::Class';
requires 'MIME::Types';
requires 'Don::Mendo';

requires 'Plack';
requires 'Starman';

test_requires 'Test::More' => '0.88';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
