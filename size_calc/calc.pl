#! /usr/bin/perl
use Modern::Perl;
use YAML;

say map {
    state $from = 0;
    if ( /^\d+$/ ) {
        my $size = $_ - $from;
        $from = $_;
        "$size ";
    } else { "$_:a" }
} @ARGV;
