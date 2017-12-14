#!/usr/bin/python
# *-* coding: utf-8 *-*
# This script calculates the SCA distance 
#
# Authors   : V. Makarenkov lab
# created  : 2015-05-26 16:41
"""
This file calculate the distance matrix 
"""
import sys
import unicodedata
import codecs
from lingpy import *
#sys.stdout = codecs.getwriter('utf8')(sys.stdout)
#
if (len(sys.argv)==1):
	print("Usage: python distance_sca.py cognat.txt [output.phylip]\n");
	exit(0);  
if (len(sys.argv)==2):
	filename="out.txt"
else:
	filename=sys.argv[2]
# Model for comparing 
sca = rc('sca')
# Data arrays
langues=[];
words=[];

f = open(sys.argv[1], 'r',encoding="utf8")
count=0;
for line in f:
        data=[];
        data=line.split();
        if (len(data)>=2):
        	langues.append(data[0]);
        	words.append(data[2]);			
        	count=count+1

f.close();
matrix = [[0]*count for i in range(count)]      
for i in range(0,count):
	for j in range(0,count):
		if (i<j):
			p=Pairwise(words[i], words[j])
			p.align(model=sca,distance=True)
			dist=p._alignments[0][2]
			matrix[i][j]=dist;
			matrix[j][i]=dist;			
			
#Output matrix in phylip compatible format
print("Saving results in: ",filename,"\n");
f = open(filename, 'w',encoding="utf8")		
f.write(str(count))
f.write("\n")		
for i in range(0,count):
	f.write(langues[i][0:9].ljust(10," "))	
	for j in range(0,count):
		f.write("%3.3f"%(matrix[i][j]));
		if (j!=count):
			f.write(" ");
	f.write("\n")	
f.close();		