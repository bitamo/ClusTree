use strict;
my $Unlimited=10000000000;
#my($Newick);
main();

sub main()
{

my($Cnt);
my($i);
my($j);
my(@C1);
my(@C2);
my(%M);
my(@fl);

my(@Cref);
my(@Ca);
my($Line);
my($seqs);
my(@Temp);
my(%Hash);
my($x1);
my($y1);
my($p); #for printing r and l sequences
my(@C); #for initial index 
my($S);
my($inputFile);
my($outputTree);
#########################################################################	
print("Please enter the name of the input distance file:\n");
$inputFile = <STDIN>;
	unless(open(filehandel,"$inputFile"))
    {
        print("error");
        exit;
    }
	$Cnt=0;
    while($Line=<filehandel>)
    {
        chomp($Line);
		@Temp=split(" ",$Line);
	    $C[$Cnt]= $Cnt; 
		for($i=1;$i<@Temp;++$i)
		{
            		
            $M{$Cnt.','. ($i-1)}=$Temp[$i];
		}
		++$Cnt;
	}
	my @A=keys(%M);
	# for(my $i=0;$i<@A;++$i)
	# {
		# print("$A[$i] $M{$A[$i]} \n");
	# }
	
	close(filehandel);
    $seqs = $Cnt;

	
###############################################################
#$Newick = "\(".join(',',@C)."\)";
#print("Newick at beginning: $Newick\n");
$S=Cluster_to_2(\@C,\%M );

print("Please specify a name for the resulting tree:\n");
$outputTree = <STDIN>;
unless(open(filehandelO,">$outputTree"))
{
    print("error");
    exit;
}
print(filehandelO $S);
#print("Newick at the end: $Newick\n");
  
#
}##############################################################
sub Cluster_to_2(){													
														
	my($C, $M)=@_;
	#UpdateTree(@$C);
	my(@C1);
	my(@C2);
	my($S1);
	my($S2);
	Cluster($C, $M,\@C1,\@C2 );                                 
	#<STDIN>;
	
	print("C1 is: ", join(": ",@C1 ),"\n");
	print("C2 is: ", join(": ",@C2 ),"\n");
	if (scalar(@C1)!=1){										
	   
		$S1=Cluster_to_2(\@C1, $M);
	}
	else{
		$S1=$C1[0];
	}
	
	if(scalar(@C2)!=1)
	{
		$S2=Cluster_to_2(\@C2, $M);
	}	
	else{
		$S2=$C2[0];
	}
	#print("(",$S1,",",$S2,")");
	#<STDIN>;
	return("( ".$S1." , ".$S2." )");
		 
		
		
	}        
	
	                                                      
###############################################################	
sub Cluster()
{
	my($C, $M,$C11,$C12)= @_;
	my($Cnt);
	my($i);
	my(@fl);
	my($j);
	
	my(@C1);
	my(@C2);
	for($i=0;$i<@$C;++$i)
    {
        $fl[$i]="";
    }
	($i,$j)=MaxFind($C, $M,\@fl);
	push(@C1,$i);
    push(@C2,$j);
	
	$Cnt=0;
	my($x);
	my($y);
	my($y1);
	my($x1);
    while(@$C)			#($x!=-1 || $y!=-1)      #fix the condition here! loop happens!
	{
	
		($x,$x1)=FindMin($C, \@C1,$M,\@fl);     #reference sequences, sequences already in C1, reference hash, flag
		
		($y,$y1)=FindMin($C, \@C2,$M,\@fl);
        if($x1==$Unlimited && $y1==$Unlimited)  {last;}
		if($x1<=$y1){
			if($x!=-1)
			{
				push(@C1,$x);
				$fl[$x]=1;
				
				print("a= ",$x,"\n");
			}
		}
		elsif($y!=-1)
		{
			push(@C2,$y);
            $fl[$y]=2;
			
            print("b= ",$y,"\n");
		}
        ++$Cnt;
    }
    @$C11=@C1;
	@$C12=@C2;
}
################################################################

################################################################
sub MaxFind()     #find the maximum element in the matrix M for array C 
{                 #return row and column and max value
	my($C, $M, $fl)=@_;
	my($Max)=-$Unlimited;
	my($i);
	my($j);
	my($iMax);
	my($jMax);
	for($i=0;$i<@$C-1;$i++)
		{
		for($j=$i+1;$j<@$C;$j++)
		{
			my $key=Findkey($$C[$i],$$C[$j],$M);
			if($$M{$key}>$Max)
			{
				$iMax=$$C[$i];
				$jMax=$$C[$j];
				$Max=$$M{$key};
			}
		}

	}
	$$fl[$iMax]=1;
	$$fl[$jMax]=1;
		print("in MaxFind, jMax and iMax are: ", $jMax, "\t ", $iMax, "\n");
		#<STDIN>;

	return($iMax,$jMax);
}

################################################################
sub FindMin()
{
	my($Cref, $Ca, $M , $fl)=@_;
	my($Min)=$Unlimited;
	my($i);
	my($j);
	my($iMin);
	my($jMin);
	my($flag)=0;
	print("beginning of findmin, Ca[0] is ",$$Ca[0], "\n");
	foreach $i(@$Ca)
	{
	
		foreach $j(@$Cref)
		{
			
			if($i!=$j)
			{
			my $key=Findkey($i,$j,$M);
#			my $key=Findkey($$Ca[$i],$$Cref[$j],$M);
			if($$fl[$j] eq  "" 	&& $$M{$key}<$Min)
			{
				$iMin=$i;
				$jMin=$j;
				$Min=$$M{$key};
				
			}
			#print($Min, "\n" );
			}
		}

	}
	
	print("end of findmin, jMin and Min are: ",$jMin, "\t", $Min, "\n");
	return($jMin,$Min);     #the closest element / value of the minimum
}

#######################################################################
sub Findkey()
{
	my($i, $j,$M) = @_;
	my $key =$i.','.$j;
	if(exists($$M{$j.','.$i}))
		{$key=$j.','.$i;}
	elsif(!exists($$M{$key}))
	{ print("error in Findkey for key = $key	 \n");
	#exit;
	}
	return($key);
}

#######################################################################