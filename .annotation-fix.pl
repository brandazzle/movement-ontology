#!/usr/bin/perl
use feature 'unicode_strings';
use Unicode::Normalize qw(NFD compose);

$s = '';
while (my $line = <>) {
	$s = $s.$line;
}
$string = NFD($s);

$string =~ s/(\>[^\n\t\r]+)\n\n([^\t]*)\s+(\*\s\*[\s\w\d]+?) on [^\n\t\r]+\n{0,2}/\1\n\n\2\n\3\*\n\n/img;

$out = compose($string);
print $out;