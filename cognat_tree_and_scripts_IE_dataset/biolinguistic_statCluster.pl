use strict;
use warnings;

#== En parametres, donner au programme le fichier avec les arbres des langues
#== Exemple >perl biolinguistic_statCluster.pl out_trees_1302.txt
die("Erreur...\nperl $0 filename") if((scalar @ARGV) != 1);


my $fichier = $ARGV[0];

#== Liste des langues par cluster
my @celtic = ("IrishA","IrishB","WelshN","WelshC","BretonL","BretonSE","BretonST");
my @italic = ("Romanian","Vlach","Ladin","Italian","SardiniaN","SardiniaC","SardiniaL");
my @french = ("Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan");
my @west_germanic = ("GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan");
my @north_germanic = ("SwedishUp","SwedishVL","Swedish","Riksmal","Icelandic","Faroese","Danish");
my @baltic = ("LithuaO","LithuaST","Latvian");
my @slavic = ("Slovenian","Macedonia","Bulgarian","Serbo","LusatiaL","LusatiaU","Czech","CzechE","Slovak","Ukrainian","Byelo","Russian","Polish");
my @indic = ("Romani","Singhales","Marathi","Gujarati","Panjabi","Lahnda","Hindi","Bengali","Nepali","Khaskura","Kashmiri");
my @iranian = ("Ossetic","Wakhi","Persian","Tadzik","Baluchi","Afghan","Waziri");
my @albanian = ("AlbanT","AlbanG","AlbanTop","AlbanK","ALbanC");
my @greek = ("GreekML","GreekMD","GreekMod","GreekD","GreekK");
my @latin = ("Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","SardiniaL","SardiniaN","SardiniaC","Italian","Romanian","Vlach","Ladin");
my @latin_germanic = ("SwedishUp","SwedishVL","Swedish","Riksmal","Icelandic","Faroese","Danish","GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan","Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","SardiniaL","SardiniaN","SardiniaC","Italian","Romanian","Vlach","Ladin");
my @latin_west_germanic = ("GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan","Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","SardiniaL","SardiniaN","SardiniaC","Italian","Romanian","Vlach","Ladin");
my @french_west_germanic = ("Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan");
my @other = ("TocharianA","TocharianB","Hittite","ArmenianM","ArmenianL");

#-- Noms des fichiers de sorties
my $file_celtic = "celtic.txt";
my $file_italic = "italic.txt";
my $file_french = "french.txt";
my $file_west_germanic = "west_germanic.txt";
my $file_north_germanic = "north_germanic.txt";
my $file_baltic = "baltic.txt";
my $file_slavic = "slavic.txt";
my $file_indic = "indic.txt";
my $file_iranian = "iranian.txt";
my $file_albanian = "albanian.txt";
my $file_greek = "greek.txt";
my $file_latin = "latin.txt";
my $file_latin_germanic = "latin_germanic.txt";
my $french_west_germanic = "french_west_germanic.txt";
my $file_latin_west_germanic = "latin_west_germanic.txt";

print "STATISTIC celtic:\n";
&statListeLangue($file_celtic,@celtic);

print "STATISTIC italic:\n";
&statListeLangue($file_italic,@italic);

print "STATISTIC french:\n";
&statListeLangue($file_french,@french);

print "STATISTIC west_germanic:\n";
&statListeLangue($file_west_germanic,@west_germanic);

print "STATISTIC north_germanic:\n";
&statListeLangue($file_north_germanic,@north_germanic);

print "STATISTIC baltic:\n";
&statListeLangue($file_baltic,@baltic);

print "STATISTIC slavic:\n";
&statListeLangue($file_slavic,@slavic);

print "STATISTIC indic:\n";
&statListeLangue($file_indic,@indic);

print "STATISTIC iranian:\n";
&statListeLangue($file_iranian,@iranian);

print "STATISTIC albanian:\n";
&statListeLangue($file_albanian,@albanian);

print "STATISTIC greek:\n";
&statListeLangue($file_greek,@greek);

print "STATISTIC latin:\n";
&statListeLangue($file_latin,@latin);

print "STATISTIC latin_germanic:\n";
&statListeLangue($file_latin_germanic,@latin_germanic);

print "STATISTIC latin_west_germanic:\n";
&statListeLangue($file_latin_west_germanic,@latin_west_germanic);

print "STATISTIC french_west_germanic:\n";
&statListeLangue($french_west_germanic,@french_west_germanic);

print STDOUT "\n\n\nFin normale du script $0\n\n\n";

#=======================================================
#= Fonction statListeLangue
#= input: 
#= 1) nom de fichier de sortie
#= 2) liste des langue d'un cluster
#= output: 
#= 1) fichier avec les arbres avec 4 langues d'un même 
#= cluster.
#=======================================================
sub statListeLangue{

	my ($name_file,@liste_langues) = @_;
	
	open ( IN , $fichier) or die($!);
	open ( OUT, ">".$name_file) or die($!);
	my $compteur = 0;
	my $i = 0;
	
	while( my $ligne = <IN> ){
		chomp($ligne);
		$i = 0;
		$compteur = 0;
		while( $i<scalar(@liste_langues)){
			if( $ligne =~ /\($liste_langues[$i]:|,$liste_langues[$i]:/ ){
				$compteur++;
			}
			$i++;
		}
		
		if($compteur>=4){
			print OUT "$ligne\n";
			#print "$ligne\n";
		}
	}
	close ( IN );
	close ( OUT );
}