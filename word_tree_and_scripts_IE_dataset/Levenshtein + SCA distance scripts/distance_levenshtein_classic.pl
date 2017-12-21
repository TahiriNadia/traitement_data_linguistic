#!/usr/bin/perl
#
# This script calculates the classical Levenshtein distance between two words
# normalized by the maximum length of these words
#
# Authors: Etienne Lord, Alix Boc, and Vladimir Makarenkov.
# University of Quebec in Montreal
# May 2015
use utf8;
binmode(STDOUT, ":utf8");
if (@ARGV<1) {
	print ("Usage: perl distance_levenshtein_classic.pl cognat.txt [out.txt]\n");
	exit(0);
}
my ($filename, $outfile) = @ARGV;
my @langue =();
my @words =();

open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
while (my $row = <$fh>) {
  chomp $row;
  if (length($row)>2) {	
	my @data = split (' ', $row);  
	push @langues,$data[0];
	push @words,$data[1];	
	}
}
close $fh;
my $count=@langues;
my @matrix;

	

for (my $i= 0; $i<$count;$i++) {
	for (my $j= 0; $j<$count;$j++) {		
		$matrix[$i][$j]=0.0;
		$matrix[$j][$i]=0.0;
		if ($i!=$j) {		
			my $mot1=@words[$i];
			my $mot2=@words[$j];			
			$distance2 = levenshtein($mot1,$mot2)/max([length($mot1),length($mot2)]);			
			$matrix[$i][$j]=$distance2;
			$matrix[$j][$i]=$distance2;			
			#print @langues[$i]." ".@langues[$j]." ".$distance2."\n";
		}
	}
}

# Output matrix in the Phylip compatible format
if (length($outfile)<2) {
	$outfile="out.txt";
}
print("Saving results in: ",$outfile,"\n");
open(my $fh, '>:encoding(UTF-8)', $outfile) or die "Could not open output file '$outfile' $!";
printf $fh "%d\n", $count;
for (my $i= 0; $i<$count;$i++) {
	printf $fh "%-10s ",@langues[$i];	
	for (my $j= 0; $j<$count;$j++) {
		printf $fh "%f ",$matrix[$i][$j]	
	}	
	print $fh "\n";
}
close ($fh);
 
 exit;
#========================================================================================
#================================== SUB FUNCTIONS  ======================================
#========================================================================================

sub levenshtein
{
    # $s1 and $s2 are the two strings
    # $len1 and $len2 are their respective lengths
    #
    my ($s1, $s2) = @_;
    my ($len1, $len2) = (length $s1, length $s2);

    # If one of the strings is empty, the distance is the length
    # of the other string
    #
    return $len2 if ($len1 == 0);
    return $len1 if ($len2 == 0);

    my %mat;

    # Init the distance matrix
    #
    # The first row to 0..$len1
    # The first column to 0..$len2
    # The rest to 0
    #
    # The first row and column are initialized so to denote distance
    # from the empty string
    #
    for (my $i = 0; $i <= $len1; ++$i)
    {
        for (my $j = 0; $j <= $len2; ++$j)
        {
            $mat{$i}{$j} = 0;
            $mat{0}{$j} = $j;
        }

        $mat{$i}{0} = $i;
    }

    # Some char-by-char processing is ahead, so prepare
    # array of chars from the strings
    #
    my @ar1 = split(//, $s1);
    my @ar2 = split(//, $s2);

    for (my $i = 1; $i <= $len1; ++$i)
    {
        for (my $j = 1; $j <= $len2; ++$j)
        {
            # Set the cost to 1 iff the ith char of $s1
            # equals the jth of $s2
            # 
            # Denotes a substitution cost. When the char are equal
            # there is no need to substitute, so the cost is 0
            #
            my $cost = ($ar1[$i-1] eq $ar2[$j-1]) ? 0 : 1;

            # Cell $mat{$i}{$j} equals the minimum of:
            #
            # - The cell immediately above plus 1
            # - The cell immediately to the left plus 1
            # - The cell diagonally above and to the left plus the cost
            #
            # We can either insert a new char, delete a char or
            # substitute an existing char (with an associated cost)
            #
            $mat{$i}{$j} = min([$mat{$i-1}{$j} + 1,
                                $mat{$i}{$j-1} + 1,
                                $mat{$i-1}{$j-1} + $cost]);
        }
    }

    # Finally, the Levenshtein distance equals the rightmost bottom cell
    # of the matrix
    #
    # Note that $mat{$x}{$y} denotes the distance between the substrings
    # 1..$x and 1..$y
    #
    return $mat{$len1}{$len2};
}


# minimal element of a list
sub min
{
    my @list = @{$_[0]};
    my $min = $list[0];

    foreach my $i (@list)
    {
        $min = $i if ($i < $min);
    }

    return $min;
}

# maximum element of a list
sub max
{
    my @list = @{$_[0]};
    my $max = $list[0];

    foreach my $i (@list)
    {
        $max = $i if ($i > $max);
    }

    return $max;
}
