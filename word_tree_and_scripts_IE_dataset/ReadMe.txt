README FILE FOR BIOLINGUISTIC DATA ARCHIVE - RECONSTRUCTION OF BIOLINGUISTIC PHYLOGENETIC NETWORKS

The data we analyzed come from a modified comparative IE database originally created by Dyen (1997). Our database reports word forms and cognacy judgements in 84 IE languages for the 200 words of the Swadesh list (1952) including words of basic vocabulary. Two words in two different languages are considered "cognates" if within these languages they had an unbroken history of descent from a common ancestral form. We modified some of the original cognate sets constituted by Dyen (1997) adding to them known loanwords, which were put in a separate class by Dyen, and removing from them some "doubtful cognates". Our cognacy judgements were based on the data from Dyen's database, Douglas Harper's Online Etymology Dictionary (2001), IE Lexical Cognacy database (IELex, 2014) and IE Etymological Dictionaries Collection (2005).
In total, our database includes 1315 cognate sets with related borrowings.

Along with the Readme file this archive includes:

1) Database file in the CSV format - Database.csv. The data in this file are encoded in the following order: 
Meaning, Cognate set number for this meaning, Language, Language number (according to Dyen, 1997), Word form

2) Workflow_charts file in the pdf format presenting 3 workflow charts used to infer phylogenetic networks by means of Split graphs, Galled networks and Directed hybridization networks (the new method).

3) DataSplitGraphs directory contains input, intermediate and output files used, and generated, during the inference of Split Graphs (Huson and Bryant, 2006).

4) DataGalledNetworks directory contains input, intermediate and output files used, and generated, during the inference of Galled Networks (Huson et al., 2012).

5) DataHybridDetection_new_method directory contains input, intermediate and output files used, and generated, during the inference of Directed Hybridization Networks (Willems et al., 2014).

6) Levenshtein + SCA distance scripts directory contains Perl and Python scripts used to calculate the normalized Levenshtein and SCA (List, 2012) distances. Some examples of input and output files are also included. Note that the installation of the Lingpy package (List, 2012), available at ttp://lingpy.org, is required for the computation of the SCA distance.

7) Trees_Levenshtein_SCA file in the pdf format includes phylogenetic trees obtained using the SCA phonetic distance (List, 2012) - they are in blue, and using the normalized Levenshtein distance - they are in red. These word trees include patterns of word borrowing events (WBE). They are used to compare the results obtained using the Levenshtein and SCA distances (i.e., which of these distances can better recognize WBE patterns).

8) Tree_inference_data_Levenshtein directory contains input, intermediate and output files used, and generated, during the inference of word trees based on the Levenshtein distance. These trees are presented in red in Trees_Levenshtein_SCA.pdf.

9) Tree_inference_data_SCA directory contains input, intermediate and output files used, and generated, during the inference of word trees based on the SCA distance. These trees are presented in blue in Trees_Levenshtein_SCA.pdf.

REFERENCES

Douglas Harper's Online Etymology Dictionary. Available at <http://www.etymonline.com> (2001).

Dyen I., Kruskal J. B. & Black P. Comparative IE database collected by Isidore Dyen. Available at <http://www.ntu.edu.au/education/langs/ielex/IE-RATE1> (1997).

Huson D.H., Bryant D. Application of phylogenetic networks in evolutionary studies. Molecular Biology and Evolution 23, 254-267 (2006).

Huson D. H., Scornavacca C. Dendroscope 3: An interactive tool for rooted phylogenetic trees and networks. Syst. Biol. 61, 1061–1067 (2012).

List J.-M. SCA: Phonetic Alignment based on sound classes. In New directions in logic, language, and computation, volume 7415 of Lecture Notes in Computer Science, (eds D. Lassiter, M. Slavkovik), pp 32–51. Berlin Heidelberg, Germany: Springer (2012).

Lubotsky A. IE Etymological Dictionaries Project (Leiden Indo-European Etymological Dictionary Series, also available online at <http://iedo.brillonline.nl/dictionaries>, (2005).

Swadesh M. Lexico-statistical dating of prehistoric ethnic contacts: With special reference to North American Indians and Eskimos. Proc. Am. Phil. Soc. 96, 452–463 (1952).

The Indo-European Lexical Cognacy Database (IELex). Available at <http://ielex.mpi.nl> (2014). 

Willems M., Tahiri N. and Makarenkov V. (2014), A new efficient algorithm for inferring explicit hybridization networks following the Neighbor-Joining principle, J. of Bioinf. and Comp. Biol., 12(5).
