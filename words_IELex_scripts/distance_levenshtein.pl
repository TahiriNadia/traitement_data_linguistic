#!/usr/bin/perl
#
# This script calculates a weighted and normalized version of the 
# Levenshtein distance 
#
# Authors: V. Makarenkov lab.
# University of Quebec at Montreal
# May 2015
use utf8;
binmode(STDOUT, ":utf8");
if (@ARGV<1) {
	print ("Usage: perl distance_levenshtein.pl cognat.txt [out.txt]\n");
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
			my ($mot1_t,@tabD1) = delDoublons(@words[$i]);
			my ($mot2_t,@tabD2) = delDoublons(@words[$j]);
			
			my $distance = levenshtein1($mot1,$mot2); 
			my $distance2 = 100000;
			if( $distance > 0){
				if((scalar @tabD1 > 0) || (scalar @tabD2 > 0) ){
					if($tabD1[0] eq $tabD2[0]){						
						$distance2 = levenshtein1($mot1_t,$mot2_t)/max([length($mot1),length($mot2)]);
					}
					else{						
						$distance2 = (levenshtein1($mot1_t,$mot2_t)+0.10)/max([length($mot1),length($mot2)]);						
					}
				}
				else{					
					$distance2 = levenshtein1($mot1_t,$mot2_t)/max([length($mot1),length($mot2)]);
				}
			} else {
				$distance2=0.00000;	
			}
			$matrix[$i][$j]=$distance2;
			$matrix[$j][$i]=$distance2;			
			#print @langues[$i]." ".@langues[$j]." ".$distance2."\n";
		}
	}
}

# Output matrix in phylip compatible format
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

sub levenshtein1
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
            my $cost = 0; #($ar1[$i-1] eq $ar2[$j-1]) ? 0 : 1;
			
			if(($ar1[$i-1] eq $ar2[$j-1])){
				$cost = 0;
			}
			else{
				$cost = 1;
				
				#QG, VF, QW, WB 0.800
				if((($ar1[$i-1] eq 'Q') && ($ar2[$j-1] eq 'G')) || (($ar1[$i-1] eq 'G') && ($ar2[$j-1] eq 'Q'))){
					$cost = 0.800;
				}
				if((($ar1[$i-1] eq 'V') && ($ar2[$j-1] eq 'F')) || (($ar1[$i-1] eq 'F') && ($ar2[$j-1] eq 'V'))){
					$cost = 0.800;
				}	
				if((($ar1[$i-1] eq 'O') && ($ar2[$j-1] eq 'W')) || (($ar1[$i-1] eq 'W') && ($ar2[$j-1] eq 'O'))){
					$cost = 0.800;
				}
				if((($ar1[$i-1] eq 'W') && ($ar2[$j-1] eq 'B')) || (($ar1[$i-1] eq 'B') && ($ar2[$j-1] eq 'W'))){
					$cost = 0.800;
				}
				#CT, QC,KQ, KG, IW, WJ, OU, UW, VW 0.600
				if((($ar1[$i-1] eq 'C') && ($ar2[$j-1] eq 'T')) || (($ar1[$i-1] eq 'T') && ($ar2[$j-1] eq 'C'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'Q') && ($ar2[$j-1] eq 'C')) || (($ar1[$i-1] eq 'C') && ($ar2[$j-1] eq 'Q'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'K') && ($ar2[$j-1] eq 'C')) || (($ar1[$i-1] eq 'C') && ($ar2[$j-1] eq 'K'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'K') && ($ar2[$j-1] eq 'Q')) || (($ar1[$i-1] eq 'Q') && ($ar2[$j-1] eq 'K'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'K') && ($ar2[$j-1] eq 'G')) || (($ar1[$i-1] eq 'G') && ($ar2[$j-1] eq 'K'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'I') && ($ar2[$j-1] eq 'Y')) || (($ar1[$i-1] eq 'Y') && ($ar2[$j-1] eq 'I'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'Y') && ($ar2[$j-1] eq 'J')) || (($ar1[$i-1] eq 'J') && ($ar2[$j-1] eq 'Y'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'O') && ($ar2[$j-1] eq 'U')) || (($ar1[$i-1] eq 'U') && ($ar2[$j-1] eq 'O'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'U') && ($ar2[$j-1] eq 'W')) || (($ar1[$i-1] eq 'W') && ($ar2[$j-1] eq 'U'))){
					$cost = 0.600;
				}
				if((($ar1[$i-1] eq 'V') && ($ar2[$j-1] eq 'W')) || (($ar1[$i-1] eq 'W') && ($ar2[$j-1] eq 'V'))){
					$cost = 0.600;
				}
				#NM, TD, IJ, VB 0.400			
				if((($ar1[$i-1] eq 'N') && ($ar2[$j-1] eq 'M')) || (($ar1[$i-1] eq 'M') && ($ar2[$j-1] eq 'N'))){
					$cost = 0.400;
				}
				if((($ar1[$i-1] eq 'D') && ($ar2[$j-1] eq 'T')) || (($ar1[$i-1] eq 'T') && ($ar2[$j-1] eq 'D'))){
					$cost = 0.400;
				}
				if((($ar1[$i-1] eq 'I') && ($ar2[$j-1] eq 'J')) || (($ar1[$i-1] eq 'J') && ($ar2[$j-1] eq 'I'))){
					$cost = 0.400;
				}
				if((($ar1[$i-1] eq 'V') && ($ar2[$j-1] eq 'B')) || (($ar1[$i-1] eq 'B') && ($ar2[$j-1] eq 'V'))){
					$cost = 0.400;
				}
				# XH, PB, ZS H- 0.2
				if((($ar1[$i-1] eq 'X') && ($ar2[$j-1] eq 'H')) || (($ar1[$i-1] eq 'H') && ($ar2[$j-1] eq 'X'))){
					$cost = 0.2;
				}
				if((($ar1[$i-1] eq 'P') && ($ar2[$j-1] eq 'B')) || (($ar1[$i-1] eq 'B') && ($ar2[$j-1] eq 'P'))){
					$cost = 0.2;
				}
				if((($ar1[$i-1] eq 'Z') && ($ar2[$j-1] eq 'S')) || (($ar1[$i-1] eq 'S') && ($ar2[$j-1] eq 'Z'))){
					$cost = 0.2;
				}
				# Dash
				if((($ar1[$i-1] eq '*') && ($ar2[$j-1] ne '*')) || (($ar1[$i-1] ne '*') && ($ar2[$j-1] eq '*'))){
					$cost = 0.1;
				}
				if((($ar1[$i-1] eq '\'') && ($ar2[$j-1] ne '\'')) || (($ar1[$i-1] ne '\'') && ($ar2[$j-1] eq '\''))){
					$cost = 0.1;
				}
				if((($ar1[$i-1] eq '-') && ($ar2[$j-1] ne '-')) || (($ar1[$i-1] ne '-') && ($ar2[$j-1] eq '-'))){
					$cost = 0.1;
				}
			}

            # Cell $mat{$i}{$j} equals the minimum of:
            #
            # - The cell immediately above plus 1
            # - The cell immediately to the left plus 1
            # - The cell diagonally above and to the left plus the cost
            #
            # We can either insert a new char, delete a char or
            # substitute an existing char (with an associated cost)
            #
			# Handle the case with H and dash (-)
			
			my $cost_i=1;
			my $cost_j=1;
				
            $mat{$i}{$j} = min([$mat{$i-1}{$j} + $cost_i,
                                $mat{$i}{$j-1} + $cost_j,
                                $mat{$i-1}{$j-1} + $cost]);
								
			if ($mat{$i}{$j}==$mat{$i-1}{$j}+$cost_i&&($ar1[$i-1] eq 'H')) {
				 $cost_i=0.2;
			}				
			if ($mat{$i}{$j}==$mat{$i}{$j-1}+$cost_j&&($ar2[$j-1] eq 'H')) {
				 $cost_j=0.2;
			}	
			if ( $cost_j ne 1 || $cost_i ne 1) {
				 $mat{$i}{$j} = min([$mat{$i-1}{$j} + $cost_i,
                                $mat{$i}{$j-1} + $cost_j,
                                $mat{$i-1}{$j-1} + $cost]);
			}
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

# remove duplicate letters in words
sub delDoublons
{
	my $chaine = uc($_[0]);
	my $nbDoublons=0;
	my @tabDoublons;
	my @tab = split("",$chaine);
	my @tab2;
	my $temoin = 1;
	
	$tab2[0] = $tab[0];
	my $j=1;	
	for(my $i=1;$i<scalar @tab;$i++){
		if($tab[$i] ne $tab2[$j-1]){
			$tab2[$j++] = $tab[$i];
			$temoin=1;
		}
		else{
			if($temoin == 1){
				$tabDoublons[$nbDoublons] = $tab[$i];				
				$nbDoublons++;
				$temoin = 0;
			}
		}
	}	
	$chaine = join("",@tab2);	
	return ($chaine,@tabDoublons);
}