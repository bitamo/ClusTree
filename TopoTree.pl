use strict;
use POSIX 'isdigit';
#open(FILE, "<tree.newick") || die "File not found";
my(@Temp);
my(@names);
my $linecount = 0;
my $lines;
my @T;
my $i;
my @Result;
my $input;
my $output;

print("Please enter the name of the tree file:\n");
	$input = <STDIN>;
	open(FH, "<$input") || die "File not found!";
	
print("Please enter the name of the output file:\n");
	$output = <STDIN>;
	open(FH1, ">$output") || die "File not found!";
##put the names of sequences in an array called "names"
#$lines = <FH>;
#print($lines);
while($lines = <FH>)
{
$lines=~ s/\s//g;
$lines=~ s/\// /g;
@T=split("",$lines);
for($i=0;$i<@T;++$i)
{
	if($T[$i] ne ":")
	{
		push(@Result,$T[$i]);
	}
	else{
		++$i;
	
		while( isdigit($T[$i]) || ($T[$i] eq "."))
		{
			#print("ddd=",$T[$i]);
						++$i;
		} 
		push(@Result,$T[$i]);
	}
}

print(FH1 join("",@Result));
}
close(FH1);
close(FH);
