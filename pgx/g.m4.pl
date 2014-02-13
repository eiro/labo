package G;
use Pegex::Base;
extends 'Pegex::Grammar';
sub make_tree {+syscmd(pegex compile --to=perl sexpr.pgx)}
1;
