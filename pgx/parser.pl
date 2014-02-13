#! /usr/bin/perl
package main;
use Modern::Perl;
use YAML ();
use Pegex::Parser;
use G;

my $parser = Pegex::Parser->new
    (qw( reciever Pegex::Tree grammar )
    , G->new );

say YAML::Dump $parser->parse("yes\nno\nyes\n", 'Pegex::Tree');
