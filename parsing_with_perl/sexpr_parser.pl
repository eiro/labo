#! /usr/bin/perl 
use Eirotic;
use YAML ();
use List::AllUtils qw< first >;
use re '/xms'; 

sub hello { say "hello $_" for @_ }

our @elements;

sub _list;

sub _parse_error {
    die YAML::Dump
    +{ expected  => (shift)
     , pos       => (pos) 
     , remaining => (substr $_,pos)
     , elements  => \@elements };
}

sub _bareword { /\G \s* ([^()\s]+) \s*/cg and return $1 }
sub _string   { /\G \s* ("(?:\\.|[^"])+")/cg and return $1 }

sub _element {
    _list
    || _string
    || _bareword
    || _parse_error "_element";
}

sub _list {
    _parse_error 'closing unopen list' if /\G \s* [)] \s*/cg;
    return unless /\G \s* [(] \s* /gc;
    local @elements;
    push @elements, _element while not /\G \s* [)] \s*/gc;
    [@elements];
}

sub parse (_) {
    local $_ = shift; 
    pos $_ = 0;
    my @ex;
    while ( my $e = _list ) { push @ex, $e }
    @ex;
} 

 say YAML::Dump [parse q[
     (= x (+ 1 3))
     (? (same x 3) 
         (hello (* my little (@ +0 crazy it) and world )))
     (json!
         (? 
             (~ 100$a "Jeff" ) (< jeff 100$a 9??$z )
             (?
                 (has 100$z)
                 (++ old ))))
     (= x )
     (* 100$a 340$j )
     (if (? 100$<abc> ) )
     (say "hello $x")
     (?  (has 100$a) (io < ) )
     (io= old marc marc.mrc )
     (io= new json std)
     (io stat )
    (# person :vocab http://schema.org :typeof Person )
    (p :vocab http://schema.org :typeof Person
        nous vous proposons un (a :href /index.html retour à la page d'accueil).)
 ]];

#sub pisl (_) {
#    my ( $symfn, @args ) = @{( shift )};
#    my $fn = first { $_->can($symfn) } __PACKAGE__, 'CORE'
#        or die "undefined function $symfn";
#}
#
#pisl parse "(say hello world)";


# sub foo { say "hello $_[0]" }
# ( __PACKAGE__->can('foo')
#         or die "i can't foo" )
#     ->("world");


