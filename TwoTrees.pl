#!/usr/bin/perl -w

use strict;

#my(@Temp);
#my(@names);
#my $linecount = 0;
my $line1;
my $line2;
my $tree = '';
#my $i;
my $first;
my $second;
my $output;
#######################################################
print("Please enter the first tree file:\n");
$first = <STDIN>;
open(FH1, "<$first") || die "File not found!";

	$line1 = <FH1>;
	$tree = $tree. $line1;
 
close(FH1);
#######################################################
print("Please enter the name of the second tree file:\n");
$second = <STDIN>;
open(FH2, "<$second") || die "File not found";
	$line2 = <FH2>;
	$tree = $tree. $line2;
#######################################################
print("Please enter desired name for the result  file:\n");
$output = <STDIN>;
open(RES, ">$output") || die "File not found";





#print($tree);
#for($i= 0; $i<$linecount; $i++){
#$tree =~ s/$i/\Q$names[$i]/g;
#print($i);
#	$names[$i] = quotemeta $names[$i];
#	#print("$i is $names[$i]\n");
#	$tree =~ s/\D$i\D/$names[$i]/g;
#	print("$i is $tree\n");
#}
#$tree =~ s/\s//g;
#$tree.=";";
print(RES $tree) ;


close(RES);

