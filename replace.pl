#!/usr/bin/perl -w

use strict;

my(@Temp);
my(@names);
my $linecount = 0;
my $lines;
my $tree;
my $i;
my $inputNames;
my $inputTree;
my $outputTree;
#######################################################
print("Please enter the name of the text file containing the name of the sequences:\n");
$inputNames = <STDIN>;
open(FH, "<$inputNames") || die "File not found!";
##put the names of sequences in an array called "names"
while($lines = <FH>) {
   chomp($lines);
   @Temp = split("#", $lines);
   @names[$linecount] = $Temp[-1] ;
   $linecount++;
}
close(FH);
#######################################################
print("Please enter the name of the tree file:\n");
$inputTree = <STDIN>;
##replace sequences in the tree.txt file by their name
open(FILE, "<$inputTree") || die "File not found";


print("Please enter desired name for the result tree file:\n");
$outputTree = <STDIN>;
open(RES, ">$outputTree") || die "File not found";
$tree = <FILE>;

@Temp=split(" ",$tree);
for($i=0;$i<@Temp;++$i)
{
	if($Temp[$i] ne "(" && $Temp[$i] ne ")" && $Temp[$i] ne ",")
	{
		$Temp[$i]=$names[$Temp[$i]];
	}
}
$tree=join(" " ,@Temp);


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
print(RES $tree, ";\n") ;


close(FILE);

