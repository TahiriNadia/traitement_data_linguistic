These scripts calculate a normalized version of the 
Levenshtein distance and the SCA phonetical distance.

 Authors: Etienne Lord, Alix Boc, and Vladimir Makarenkov.
 University of Quebec at Montreal
 July 2015

Typical use for the <fruit.txt> example*:

For the classic version of the normalized Levenshtein distance:
> perl distance_levenshtein_classic.pl fruit.txt [out1.txt] 

For the SCA distance from the Lingpy package**:
> python distance_sca.py fruit.txt [out2.txt]

*  Output files: out1.txt and out2.txt will be Phylip compatible matrix files.

** Installation of the Lingpy package (List, 2012), available at http://lingpy.org/, is required.
