To run the algorithm:

1- Run the perl code ClusTreeing.pl, enter the file containing the distance matrix as input (DistanceData.txt). 
   This creates the temporary tree file in newick format using only sequence IDs. Enter the name of the file
   you wish the tree to be printed in (e.g. tree.nwk).

2- Run the perl code replace.pl. Inputs are: 1) the text file containing the IDs and sequence names of the sequences in
   the tree (e.g. names.txt), and 2) the tree file(tree.nwk). 
   This creates a file containing the same tree, with IDs replaced
   by names of sequences.

3- Run TwoTrees.pl. ->input: the two tree files (e.g. TrueTree.nwk and Mytree.nwk)
		      output: Both trees printed in one file, so that they can be 
		      compared.

4- Run TopoTree.pl -> It's supposed to modify the trees file, getting rid of distances, so that only the topology
   remains. And also should get rid of the /s (forward slashes)
		    ->input: the file containing trees.
		    ->output: the modified file.
*If there are errors, please manually remove the "/"'s from the result file! 