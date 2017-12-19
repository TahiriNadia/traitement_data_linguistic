# traitement_data_linguistic
Traitement and analysis of indo-european languages


          COMPARATIVE INDOEUROPEAN DATABASE COLLECTED BY ISIDORE DYEN

                                 FILE IE-DATA1

       Copyright (C) 1997 by Isidore Dyen, Joseph Kruskal, and Paul Black
                   This file was last modified on Feb 5, 1997

-----------------
TABLE OF CONTENTS
-----------------

    1. INTRODUCTION
    2. HISTORY OF THE DATA IN THIS FILE
    3. FORMAT OF THE DATA
       3a. Meaning of Cognation
       3b. Meaning of the CCN's
    4. LISTS (SPEECH VARIETIES) USED IN THE STUDY
    5. THE DATA

---------------
1. INTRODUCTION
---------------

This file contains data that were placed on punched cards in the 1960s,
and transferred to disc circa 1990.  It gives cognation data among 95
Indoeuropean speech varieties.  These data were the basis for, and are
fully described in, the monograph

        "An Indoeuropean Classification: A Lexicostatistical Experiment"
        by Isidore Dyen, Joseph B Kruskal, and Paul Black, in
        Transactions of the American Philosophical Society, 1992,
        vol. 82, part 5.

(though the text front matter in the data files sometimes describes
details omitted in the monograph).  For each meaning in the list of 200
basic meanings (chosen by Morris Swadesh in 1952), this file contains

        the forms used in the 95 speech varieties

collected by Isidore Dyen and

        the cognation decisions among the speech varieties

made by Isidore Dyen in the 1960s.  Note, however, that the speech forms
are represented only as upper case English letters that were punched
long ago into IBM cards, and do NOT contain the diacritical marks that
were handwritten onto the surface of the cards.  Thus the cognation
decisions are provided in full detail, and the forms are described well
enough for an expert to check which forms were chosen, BUT ...

        THE FORMS ARE NOT DESCRIBED WELL ENOUGH FOR PHONOLOGICAL OR
        PHONETIC ANALYSIS!

We hope to provide the forms in fuller detail in 1997.

The monograph uses only 84 of the 95 speech varieties.  All 95 varieties
are listed in Section 4 below, with the 11 varieties not used in the
monograph being listed separately after the others.  One Albanian list
was not used because it was virtually identical with another Albanian
list, except for having some missing forms.  (These two lists were from
supposedly different Albanian dialects.)  In addition, 10 Slavic lists
taken from Fodor (1961) were not used.  As noted in the footnote on page
19 of the monograph (which mistakenly identifies all 11 lists as
Slavic), these lists tended to favor cognate Slavic forms and thus share
higher percentages with each other than the 13 Slavic lists used in the
monograph do.  Although either set of Slavic lists supports much the
same subgrouping, using the two sets together yields results which
reflect the difference in the nature of the lists as well as the actual
relationships among the speech varieties they represent.

For information about this database, see the monograph or other files
obtainable from the

   Linguistic Data Consortium
   Linguistics Department
   University of Pennsylvania
   Philadelphia, PA
      ldc@ldc.upenn.edu
      http://www.ldc.upenn.edu/

The three authors may be contacted as shown.

   Prof. Isidore Dyen, 1121 Wilder Avenue, Honolulu, HI 96822

   Dr. Joseph B Kruskal, Bell Labs, Lucent Technologies
   Room 2C-281, Murray Hill, NJ 07974
      kruskal@research.bell-labs.com

   Dr. Paul Black, Faculty of Education, Northern Territory University,
   Darwin NT 0909 Australia
      pblack@ntu.edu.au

-----------------------------------
2. HISTORY OF THE DATA IN THIS FILE
-----------------------------------

The history of this data set is helpful in understanding its structure.
For each speech variety, the speech forms were handwritten onto a list
by a competent linguist circa 1970.  (The monograph acknowledges each of
the contributing linguists and/or published sources, and the lists that
they provided.)

The lists were given names and numbers, the latter approximately
reflecting the order in which the lists were collected. Each line of the
list contains the form (or forms) appropriate for a single meaning in
the Swadesh list.  The speech forms from these lists were then punched
onto IBM cards using the limited set of characters available on cards at
that time, yielding one "form card" for each Swadesh meaning in each
list.  Also punched into each form card was the meaning number, the list
number, the list name, and further information, no longer of interest,
which is not retained here.

Then the information punched into each card was printed onto the surface
of the card, and the printed speech form was modified by handwritten
diacritical marks and other handwritten symbols to bring the form(s)
into agreement with the information from the source list.  The
combination of handwritten and printed information on each punched card
is a linguistically accurate representation of the speech form(s).

After being punched, printed, and handwritten, the form cards were
arranged by meaning.  For each meaning, the forms on the form cards were
examined and cognation judgments made by Isidore Dyen.  (Note that
cognation judgments are only made between forms having the same
meaning.  This is an important aspect of the lexicostatistical method.)
The cognation judgments were recorded by arranging the form cards into
classes of forms such that the forms in each class are "cognate" or
"doubtfully cognate" with each other, and by inserting a "subheader
card" at the start of each class.  "Relationship cards" were appended
after the subheader cards when needed to provide cognation information
among the classes.  For each meaning, a "header card" was subsequently
inserted in front of the cards dealing with that meaning.

---------------------
3. FORMAT OF THE DATA
---------------------

The original punched cards are represented by data given in Section 5,
where each line represents a separate card.  Trailing blank columns were
removed, so that every line ends with a nonblank character.  Most of the
repetitive information on the cards that was needed in the original
context has been retained here, but the arrangement of information on
the cards has been changed for convenience.  In addition, the name and
number originally assigned to each list (and the speech variety it
represents) have been replaced by those used in the monograph, as
described in Section 4 below. Furthermore, a character ("a", "b", "c",
or blank) has been added to the beginning of each line to make it easy
to identify its type (and that of the original card), as follows:

         "a"  for a header line,
         "b"  for a subheader line,
         "c"  for a relationship line,
        blank for a form line.

This data set consists of 25,812 lines, which are divided into 200
blocks, one for each Swadesh meaning.  The block for each meaning starts
with a single header line like the following:

a 003 ANIMAL

  A header line has an "a" in column 1,
  the meaning number in columns 3-5,
  and the meaning itself starting in columns 7-30

Each block consists of several subblocks.  Each subblock starts with a
single subheader line like the following:

b                      207

  A subheader line has a "b" in column 1,
  and a three-digit number called the CCN in columns 24-26.

CCN, which stands for Cognate Class(ification) Number, is a unique
identifier for the subblock within the block.  Its value also carries
meaning, as explained below.

In some subblocks the subheader line is followed by one or more
relationship lines like the following:

c                         207  3  209

  A relationship line has a "c" in column 1,
  a CCN in columns 27-29,
  either "2" or "3" in column 32,
  and another CCN in columns 35-37.

Such a line indicates a relationship between the subblocks identified by
the two CCN's.  A "2" indicates "cognation" and a "3" indicates
"doubtful cognation".  The two CCN's in this line always occur in
numerical order.  The above relationship line shows that "doubtful
cognation" has been judged to exist between the member(s) of subblocks
207 and 209.

Each subblock contains, as its final portion, one or more form lines
like the following:

  003 01 Irish A         AINMHE, BEITHIDHEACH

  A form line has a blank in column 1,
  the meaning number in columns 3-5,
  the list number in columns 7-8,
  the list name in columns 10-24,
  and the form or forms in columns 26-78.

Such a line gives the form or forms used for the indicated meaning in
the indicated list.  This form line shows that meaning 003 (ANIMAL) in
list 01 (Irish A) has the two forms shown.

Thus for a given meaning, the forms in all 95 lists are divided into
classes numbered by three-digit CCN's.  With the exception of two
special classes numbered 000 and 001, all the forms in a given class
either have been judged "cognate" with each other or else all have been
judged "doubtfully cognate" with each other.  The value of the CCN, as
explained below, indicates whether the judgment is "cognate" or
"doubtfully cognate".  (The special use of CCN's 000 and 001 is also
explained below.) To indicate which class the speech form belongs to,
the form line contains its CCN.

------------------------
3a. Meaning of Cognation
------------------------

Two forms, in two different speech varieties, are "cognate" if within
both of the varieties they have an unbroken history of descent from a
common ancestral form.  Forms believed to be related by borrowing or by
accidental similarity are thus not treated as cognate.  For example,
since the English ST word FRUIT and French word FRUIT are known to be
related by borrowing, they have been assigned different CCN's to show
that they are not cognate.  In a small number of cases it is difficult
to distinguish cognates from borrowing or accidental similarities, and
this is when they are treated as "doubtfully cognate".

To handle cases where more than one form is shown for a single meaning,
the following rule is used:  The cognation level between forms for
meaning m in lists A and B is the HIGHEST degree of cognation judged
between ANY of the meaning m forms from list A and ANY of the meaning m
forms from list B.  For example, consider meaning 073, TO HIT, and the
form lines for three speech varieties:

  073 27 Afrikaans       SLAAN, RAPS
  073 24 German ST       SCHLAGEN, TREFFEN
  073 33 Danish          RAMME, TRAEFFE

The first two form lines are listed as "cognate" since SLAAN and
SCHLAGEN are judged "cognate".  The fact that RAPS and TREFFEN are "not
cognate" to one another nor to SLAAN and SCHLAGEN does not matter, since
it is the highest degree of cognation (between SLAAN and SCHLAGEN) which
is used.  The last two form lines are also listed "cognate" since
TREFFEN and TRAEFFE are judged "cognate".  However, the first and third
form lines are listed as "not cognate", since both SLAAN and RAPS are
judged "not cognate" with both RAMME and TRAEFFE.

The rule discussed in the preceding paragraph has the odd-sounding
consequence that for meaning 073 (TO HIT), Afrikaans is "cognate" to
German ST and German ST is "cognate" to Danish, but Afrikaans is "not
cognate" to Danish.  This lack of mathematical "transitivity" is the
major reason why our complex method of describing cognation is needed.

------------------------
3b. Meaning of the CCN's
------------------------

The meaning of the CCN's is described in the following table.

 CCN  How It Is Used
 ---  ----------------------------------------------------------------
 000  Special class for when the source of the list did not contain a
      form for the given meaning.  Accordingly form cards under CCN 000
      usually do not list any form, and where a form is listed (in 13
      instances), it is not considered an appropriate one. For example,
      LANEZ is listed for the meaning 'snow' in French Creole C, but
      since the source described it as a proper name with this meaning,
      it has been placed under CCN 000.

 001  Special class for lists containing a form which is "unique", i.e.,
      the form is judged "not cognate" with the forms in every other
      list.

 002  (Range A)  Each CCN in Range A is assigned to a class of lists
 to   whose forms are judged "cognate" with each other and judged "not
 099  cognate" with the forms from every other list.  (The largest
      actual CCN in this range turns out to be 019.)

 100  (Range B)  Each CCN in Range B is assigned to a class of lists
 to   whose forms are judged "doubtfully cognate" with each other and
 199  judged "not cognate" with the forms from every other list.  (The
      largest actual CCN in this range turns out to be 103.)

 200  (Range C)  Each CCN in Range C is assigned to a class of forms
 to   that are judged "cognate" with each other and judged either
 399  "cognate" or "doubtfully cognate" with at least one form from some
      other list.  (Some of these classes contain only one form.  The
      largest actual CCN in this range turns out to be 224.)

 400  (Range D)  Each CCN in Range D is assigned to a class of forms
 to   that are judged "doubtfully cognate" with each other and judged
 499  "doubtfully cognate" with at least one form from some other list.
      (The largest actual CCN in this range turns out to be 401.)

      "Relationship lines" are used to show relationships between
      classes in Ranges C and D.  To indicate that two classes labelled
      CCN1 and CCN2 are judged "cognate", a line of the following form
      is used:

c                         CCN1  2  CCN2

      To indicate that two classes labelled CCN1 and CCN2 are judged
      "doubtfully cognate", a line of the following form is used:

c                         CCN1  3  CCN2

     Thus 2 indicates "cognate", and
          3 indicates "doubtfully cognate".

      In such relationship lines, CCN1 is always < CCN2, i.e., the
      smaller CCN is always listed first.

---------------------------------------------
4. LISTS (SPEECH VARIETIES) USED IN THE STUDY
---------------------------------------------

Information on each of the 95 lists of forms used to represent speech
varieties is presented on a separate line in the Table of Lists below.
The first 84 lists appear in the same order used in the Indoeuropean
classification (in Appendices 1 and 5 and Figure 1 of the monograph).
These 84 are followed by the remaining 11 lists, which were not used in
the monograph (as noted earlier). For each list the following
information is given, as explained further below.

    Classification, i.e., the classification index number (used in
        Appendices 1, 2, and 5 of the monograph) or a note that the list
        was not used in the monograph.

    L#, i.e., the list number used to identify the list in these files.

    List Name.  This is the name used to identify the list in these
        files.  For the first 84 lists, it is the same name that was
        used in the monograph.  For the remaining 11 lists, it is the
        Original Name.

    O#, i.e., the number assigned to the original handwritten list.

    Original Name, i.e., the name used on the original handwritten
    list.

    Meanings, i.e., the number of meanings for which forms are available
        for comparison.

The list numbers (L#) were assigned sequentially to the lists in their
present order, based on the classification.  They are important in some
accompanying files (currently IE-PERC84, IE-PERC95, IE-TIME84, and
IE-TIME95) because they identify the matrix rows and columns associated
with particular lists.  They also appear on the form cards in the data
in Section 5, but redundantly along with the list name.

The original numbers (O#) and original names are those used on the
original handwritten lists and punched cards.  Since these do not seem
to have been used in any publication relating to the data, they are of
importance only if it is necessary to relate the current version of the
data to its original form.  (If any reason should be found to do so, it
is possible to restore the original list numbers and names to columns 7
to 24 of the form cards in Section 5.  It is only necessary to replace
L# and List Name in these columns by the corresponding O# and Original
Name from the following table.)

'Meanings', the number of meanings available for comparison, is simply
the total number of meanings, 200, minus the number of form cards with a
CCN of 000 (signifying that the form was unknown or uncertain) for the
particular list.  It can serve as a crude measure of how well the speech
variety was documented.  The 'meanings' column is the maximum number of
meanings for which forms could be compared, but this number itself did
not enter into any calculations.  (The files of results, such as
IE-PERC95 and IE-TIME95, describe how the various calculations were
carried out.)
