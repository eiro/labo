use Eirotic;
use Test::More;

my $FOUND_HEADER = qr{
    ^ \#\( (?<created>
          \d{4} - \d{2} - \d{2}
    T     \d{2} : \d{2} : \d{2}
    \+    \d{2} : \d{2} )
    \) \s (?<title> .+?)
    \s* $
}xms;


ok '#(2014-01-18T22:08:52+01:00) atom bomb first test'
    ~~ m{$FOUND_HEADER}
, "found header on single line";

is $+{title}
, 'atom bomb first test'
, "title is correct";

$_ = '

#(2014-01-18T22:08:52+01:00) atom bomb first test

';

ok m{$FOUND_HEADER}
, "found header on multi line";

is $+{title}
, 'atom bomb first test'
, "title is correct";

done_testing;


