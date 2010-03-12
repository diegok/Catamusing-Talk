#!/usr/bin/env perl
use strict;
use warnings;
use MyApp;

MyApp->setup_engine('PSGI');
my $app = sub { MyApp->run(@_) };

