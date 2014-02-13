
module=lib/G.pm
parser=parser.pl

all: tree.json

$(module): g.m4.pl
	m4 $< > $@

tree.json: $(parser) $(module)
	perl $(parser) 
