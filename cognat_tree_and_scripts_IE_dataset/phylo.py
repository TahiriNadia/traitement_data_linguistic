#! /usr/bin/env python

"""
Manipulation d'arbres phylogenetiques

Auteur  : Nadia Tahiri
Date    : January 2017
version : 1.0 
"""

__author__ = "Nadia Tahiri"
__date__   = "January 2017"

import dendropy
import sys
import re

nameFile = sys.argv[1] 
nameFileWE = nameFile.replace(".txt", "") #name file without extension
f_in = open(nameFile, 'r')
f_out = open(nameFileWE,'w')

#== Liste des langues par cluster
celtic = ["IrishA","IrishB","WelshN","WelshC","BretonL","BretonSE","BretonST"]
italic = ["Romanian","Vlach","Ladin","Italian","SardiniaN","SardiniaC","SardiniaL"]
french = ["Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan"]
west_germanic = ["GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan"]
north_germanic = ["SwedishUp","SwedishVL","Swedish","Riksmal","Icelandic","Faroese","Danish"]
baltic = ["LithuaO","LithuaST","Latvian"]
slavic = ["Slovenian","Macedonia","Bulgarian","Serbo","LusatiaL","LusatiaU","Czech","CzechE","Slovak","Ukrainian","Byelo","Russian","Polish"]
indic = ["Romani","Singhales","Marathi","Gujarati","Panjabi","Lahnda","Hindi","Bengali","Nepali","Khaskura","Kashmiri"]
iranian = ["Ossetic","Wakhi","Persian","Tadzik","Baluchi","Afghan","Waziri"]
albanian = ["AlbanT","AlbanG","AlbanTop","AlbanK","ALbanC"]
greek = ["GreekML","GreekMD","GreekMod","GreekD","GreekK"]
latin = ["Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","SardiniaL","SardiniaN","SardiniaC","Italian","Romanian","Vlach","Ladin"]
other = ["TocharianA","TocharianB","Hittite","ArmenianM","ArmenianL"]
latin_germanic = ["SwedishUp","SwedishVL","Swedish","Riksmal","Icelandic","Faroese","Danish","GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan","Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","SardiniaL","SardiniaN","SardiniaC","Italian","Romanian","Vlach","Ladin"]
latin_west_germanic = ["GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan","Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","SardiniaL","SardiniaN","SardiniaC","Italian","Romanian","Vlach","Ladin"]
french_west_germanic = ["Provencal","French","Walloon","CreoleC","CreoleD","Spanish","Portugues","Brazilian","Catalan","GermanST","PennDutch","Dutch","Afrikaans","Flemish","Frisian","English","Sranan"]
vide_lang = [""]


if(sys.argv[2] == "celtic"):
	language = celtic
elif(sys.argv[2] == "italic"):
	language = italic
elif(sys.argv[2] == "french"):
	language = french
elif(sys.argv[2] == "west_germanic"):
	language = west_germanic
elif(sys.argv[2] == "north_germanic"):
	language = north_germanic
elif(sys.argv[2] == "baltic"):
	language = baltic
elif(sys.argv[2] == "slavic"):
	language = slavic
elif(sys.argv[2] == "indic"):
	language = indic
elif(sys.argv[2] == "iranian"):
	language = iranian
elif(sys.argv[2] == "albanian"):
	language = albanian
elif(sys.argv[2] == "greek"):
	language = greek
elif(sys.argv[2] == "latin"):
	language = latin
elif(sys.argv[2] == "other"):
	language = other
elif(sys.argv[2] == "latin_germanic"):
	language = latin_germanic
elif(sys.argv[2] == "latin_west_germanic"):
	language = latin_west_germanic
elif(sys.argv[2] == "french_west_germanic"):
	language = french_west_germanic
else:
	language = vide_lang
	
all_languages = celtic + baltic + slavic + indic + iranian  + albanian + greek + latin_germanic + other

# all_languages = celtic + italic + french + west_germanic + north_germanic + baltic + slavic + indic + iranian  + albanian + greek + latin + other
print ("")
print (all_languages)
print ("")
#remove the language isn't include on the good cluster
for i in range (0,len(language)):
	all_languages.remove(language[i])
print ("")
print (all_languages)
print ("")
for ligne in f_in: 
	#print (ligne,end="") 
	#ligne = re.sub(r"\n+\r+\f+\s+", "", ligne)
	#ligne = "".join(ligne.split("\s"))
	#ligne = ligne.replace('\n', '')
	#ligne = "".join(ligne.splitlines())
	ligne.rstrip()
	tree_str = "[&R] " + ligne
	
	tree = dendropy.Tree.get(
        data=tree_str,
        schema="newick")
	print("Before:")
	print(tree.as_string(schema='newick'))
	#print(tree.as_ascii_plot())
	tree.prune_taxa_with_labels(all_languages)
	#print("After:")
	#print(tree.as_string(schema='newick'))
	#print(tree.as_ascii_plot())
	
	print("after:")
	print(tree.as_string(schema='newick'))
	str = tree.as_string(schema='newick')
	#str = ");".join(str.split("):\d+\.\d+;"))
	str = re.sub(r':\d+\.\d+;',';',str)
	#print(str)
	#str = re.sub(r'\b):\d+\.\d+\b','',str)
	print(str.replace("[&R] ", ""), file=f_out, end="")
	
	
	
f_out.close()
f_in.close()

