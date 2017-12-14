These scripts calculate a weighted and normalized version of the 
Levenshtein distance and the SCA phonetical distance.

 Authors: Etienne Lord, Alix Boc, and Vladimir Makarenkov.
 University of Quebec at Montreal
 May 2015

Typical use for the <fruit.txt> example*:

For the weighted and normalized version of the Levenshtein distance:
> perl distance_levenshtein.pl fruit.txt [out1.txt] 

For the SCA distance from the Lingpy package**:
> python distance_sca.py fruit.txt [out2.txt]

*  both output files: out1.txt and out2.txt will be Phylip compatible matrix files.
** Require the installation of the Lingpy package (List, 2012) available at: http://lingpy.org/
