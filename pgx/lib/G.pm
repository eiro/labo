package G;
use Pegex::Base;
extends 'Pegex::Grammar';
sub make_tree {+{
  '+grammar' => 'sexpr',
  '+toprule' => 'document',
  '+version' => '0.0.0',
  'EOL' => {
    '.rgx' => qr/\G\r?\n/
  },
  'SPACE' => {
    '.rgx' => qr/\G\ /
  },
  'document' => {
    '+min' => 1,
    '.ref' => 'line'
  },
  'line' => {
    '.all' => [
      {
        '.rgx' => qr/\Gno|yes/
      },
      {
        '+min' => 0,
        '.ref' => 'SPACE'
      },
      {
        '.ref' => 'EOL'
      }
    ]
  }
}
}
1;
