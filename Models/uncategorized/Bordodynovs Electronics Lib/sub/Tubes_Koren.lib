*TUBE LIBRARY

* This library was developed by Norman Koren.
*
* For details, refer to the article, "Improved Vacuum-Tube Models
* for SPICE simulations," Glass Audio, Vol. 8, No. 5, 1996,
* available from Audio Amateur Corporation, 305 Union St.,
* PO Box 176, Peterborough, NH 03458 USA.  Phone 603-924-9464.
*
* All the usual legal disclaimers apply.  The author has made
* every effort to provide correct information, but assumes no
* liabilities for errors, misuse of the models,
* or inevitable changes made by users.
*
* The author welcomes your comments, stories, and questions
* (if they don't require too much effort to answer).  For really
* BIG stuff, he will consider consulting for a fee.
* Please contact Norman Koren by Email at kormar@cts.com.
*
* Some models are commented out because the evaluation version of
* Pspice has a maximum of twenty.
*
******************
*
* 1. modified pentode model to work with native LTspice Tetrode symbols.
* 2. added the two new pentode models
* 3. updated the triode model to include the VCT variable (contact potential)
* 4. modified to use sub circuits to save space.
* 5. Added loads more valves.
* 6. JJ valves have their own section
* 7. Svetlana valves have their own section
* 8. US and european valves are now in sections of similar types
* 9. Original Koren models retained with _OLD appended
* 10. All new data samples from the data sheets where available.
* 
* All the newer models are generated via a modified version of Norman Koren's
* matlab solver.
*
* Suusi Malcolm-Brown-B May - June 2008
*
******************



**************************
* Triode Output Pentodes *
**************************

******************
.SUBCKT 6AB8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL80
X1 1 2 3 ECL80T ; same as ECL80T
.ENDS    6AB8T

******************
.SUBCKT 6AB8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL80
X1 1 2 3 4 ECL80P ; same as ECL80P
.ENDS	6AB8P

******************
.SUBCKT 6BM8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL82
X1 1 2 3 ECL82T ; same as ECL82T
.ENDS    6BM8T

******************
.SUBCKT 6BM8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL82
X1 1 2 3 4 ECL82P ; same as ECL82P
.ENDS	6BM8P

******************
.SUBCKT 6DX8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL84
X1 1 2 3 ECL84T ; same as ECL84T
.ENDS    6DX8T

******************
.SUBCKT 6DX8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL84
X1 1 2 3 4 ECL84P ; same as ECL84P
.ENDS	6DX8P

******************
.SUBCKT 6GV8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL85
X1 1 2 3 ECL85T ; same as ECL85T
.ENDS    6GV8T

******************
.SUBCKT 6GV8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL85
X1 1 2 3 4 ECL85P ; same as ECL85P
.ENDS	6GV8P

******************
.SUBCKT 6GW8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL86
X1 1 2 3 ECL86T ; same as ECL86T
.ENDS    6GW8T

******************
.SUBCKT 6GW8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL86
X1 1 2 3 4 ECL86P ; same as ECL86P
.ENDS	6GW8P

********************************
* Triode small signal Pentodes *
********************************

******************
.SUBCKT 7199T  1 2 3 ; P G C (Triode) ; TRIODE SECTION
* RCA 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=32.71 EX=1.284 KG1=534.8 KP=52.95 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.0p CGP=2.5p CCP=1.0p ; 
.ENDS    7199T

******************
.SUBCKT 7199P  1 2 3 4 ; A G2 G1 C (PENTODE) ; PENTODE SECTION
* RCA 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 4 PENTODE1 MU=97.92 EX=1.350 KG1=361.8 KG2=4500 KP=79.56 KVB=6.4 VCT=0.00 RGI=2000 CCG=5.7p CPG1=0.6p CCP=2.5p ; 
.ENDS    7199P

******************
.SUBCKT 6AN8T_OLD 1 2 3  ; A G C (Triode)  ; TRIODE SECTION
* Original Koren Lib
X1 1 2 3 TRIODE MU=21.2 EX=1.36 KG1=945 KP=84 KVB=300 RGI=2000 CCG=2.7P CGP=2.2P CCP=1.0P	; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS	6AN8T

******************
.SUBCKT 6AN8P_OLD 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Original Koren Lib
X1 1 2 3 4 PENTODE MU=45 EX=1.35 KG1=520 KG2=120 KP=120 KVB=18 CCG=8P CPG1=.8P CCP=3P RGI=2K 
.ENDS	6AN8P

******************
.SUBCKT 6AN8T  1 2 3 ; P G C (Triode) ; TRIODE SECTION
* Sylvania Data sheet 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=25.23 EX=1.350 KG1=772.2 KP=65.20 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.7p CGP=2.2p CCP=0.8p ; 
.ENDS    6AN8T

******************
.SUBCKT 6AN8P  1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Sylvania Data sheet 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 4 PENTODE1 MU=47.04 EX=1.350 KG1=487.2 KG2=4500 KP=113.02 KVB=17.0 VCT=0.00 RGI=2000 CCG=5.7p CPG1=0.6p CCP=2.5p ; 
.ENDS    6AN8P

******************
.SUBCKT 6AX8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent
X1 1 2 3 ECF80T ; same as ECF 80
.ENDS    6AX8T

******************
.SUBCKT 6AX8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent
X1 1 2 3 4 ECF80P ; same as ECF 80
.ENDS	6AX8P

******************
.SUBCKT 6BL8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent
X1 1 2 3 ECF80T ; same as ECF 80
.ENDS    6BL8T

******************
.SUBCKT 6BL8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent
X1 1 2 3 4 ECF80P ; same as ECF 80
.ENDS	6BL8P

******************
.SUBCKT 6U8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent
X1 1 2 3 ECF82T ; same as ECF 82
.ENDS    6U8T

******************
.SUBCKT 6U8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent
X1 1 2 3 4 ECF82P ; same as ECF 82
.ENDS	6U8P

******************
.SUBCKT 6HG8T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent
X1 1 2 3 ECF80T ; same as ECF 86
.ENDS    6HG8T

******************
.SUBCKT 6HG8P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent
X1 1 2 3 4 ECF80P ; same as ECF 86
.ENDS	6HG8P

************************
* Small Signal Triodes *
************************

******************
.SUBCKT 6922 1 2 3 ; A G C (Triode)	AKA E88CC
* Mullard
X1 1 2 3 TRIODE MU=31.75 EX=1.177 KG1=233.1 KP=288.17 KVB=83.4 VCT=0.00 RGI=2000 CCG=2.3P CGP=2.4P CCP=.9P	; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS	6922

******************
.SUBCKT 7025  1 2 3 ; P G C (Triode)
* Sylvania Technical Manual 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 TRIODE MU=102.50 EX=1.409 KG1=1598.8 KP=813.82 KVB=44.9 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=0.9p ; 
.ENDS    7025

******************
.SUBCKT 6CG7  1 2 3 ; P G C (Triode)
* GE Data Sheet 1963  
* library format: LTSpice 02-Jun-2008
X1 1 2 3 TRIODE MU=21.86 EX=1.319 KG1=1248.5 KP=140.12 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.9p CGP=4.7p CCP=2.7p ; 
.ENDS    6CG7

******************
.SUBCKT 6DJ8_OLD 1 2 3 ; A G C	(Triode) ;
* Original Koren Lib
X1 1 2 3 TRIODE MU=28 EX=1.3 KG1=330 KP=320 KVB=300 RGI=2000 CCG=2.3P  CGP=2.1P CCP=.7P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS.
.ENDS	6DJ8_OLD

******************
.SUBCKT 6DJ8 1 2 3 ; A G C	(Triode) ;
* Tom Mitchell
X1 1 2 3 TRIODE MU=30.51 EX=1.532 KG1=453.9 KP=233.17 KVB=190.9 VCT=0.50  RGI=2000 CCG=2.3P  CGP=2.1P CCP=.7P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS.
.ENDS	6DJ8

******************
.SUBCKT 6SL7GT  1 2 3 ; P G C (Triode)
* GE 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=75.89 EX=1.233 KG1=1735.2 KP=1725.27 KVB=7.0 VCT=0.50 RGI=2000 CCG=2.9p CGP=4.1p CCP=1.5p ; 
.ENDS    6SL7GT

******************
.SUBCKT 6SN7  1 2 3 ; P G C (Triode)
* Sylvania Technical Manual 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=21.07 EX=1.341 KG1=1446.2 KP=157.81 KVB=179.4 VCT=0.00 RGI=2000 CCG=3.1p CGP=4.7p CCP=1.4p ; 
.ENDS    6SN7

******************
.SUBCKT 6SN7GTA  1 2 3 ; P G C (Triode)
* Sylvania data sheet  
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=21.54 EX=1.316 KG1=1261.1 KP=156.78 KVB=296.4 VCT=0.00 RGI=2000 CCG=3.1p CGP=4.7p CCP=1.4p ; 
.ENDS    6SN7GTA

******************
.SUBCKT 6SN7GTB  1 2 3 ; P G C (Triode)
* Sylvania 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=21.54 EX=1.316 KG1=1261.1 KP=156.78 KVB=296.4 VCT=0.00 RGI=2000 CCG=3.1p CGP=4.7p CCP=1.4p ; 
.ENDS    6SN7GTB

******************
.SUBCKT 12AT7_OLD 1 2 3 ; A G C	(Triode)	AKA ECC81
* Original Koren Model
X1 1 2 3 TRIODE MU=60 EX=1.35 KG1=460 KP=300 KVB=300 VCT=0.00 RGI=2000 CCG=2.3P CGP=2.2P CCP=1.0P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS	12AT7_OLD

******************
.SUBCKT 12AT7 1 2 3 ; A G C	(Triode)	AKA ECC81
* Tom Mitchell
X1 1 2 3 TRIODE MU=67.49 EX=1.234 KG1=419.1  KP=213.96 KVB= 300.0 VCT=0.00 RGI=2000 CCG=2.3P CGP=2.2P CCP=1.0P	; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS	12AT7

******************
.SUBCKT 12AT7WA  1 2 3 ; P G C (Triode)
* MAZDA BELVU Data Sheet AKA ECC81  
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=72.80 EX=1.167 KG1=341.8 KP=233.21 KVB=267.8 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    12AT7WA

******************
.SUBCKT 12AU7_OLD 1 2 3 ; A G C	(Triode)	AKA ECC82
* Original Koren Model
X1 1 2 3 TRIODE MU=21.5 EX=1.3 KG1=1180 KP=84 KVB=300 VCT=0.00 RGI=2000 CCG=2.3P  CGP=2.2P CCP=1.0P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS.  
.ENDS	12AU7_OLD 

******************
.SUBCKT 12AU7  1 2 3 ; P G C (Triode)
* Sylvania Technical Manual AKA ECC82 ECC802 5814 6067 6189 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=20.21 EX=1.230 KG1=1108.7 KP=84.96 KVB=551.3 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    12AU7

******************
.SUBCKT 12AU7A  1 2 3 ; P G C (Triode)
* MAZDA BELVU Data sheet AKA ECC82 ECC802 5814 6067 6189 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=19.41 EX=1.226 KG1=1233.8 KP=104.87 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    12AU7A

******************
.SUBCKT 12AX7_OLD 1 2 3 ; A G C (Triode)  OLD MODEL	AKA ECC83
* Original Koren Model, Use OLD temporarily for article.
X1 1 2 3 TRIODE MU=93 EX=1.5 KG1=1360 KP=10000 KVB=0 VCT=0.00 RGI=2000 CCG=2.3P  CGP=2.4P CCP=.9P	; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS 12AX7_OLD

******************
.SUBCKT 12AX7 1 2 3 ; A G C	(Triode)  OLD MODEL	AKA ECC83
* Original Koren Model
X1 1 2 3 TRIODE MU=100 EX=1.4 KG1=1060 KP=600 KVB=300 VCT=0.00 RGI=2000 CCG=2.3P CGP=2.4P CCP=.9P	; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS	12AX7

******************
.SUBCKT 12AX7ASYL  1 2 3 ; P G C (Triode)
* Sylvania Technical Manual 1955 AKA ECC83 12AX7A 7025 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=105.78 EX=1.474 KG1=1618.2 KP=432.76 KVB=35.6 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=0.9p ; 
.ENDS    12AX7ASYL

******************
.SUBCKT 12AX7A  1 2 3 ; P G C (Triode)
* RCA data sheet AKA ECC83 7025 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=100.26 EX=1.394 KG1=1651.8 KP=17950.75 KVB=524.4 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=0.9p ; 
.ENDS    12AX7A

******************
.SUBCKT 12AY7  1 2 3 ; P G C (Triode)
* GE data book June 1955 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=44.16 EX=1.113 KG1=1192.4 KP=409.96 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.0p CGP=2.0p CCP=1.0p ; 
.ENDS    12AY7

******************
.SUBCKT 12AZ7  1 2 3 ; P G C (Triode)
* RCA data sheet AKA 12AT7 ECC81 ECC801 6060 6201 6679 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=74.08 EX=1.371 KG1=382.0 KP=190.11 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    12AZ7

******************
.SUBCKT 12BH7A  1 2 3 ; P G C (Triode)
* GE Data sheet 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=24.59 EX=1.343 KG1=594.4 KP=73.01 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.9p CGP=3.2p CCP=1.1p ; 
.ENDS    12BH7A

*************************************
* Small Signal and Vary Mu Pentodes *
*************************************

******************
.SUBCKT  6267 1 2 3 4 ; A G2 G1 C (Pentode)
*  same as EF86 
X1 1 2 3 4 EF86
.ENDS	6267

******************
.SUBCKT  6CF8 1 2 3 4 ; A G2 G1 C (Pentode)
*  same as EF86
X1 1 2 3 4 EF86
.ENDS	6CF8

******************
.SUBCKT  6BK8 1 2 3 4 ; A G2 G1 C (Pentode)
*  same as EF86 
X1 1 2 3 4 EF86
.ENDS	6BK8

******************
.SUBCKT  6BY7 1 2 3 4 ; A G2 G1 C (Pentode)
*  same as EF85
X1 1 2 3 4 EF85
.ENDS	6BY7

******************
.SUBCKT  6DA6 1 2 3 4 ; A G2 G1 C (Pentode)
*  same as EF89
X1 1 2 3 4 EF89
.ENDS	6DA6

*****************
* Power Triodes *
*****************

******************
.SUBCKT 300B_OLD 1 2 3 ; A G C	(Triode)
* Original Koren Lib
X1 1 2 3 TRIODE MU=3.95 EX=1.4 KG1=1550 KP=65 KVB=300 VCT=0.00 RGI=1000 CCG=17P CGP=11P CCP=7.5P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS.
.ENDS	300B

******************
.SUBCKT 300B  1 2 3 ; P G C (Triode)
* Western Electric Data sheet 1950 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 TRIODE MU=3.92 EX=1.504 KG1=2140.3 KP=64.28 KVB=300.0 VCT=0.00 RGI=1000 CCG=17.0p CGP=11.0p CCP=7.5p ; 
.ENDS    300B

******************
.SUBCKT 2A3_OLD 1 2 3 ; A G C	(Triode)
* Original Koren Lib
X1 1 2 3 TRIODE MU=4.2 EX=1.4 KG1=1500 KP=60 KVB=300 RGI=2000 CCG=2.3P  CGP=2.2P CCP=1.0P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS. 
.ENDS	2A3

******************
.SUBCKT 2A3  1 2 3 ; P G C (Triode)
* TUNG-SOL Data sheet 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 TRIODE MU=4.05 EX=1.634 KG1=3652.2 KP=58.47 KVB=300.0 VCT=0.00 RGI=1000 CCG=17.0p CGP=8.2p CCP=6.0p ; 
.ENDS    2A3

************************************
* Power Pentodes and Beam Tetrodes *
************************************

******************
.SUBCKT 5881  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Tung-Sol Data Book 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 PENTODE1 MU=8.35 EX=1.484 KG1=2507.1 KG2=4500 KP=53.86 KVB=14.4 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=6.5p ; 
.ENDS    5881

******************
.SUBCKT 6550_OLD 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Original Koren Model
X1 1 2 3 4 PENTODE MU=7.9 EX=1.35 KG1=890 KG2=4200 KP=60 KVB=24 CCG=14P CPG1=.85P CCP=12P RGI=1K 
.ENDS	6550_OLD

******************
.SUBCKT 6550  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Tung-Sol Data Book 1963 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 PENTODE1 MU=8.61 EX=1.435 KG1=1066.6 KG2=4500 KP=39.55 KVB=20.5 VCT=0.00 RGI=1000 CCG=15.0p CPG1=0.8p CCP=10.0p ; 
.ENDS    6550

******************
.SUBCKT 6550A  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* GE Data sheet 1973 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 PENTODE1 MU=10.81 EX=1.397 KG1=703.2 KG2=4500 KP=27.68 KVB=19.1 VCT=0.00 RGI=1000 CCG=15.0p CPG1=0.8p CCP=10.0p ; 
.ENDS    6550A

******************
.SUBCKT  7027 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* RCA same as 6L6GC Higher Anode power
X1 1 2 3 4 6L6GC
.ENDS	7027

******************
.SUBCKT  7027A 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* RCA same as 6L6GC Higher Anode power
X1 1 2 3 4 6L6GC
.ENDS	7027A

******************
.SUBCKT 7189  1 2 3 4 ; A G2 G1 C (Pentode)
* Mullard Data Sheet AKA 6BQ5 EL84 N709 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 6BQ5 ; call 6BQ5 
.ENDS    7189

******************
.SUBCKT  7581 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Tung-Sol same as 6L6GC Higher Anode power
X1 1 2 3 4 6L6GC
.ENDS	7581

******************
.SUBCKT  7581A 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Tung-Sol same as 6L6GC Higher Anode power
X1 1 2 3 4 6L6GC
.ENDS	7581A

******************
.SUBCKT 6BQ5  1 2 3 4 ; A G2 G1 C (Pentode)
* Mullard Data Sheet AKA 7189 EL84 N709 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 PENTODE1 MU=21.29 EX=1.240 KG1=401.7 KG2=4500 KP=111.04 KVB=17.9 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=5.1p ; 
.ENDS    6BQ5

******************
.SUBCKT 6CA7_OLD 1 2 3 4 ; A G2 G1 C (Pentode) AKA EL34
* Original Original Koren Model
X1 1 2 3 4 PENTODE MU=11 EX=1.35 KG1=650 KG2=4200 KP=60 KVB=24 CCG=15P CPG1=1P CCP=8P RGI=1K 
.ENDS	6CA7_OLD

******************
.SUBCKT 6CA7 1 2 3 4 ; A G2 G1 C (Pentode) AKA EL34
* Mullard
X1 1 2 3 4 EL34 ; call the el34
.ENDS	6CA7

******************
.SUBCKT 6L6GB 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Sylvania
X1 1 2 3 4 PENTODE MU=8.77 EX=1.265 KG1=1210.3 KP=47.50 KG2=4500 KVB=11.6 VCT=0.00 CCG=14P CPG1=.85P CCP=12P RGI=1K
.ENDS	6L6GB

******************
.SUBCKT 6L6GC_OLD 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Original Koren Model
X1 1 2 3 4 PENTODE MU=8.7 EX=1.35 KG1=1460 KG2=4500 KP=48 KVB=12 CCG=14P CPG1=.85P CCP=12P RGI=1K
.ENDS	6L6GC_OLD

******************
.SUBCKT 6L6GC  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* GE Data sheet 
* library format: LTSpice 07-Oct-2008
X1 1 2 3 4 PENTODE1 MU=9.88 EX=1.442 KG1=1686.6 KG2=4500 KP=30.98 KVB=19.4 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=6.5p ; 
.ENDS    6L6GC

******************
.SUBCKT 6L6WGT 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* same as 6L6GB
X1 1 2 3 4 PENTODE MU=8.77 EX=1.265 KG1=1210.3 KP=47.50 KG2=4500 KVB=11.6 VCT=0.00 CCG=14P CPG1=.85P CCP=12P RGI=1K
.ENDS	6L6WGT


**************************
** European Valve Types **
**************************

*****************
* Output Triode *
*****************

******************
.SUBCKT 6C33C_OLD 1 2 3 ; A G C	(Triode) ; TWO CATHODES FROM BORBELY, GA 5/96.
* Original Koren Lib
X1 1 2 3 TRIODE MU=3.1 EX=1.4 KG1=163 KP=15 KVB=300 VCT=0.00 RGI=1000 CCG=30.0P  CGP=31.0P CCP=10.5P  ; ADD .7PF TO ADJACENT PINS; .5 TO OTHERS.
.ENDS	6C33C

******************
.SUBCKT 6C33C  1 2 3 ; P G C (Triode)
* Soviet (1970) Using both cathodes ie both heaters working 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 TRIODE MU=3.27 EX=1.397 KG1=150.9 KP=13.94 KVB=300.0 VCT=0.00 RGI=1000 CCG=30.0p CGP=31.0p CCP=10.5p ; 
.ENDS    6C33C

**************************
* Triode Output Pentodes *
**************************


******************
.SUBCKT ECL80P  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips Data book 1951 AKA 6AB8 
* library format: LTSpice 05-Feb-2009
X1 1 2 3 4 PENTODE1 MU=39.01 EX=0.925 KG1=228.9 KG2=4500 KP=50.26 KVB=21.2 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL80P

******************
.SUBCKT ECL80T  1 2 3 ; P G C (Triode)
* Philips Data book 1951 AKA 6AB8 
* library format: LTSpice 05-Feb-2009
X1 1 2 3 TRIODE MU=29.30 EX=1.332 KG1=1443.9 KP=45.50 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL80T

******************
.SUBCKT ECL81P  1 2 3 4 ; A G2 G1 C (Pentode)
* universal vademecum (1960) 
* library format: LTSpice 05-Feb-2009
X1 1 2 3 4 PENTODE1 MU=17.51 EX=1.350 KG1=590.8 KG2=4500 KP=209.03 KVB=32.5 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL81P

******************
.SUBCKT ECL81T  1 2 3 ; P G C (Triode)
* universal vademecum (1960) 
* library format: LTSpice 05-Feb-2009
X1 1 2 3 TRIODE MU=66.31 EX=1.390 KG1=1400.2 KP=369.30 KVB=2.5 VCT=0.50 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL81T

******************
.SUBCKT ECL82P  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips Data Book 17-02-1956 AKA 6BM8 
* library format: LTSpice 04-Feb-2009
X1 1 2 3 4 PENTODE1 MU=12.19 EX=1.350 KG1=522.0 KG2=4500 KP=38.60 KVB=25.8 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL82P

******************
.SUBCKT ECL82T  1 2 3 ; P G C (Triode)
* Philips Data Book 17-02-1956 AKA 6BM8
* library format: LTSpice 04-Feb-2009
X1 1 2 3 TRIODE MU=71.97 EX=1.480 KG1=1481.3 KP=500.37 KVB=0.7 VCT=0.50 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL82T

******************
.SUBCKT ECL83P  1 2 3 4 ; A G2 G1 C (Pentode)
* Mullard Data Book 1960 
* library format: LTSpice 04-Feb-2009
X1 1 2 3 4 PENTODE1 MU=10.96 EX=1.350 KG1=1249.7 KG2=4500 KP=54.82 KVB=14.5 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL83P

******************
.SUBCKT ECL83T  1 2 3 ; P G C (Triode)
* universal vademecum (1960) 
* library format: LTSpice 04-Feb-2009
X1 1 2 3 TRIODE MU=119.15 EX=1.321 KG1=732.5 KP=305.21 KVB=1.8 VCT=0.50 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL83T

******************
.SUBCKT ECL84P  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips Data Book sept 1968 AKA 6DX8 
* library format: LTSpice 04-Feb-2009
X1 1 2 3 4 PENTODE1 MU=43.66 EX=1.350 KG1=344.3 KG2=4500 KP=201.06 KVB=26.0 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL84P

******************
.SUBCKT ECL84T  1 2 3 ; P G C (Triode)
* Philips Data Book sept 1968 AKA 6DX8 
* library format: LTSpice 03-Feb-2009
X1 1 2 3 TRIODE MU=87.85 EX=1.507 KG1=473.2 KP=343.45 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL84T

******************
.SUBCKT ECL85P  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips Data Book Jan 1960 AKA 6GV8 
* library format: LTSpice 03-Feb-2009
X1 1 2 3 4 PENTODE1 MU=9.35 EX=1.350 KG1=556.4 KG2=4500 KP=35.28 KVB=21.3 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL85P

******************
.SUBCKT ECL85T  1 2 3 ; P G C (Triode)
* Philips Data Book Jan 1960 AKA 6GV8 
* library format: LTSpice 03-Feb-2009
X1 1 2 3 TRIODE MU=56.54 EX=1.608 KG1=719.6 KP=247.12 KVB=3.0 VCT=0.50 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL85T

******************
.SUBCKT ECL86P  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips Data Book Jan 1970 AKA 6GW8 
* library format: LTSpice 03-Feb-2009
X1 1 2 3 4 PENTODE1 MU=23.15 EX=1.350 KG1=479.1 KG2=4500 KP=128.94 KVB=36.0 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECL86P

******************
.SUBCKT ECL86T  1 2 3 ; P G C (Triode)
* Philips Data Book Jan 1970 AKA 6GW8
* library format: LTSpice 03-Feb-2009
X1 1 2 3 TRIODE MU=102.92 EX=1.425 KG1=1754.6 KP=1098.83 KVB=0.5 VCT=0.50 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECL86T

******************
.SUBCKT ECL802T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL85
X1 1 2 3 ECL85T ; same as ECL85T
.ENDS    ECL802T

******************
.SUBCKT ECL802P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL85
X1 1 2 3 4 ECL85P ; same as ECL85P
.ENDS	ECL802P

******************
.SUBCKT ECL802T  1 2 3 ; P G C (Triode)  ; TRIODE SECTION
* Call Equiverlent AKA ECL85
X1 1 2 3 ECL85T ; same as ECL85T
.ENDS    ECL802T

******************
.SUBCKT ECL805P 1 2 3 4 ; A G2 G1 C (Pentode)	; PENTODE SECTION
* Call Equiverlent AKA ECL85
X1 1 2 3 4 ECL85P ; same as ECL85P
.ENDS	ECL805P

********************************
* Triode small signal Pentodes *
********************************

******************
.SUBCKT ECF80P  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips data sheet AKA 6BL8  
* library format: LTSpice 31-May-2008
X1 1 2 3 4 PENTODE1 MU=46.13 EX=1.350 KG1=688.5 KG2=4500 KP=149.94 KVB=8.0 VCT=0.00 RGI=2000 CCG=5.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECF80P

******************
.SUBCKT ECF80T  1 2 3 ; P G C (Triode)
* Philips data sheet AKA 6AX8 6BL8  
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=22.97 EX=1.300 KG1=616.4 KP=71.31 KVB=150.9 VCT=0.50 RGI=2000 CCG=3.0p CGP=2.2p CCP=2.3p ; 
.ENDS    ECF80T

******************
.SUBCKT ECF82P  1 2 3 4 ; A G2 G1 C (Pentode)
* Universal Vademecum (1960) AKA 6U8  
* library format: LTSpice 31-May-2008
X1 1 2 3 4 PENTODE1 MU=37.97 EX=1.350 KG1=849.8 KG2=4500 KP=90.97 KVB=20.1 VCT=0.00 RGI=2000 CCG=5.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECF82P

******************
.SUBCKT ECF82T  1 2 3 ; P G C (Triode)
* WF data sheet AKA 6U8  
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=49.87 EX=1.255 KG1=323.2 KP=106.38 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.0p CGP=2.2p CCP=2.3p ; 
.ENDS    ECF82T

******************
.SUBCKT ECF83P  1 2 3 4 ; A G2 G1 C (Pentode)
* Universal Vademecum (1960) 
* library format: LTSpice 31-May-2008
X1 1 2 3 4 PENTODE1 MU=12.24 EX=1.350 KG1=2401.0 KG2=4500 KP=27.36 KVB=23.5 VCT=0.00 RGI=2000 CCG=5.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECF83P

******************
.SUBCKT ECF83T  1 2 3 ; P G C (Triode)
* Universal Vademecum (1960) 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=11.83 EX=1.052 KG1=521.1 KP=69.30 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.2p CGP=3.5p CCP=3.1p ; 
.ENDS    ECF83T

******************
.SUBCKT ECF86P  1 2 3 4 ; A G2 G1 C (Pentode)
* Sylvania Technical Manual AKA 6HG8 
* library format: LTSpice 31-May-2008
X1 1 2 3 4 PENTODE1 MU=64.17 EX=1.350 KG1=328.7 KG2=4500 KP=394.31 KVB=26.0 VCT=0.00 RGI=2000 CCG=6.7p CPG1=0.6p CCP=4.1p ; 
.ENDS    ECF86P

******************
.SUBCKT ECF86T  1 2 3 ; P G C (Triode)
* Mazda Belvu Data Book  AKA 6HG8
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=16.08 EX=1.162 KG1=601.4 KP=79.68 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.2p CGP=2.7p CCP=1.8p ; 
.ENDS    ECF86T

************************
* Small Signal Triodes *
************************

******************
.SUBCKT E80CC  1 2 3 ; P G C (Triode)
* Philips data sheet Dec 1968 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=32.74 EX=1.468 KG1=2447.9 KP=235.61 KVB=2119.4 VCT=0.50 RGI=2000 CCG=3.0p CGP=2.2p CCP=2.3p ; 
.ENDS    E80CC

******************
.SUBCKT ECC81  1 2 3 ; P G C (Triode)
* Mullard data book Jan 1969 12AT7 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=77.09 EX=1.077 KG1=320.1 KP=231.05 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    ECC81

******************
.SUBCKT ECC82  1 2 3 ; P G C (Triode)
* Mullard data book Jan 1969 AKA 12AU7A 12AU7 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=19.98 EX=1.291 KG1=1359.0 KP=87.34 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    ECC82

******************
.SUBCKT ECC83  1 2 3 ; P G C (Triode)
* Mullard data sheet 1970 AKA 12AX7A 7025 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=98.11 EX=1.459 KG1=1734.7 KP=754.39 KVB=119.9 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=0.9p ; 
.ENDS    ECC83

******************
.SUBCKT ECC84  1 2 3 ; P G C (Triode)
* Philips data book 1955 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=27.76 EX=1.309 KG1=492.0 KP=95.80 KVB=379.2 VCT=0.50 RGI=2000 CCG=2.8p CGP=1.9p CCP=1.0p ; 
.ENDS    ECC84

******************
.SUBCKT ECC85  1 2 3 ; P G C (Triode)
* Philips data book 1954 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=69.50 EX=1.481 KG1=551.4 KP=224.40 KVB=2689.3 VCT=0.50 RGI=2000 CCG=2.8p CGP=3.7p CCP=1.0p ; 
.ENDS    ECC85

******************
.SUBCKT ECC86  1 2 3 ; P G C (Triode)
* Philips data book 1959 
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=29.91 EX=1.596 KG1=294.6 KP=48.11 KVB=210.6 VCT=0.50 RGI=2000 CCG=3.7p CGP=1.8p CCP=2.3p ; 
.ENDS    ECC86

******************
.SUBCKT ECC87  1 2 3 ; P G C (Triode)
* Same as E80CC 
* library format: LTSpice 31-May-2008
X1 1 2 3 E80CC  
.ENDS    ECC87

******************
.SUBCKT ECC88  1 2 3 ; P G C (Triode)
* Philips Data sheet March 1957 AKA 6DJ8  
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=31.04 EX=1.069 KG1=210.9 KP=369.74 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.7p CGP=2.3p CCP=2.2p ; 
.ENDS    ECC88

******************
.SUBCKT E88CC  1 2 3 ; P G C (Triode)
* Mullard Data sheet December 1968 AKA 6DJ8, ECC88, 6922  
* library format: LTSpice 31-May-2008
X1 1 2 3 TRIODE MU=35.56 EX=1.134 KG1=196.7 KP=278.19 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.7p CGP=2.3p CCP=2.2p ; 
.ENDS    E88CC

******************
.SUBCKT ECC801S  1 2 3 ; P G C (Triode)
* Telefunken Data Sheet AKA 6201 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=77.15 EX=1.078 KG1=320.0 KP=230.75 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    ECC801S

******************
.SUBCKT ECC802S  1 2 3 ; P G C (Triode)
* Telefunken Data sheet AKA 6189 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=24.10 EX=1.254 KG1=1023.1 KP=65.28 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    ECC802S

******************
.SUBCKT ECC803S  1 2 3 ; P G C (Triode)
* Telefunken Data sheet AKA 6057 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=98.32 EX=1.456 KG1=1722.8 KP=749.41 KVB=131.2 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=1.1p ; 
.ENDS    ECC803S

*************************************
* Small Signal and Vary Mu Pentodes *
*************************************

******************
.SUBCKT EF80  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips data sheet AKA 6BX6 
* library format: LTSpice 05-Feb-2009
X1 1 2 3 4 PENTODE2 MU=49.11 EX=1.420 KG1=667.0 KG2=4500 KP=375.96 KVB=42.9 VCT=0.50 RGI=2000 CCG=4.5p CPG1=0.6p CCP=5.6p ; 
.ENDS    EF80

******************
.SUBCKT EF83  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips data sheet  
* library format: LTSpice 30-May-2008
X1 1 2 3 4 PENTODE1 MU=12.01 EX=1.350 KG1=2830.0 KG2=4500 KP=35.24 KVB=39.1 VCT=0.00 RGI=2000 CCG=4.5p CPG1=0.6p CCP=5.6p ; 
.ENDS    EF83

******************
.SUBCKT EF85  1 2 3 4 ; A G2 G1 C (Pentode)
* La RadioTechique 
* library format: LTSpice 30-May-2008
X1 1 2 3 4 PENTODE2 MU=22.39 EX=1.350 KG1=974.2 KG2=4500 KP=160.84 KVB=40.9 VCT=0.00 RGI=2000 CCG=4.5p CPG1=0.6p CCP=5.6p ; 
.ENDS    EF85

******************
.SUBCKT EF86  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips data sheet AKA 6CF8 and 6267 Z729 EF806
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 PENTODE1 MU=34.90 EX=1.350 KG1=2648.1 KG2=4500 KP=222.06 KVB=4.7 VCT=0.00 RGI=2000 CCG=4.3p CPG1=0.6p CCP=5.1p ; 
.ENDS    EF86

******************
.SUBCKT EF89  1 2 3 4 ; A G2 G1 C (Pentode)
* La Radiotechnique AKA 6DA6
* library format: LTSpice 30-May-2008
X1 1 2 3 4 PENTODE1 MU=30.52 EX=1.350 KG1=926.7 KG2=4500 KP=39.49 KVB=23.6 VCT=0.00 RGI=2000 CCG=5.5p CPG1=0.0p CCP=5.1p ; 
.ENDS    EF89

******************
.SUBCKT EF806  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips data sheet AKA 6CF8 and 6267 Z729 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 EF86 ; 
.ENDS    EF806

******************
.SUBCKT Z729  1 2 3 4 ; A G2 G1 C (Pentode)
* Philips data sheet AKA 6CF8 and 6267 Z729 EF806
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 EF86 ; 
.ENDS    Z729

************************************
* Power Pentodes and Beam Tetrodes *
************************************

******************
.SUBCKT EL34_OLD 1 2 3 4 ; A G2 G1 C (Pentode)	AKA 6CA7
* Original Koren Model
X1 1 2 3 4 PENTODE MU=11 EX=1.35 KG1=650 KG2=4200 KP=60 KVB=24 CCG=15P CPG1=1P CCP=8P RGI=1K 
.ENDS	EL34_OLD

******************
.SUBCKT EL34  1 2 3 4 ; P G1 C G2 (Pentode)
* Mullard Data Book Apr 1962 
* library format: PSPICE 21-Sep-2008
X1 1 2 3 4 PENTODE1 MU=12.02 EX=1.169 KG1=353.9 KG2=4500 KP=61.11 KVB=29.9 VCT=0.00 RGI=1000 CCG=15.0p CPG1=1.0p CCP=8.0p ; 
.ENDS    EL34

******************
.SUBCKT EL84  1 2 3 4 ; A G2 G1 C (Pentode)
* Mullard Data Sheet AKA 7189 6BQ5 N709 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 PENTODE1 MU=21.29 EX=1.240 KG1=401.7 KG2=4500 KP=111.04 KVB=17.9 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=5.1p ; 
.ENDS    EL84

******************
.SUBCKT N709  1 2 3 4 ; A G2 G1 C (Pentode)
* Mullard Data Sheet AKA 6BQ5 EL84 7189 
* library format: LTSpice 02-Jun-2008
X1 1 2 3 4 EL84 ; call EL84 
.ENDS    N709

******************
.SUBCKT KT66  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* M-O Valve Co AKA Genalex 
* library format: LTSpice 21-Sep-2008
X1 1 2 3 4 PENTODE1 MU=11.68 EX=1.197 KG1=510.9 KG2=4500 KP=34.89 KVB=22.3 VCT=0.00 RGI=1000 CCG=16.0p CPG1=2.3p CCP=10.0p ; 
.ENDS    KT66

******************
.SUBCKT KT77  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* The M-O Valve Co AKA Genalex 
* library format: LTSpice 19-Sep-2008
X1 1 2 3 4 PENTODE1 MU=12.49 EX=1.487 KG1=1058.5 KG2=4500 KP=56.64 KVB=19.4 VCT=0.00 RGI=1000 CCG=16.5p CPG1=1.0p CCP=9.0p ; 
.ENDS    KT77

******************
.SUBCKT KT88_OLD 1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Original Koren Model
X1 1 2 3 4 PENTODE MU=8.8 EX=1.35 KG1=730 KG2=4800 KP=32 KVB=16 VCT=0.00 CCG=14P CPG1=.85P CCP=12P RGI=1K 
.ENDS	KT88_OLD

******************
.SUBCKT KT88  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* The M-O Valve Co AKA Genalex 
* library format: LTSpice 19-Sep-2008
X1 1 2 3 4 PENTODE1 MU=12.38 EX=1.246 KG1=340.4 KG2=4500 KP=26.48 KVB=36.5 VCT=0.00 RGI=1000 CCG=14.0p CPG1=0.8p CCP=12.0p ; 
.ENDS    KT88

******************
* JJ Tubes       *
******************

******************
.SUBCKT JJECC81  1 2 3 ; P G C (Triode)
* JJ Data Sheet AKA 12AT7 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=77.15 EX=1.078 KG1=320.0 KP=230.75 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    JJECC81

******************
.SUBCKT JJECC82  1 2 3 ; P G C (Triode)
* JJ Data sheet AKA 12AU7  
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=24.10 EX=1.254 KG1=1023.1 KP=65.28 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    JJECC82

******************
.SUBCKT JJECC83S  1 2 3 ; P G C (Triode)
* JJ Data sheet AKA 12AX7A 7025 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=98.32 EX=1.456 KG1=1722.8 KP=749.41 KVB=131.2 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=0.9p ; 
.ENDS    JJECC83S

******************
.SUBCKT JJECC802S  1 2 3 ; P G C (Triode)
* JJ Data sheet AKA 6189 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=24.10 EX=1.254 KG1=1023.1 KP=65.28 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    JJECC802S

******************
.SUBCKT JJECC803S  1 2 3 ; P G C (Triode)
* JJ Data sheet AKA 6057 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=98.32 EX=1.456 KG1=1722.8 KP=749.41 KVB=131.2 VCT=0.50 RGI=2000 CCG=2.3p CGP=2.4p CCP=1.1p ; 
.ENDS    JJECC803S

******************
.SUBCKT JJE88CC  1 2 3 ; P G C (Triode)
* JJ Data sheet AKA 6DJ8, ECC88, 6922  
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=35.56 EX=1.134 KG1=196.7 KP=278.19 KVB=300.0 VCT=0.00 RGI=2000 CCG=3.7p CGP=2.3p CCP=2.2p ; 
.ENDS    JJE88CC

******************
.SUBCKT JJECC99  1 2 3 ; P G C (Triode)
* JJ Data sheet  
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=23.07 EX=1.468 KG1=455.3 KP=191.93 KVB=300.0 VCT=0.00 RGI=2000 CCG=2.3p CGP=2.2p CCP=1.0p ; 
.ENDS    JJECC99

******************
.SUBCKT JJEF806S  1 2 3 4 ; A G2 G1 C (Pentode)
* JJ Data sheet 
* library format: LTSpice 30-May-2008
X1 1 2 3 4 PENTODE1 MU=35.04 EX=1.350 KG1=2242.2 KG2=4500 KP=221.86 KVB=7.1 VCT=0.00 RGI=2000 CCG=4.3p CPG1=0.6p CCP=5.1p ; 
.ENDS    JJEF806S

******************
.SUBCKT JJ7591S  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data Sheet 
* library format: LTSpice 29-May-2008
X1 1 2 3 4 PENTODE1 MU=14.21 EX=1.350 KG1=1124.3 KG2=4500 KP=182.66 KVB=48.8 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.3p CCP=5.0p ; 
.ENDS    JJ7591S

******************
.SUBCKT JJEL84  1 2 3 4 ; A G2 G1 C (Pentode)
* JJ Data Sheet AKA 6BQ5  
* library format: LTSpice 29-May-2008
X1 1 2 3 4 PENTODE1 MU=19.56 EX=1.350 KG1=593.0 KG2=4500 KP=131.34 KVB=17.5 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=5.1p ; 
.ENDS    JJEL84

******************
.SUBCKT JJEL509  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data sheet - Warning Non standard valve - check data sheet 
* library format: LTSpice 29-May-2008
X1 1 2 3 4 PENTODE1 MU=8.32 EX=1.350 KG1=130.6 KG2=4500 KP=11.62 KVB=24.4 VCT=0.00 RGI=1000 CCG=10.0p CPG1=3.0p CCP=6.5p ; 
.ENDS    JJEL509

******************
.SUBCKT JJ2A3  1 2 3 ; P G C (Triode)
* JJ Data sheet 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=4.30 EX=1.868 KG1=7214.4 KP=23.90 KVB=300.0 VCT=0.00 RGI=1000 CCG=17.0p CGP=11.0p CCP=7.5p ; 
.ENDS    JJ2A3

******************
.SUBCKT JJ300B  1 2 3 ; P G C (Triode)
* JJ Data sheet 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=3.92 EX=1.504 KG1=2140.3 KP=64.28 KVB=300.0 VCT=0.00 RGI=1000 CCG=17.0p CGP=11.0p CCP=7.5p ; 
.ENDS    JJ300B

******************
.SUBCKT JJ7027  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data sheet 
* library format: LTSpice 18-Sep-2008
X1 1 2 3 4 PENTODE1 MU=13.94 EX=1.063 KG1=320.2 KG2=4500 KP=33.20 KVB=29.6 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=6.5p ; 
.ENDS    JJ7027

******************
.SUBCKT JJ6L6GC  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data sheet 
* library format: LTSpice 18-Sep-2008
X1 1 2 3 4 PENTODE1 MU=13.94 EX=1.063 KG1=320.2 KG2=4500 KP=33.20 KVB=29.6 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=6.5p ; 
.ENDS    JJ6L6GC

******************
.SUBCKT JJEL34  1 2 3 4 ; A G2 G1 C (PENTODE)
* JJ Data Sheet 
* library format: LTSpice 07-Oct-2008
X1 1 2 3 4 PENTODE1 MU=11.55 EX=1.350 KG1=650.2 KG2=6000 KP=51.85 KVB=25.4 VCT=0.00 RGI=1000 CCG=15.0p CPG1=1.0p CCP=8.0p ; 
.ENDS    JJEL34

******************
.SUBCKT JJKT66  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data Sheet 
* library format: LTSpice 07-Oct-2008
X1 1 2 3 4 PENTODE1 MU=10.50 EX=1.314 KG1=866.5 KG2=4500 KP=36.12 KVB=25.3 VCT=0.00 RGI=1000 CCG=16.0p CPG1=2.3p CCP=10.0p ; 
.ENDS    JJKT66

******************
.SUBCKT JJKT77  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data Sheet 
* library format: LTSpice 27-May-2008
X1 1 2 3 4 PENTODE1 MU=13.27 EX=1.350 KG1=460.2 KG2=4500 KP=31.98 KVB=55.7 VCT=0.00 RGI=1000 CCG=16.5p CPG1=1.0p CCP=9.0p ; 
.ENDS    JJKT77

******************
.SUBCKT JJKT88  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* JJ Data Sheet 
* library format: LTSpice 19-Sep-2008
X1 1 2 3 4 PENTODE1 MU=12.43 EX=1.218 KG1=315.7 KG2=4500 KP=26.72 KVB=36.1 VCT=0.00 RGI=1000 CCG=14.0p CPG1=0.8p CCP=12.0p ; 
.ENDS    JJKT88

******************
* Svetlana Tubes *
******************

******************
.SUBCKT SV300B  1 2 3 ; P G C (Triode)
* Svetlana's Data sheet 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=3.91 EX=1.301 KG1=943.5 KP=229.85 KVB=300.0 VCT=0.00 RGI=1000 CCG=9.0p CGP=15.0p CCP=7.5p ; 
.ENDS    SV300B

******************
.SUBCKT SV6N1P  1 2 3 ; P G C (Triode)
* Svetlana's Data sheet 
* library format: LTSpice 01-Jun-2008
X1 1 2 3 TRIODE MU=36.65 EX=1.537 KG1=1020.2 KP=193.29 KVB=300.0 VCT=-0.50 RGI=2000 CCG=3.7p CGP=2.3p CCP=2.2p ; 
.ENDS    SV6N1P

******************
.SUBCKT SVEL509  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Svetlana's Data sheet AKA 6KG6  
* library format: LTSpice 29-May-2008
X1 1 2 3 4 PENTODE1 MU=8.08 EX=1.350 KG1=263.9 KG2=4500 KP=11.68 KVB=42.1 VCT=0.00 RGI=1000 CCG=10.0p CPG1=3.0p CCP=6.5p ; 
.ENDS    SVEL509

******************
.SUBCKT SV6L6GC  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Svetlana's website 
* library format: LTSpice 27-May-2008
X1 1 2 3 4 PENTODE1 MU=11.76 EX=1.350 KG1=996.4 KG2=4500 KP=26.88 KVB=22.1 VCT=0.00 RGI=1000 CCG=10.0p CPG1=0.6p CCP=6.5p ; 
.ENDS    SV6L6GC

******************
.SUBCKT SV6550C  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Svetlana's website 
* library format: LTSpice 27-May-2008
X1 1 2 3 4 PENTODE1 MU=8.33 EX=1.350 KG1=789.8 KG2=4500 KP=44.65 KVB=30.5 VCT=0.00 RGI=1000 CCG=14.0p CPG1=0.8p CCP=12.0p ; 
.ENDS    SV6550C

******************
.SUBCKT SVEL34  1 2 3 4 ; A G2 G1 C (Pentode)
* Svetlana's website 
* library format: LTSpice 07-Oct-2008
X1 1 2 3 4 PENTODE1 MU=11.52 EX=1.350 KG1=608.9 KG2=4500 KP=41.16 KVB=30.1 VCT=0.00 RGI=1000 CCG=15.0p CPG1=1.0p CCP=8.0p ; 
.ENDS    SVEL34

******************
.SUBCKT SVKT88  1 2 3 4 ; A G2 G1 C (Beam Tetrode)
* Svetlana's website 
* library format: LTSpice 19-Sep-2008
X1 1 2 3 4 PENTODE1 MU=9.98 EX=0.944 KG1=165.6 KG2=4500 KP=38.07 KVB=35.4 VCT=0.00 RGI=1000 CCG=14.0p CPG1=0.8p CCP=12.0p ; 
.ENDS    SVKT88

***********************
**MATHAMATICAL MODELS**
***********************

******************
.SUBCKT TRIODE 1 2 3 ; A G C
E1  7 0 VALUE={V(1,3)/KP*LOG(1+EXP(KP*(1/MU+(V(2,3)+VCT)/SQRT(KVB+V(1,3)*V(1,3)))))}
RE1 7 0 1G
G1  1 3 VALUE={(PWR(V(7,0),EX)+PWRS(V(7,0),EX))/KG1}
RCP 1 3 1G    ; TO AVOID FLOATING NODES IN MU-FOLLOWER
C1  2 3 {CCG}  ; CATHODE-GRID
C2  2 1 {CGP}  ; GRID=PLATE
C3  1 3 {CCP}  ; CATHODE-PLATE
D3  5 3 DX     ; FOR GRID CURRENT
R1  2 5 {RGI}  ; FOR GRID CURRENT
.ENDS	TRIODE

******************
.SUBCKT PENTODE 1 2 3 4 ; A G2 G1 C
RE1  7 0  1MEG    ; DUMMY SO NODE 7 HAS 2 CONNECTIONS
E1   7 0  VALUE={V(2,4)/KP*LOG(1+EXP((1/MU+V(3,4)/V(2,4))*KP))}	; E1 BREAKS UP LONG EQUATION FOR G1.
G1   1 4  VALUE={(PWR(V(7),EX)+PWRS(V(7),EX))/KG1*ATAN(V(1,4)/KVB)}
G2   2 4  VALUE={(EXP(EX*(LOG((V(2,4)/MU)+V(3,4)))))/KG2}
* G2   2 4  VALUE={PWR(V(2,4)/MU+V(3,4),EX)/KG2}
RCP  1 4  1G      ; FOR CONVERGENCE	A  - C
C1   3 4  {CCG}   ; CATHODE-GRID 1	C  - G1
C2   1 3  {CPG1}  ; GRID 1-PLATE	G1 - A
C3   1 4  {CCP}   ; CATHODE-PLATE	A  - C
R1   3 5  {RGI}   ; FOR GRID CURRENT	G1 - 5
D3   5 4  DX      ; FOR GRID CURRENT	5  - C
.ENDS PENTODE

******************
.SUBCKT PENTODE1 1 2 3 4 ; A G2 G1 C
RE1  7 0  1MEG    ; DUMMY SO NODE 7 HAS 2 CONNECTIONS
E1   7 0  VALUE={V(2,4)/KP*LOG(1+EXP((1/MU+V(3,4)/V(2,4))*KP))}	; E1 BREAKS UP LONG EQUATION FOR G1.
G1   1 4  VALUE={(PWR(V(7),EX)+PWRS(V(7),EX))/KG1*ATAN(V(1,4)/KVB)}
G2   2 4  VALUE={(EXP(EX*(LOG((V(2,4)/MU)+V(3,4)))))/KG2}
* G2   2 4  VALUE={PWR(V(2,4)/MU+V(3,4),EX)/KG2}
RCP  1 4  1G      ; FOR CONVERGENCE	A  - C
C1   3 4  {CCG}   ; CATHODE-GRID 1	C  - G1
C2   1 3  {CPG1}  ; GRID 1-PLATE	G1 - A
C3   1 4  {CCP}   ; CATHODE-PLATE	A  - C
R1   3 5  {RGI}   ; FOR GRID CURRENT	G1 - 5
D3   5 4  DX      ; FOR GRID CURRENT	5  - C
.ENDS PENTODE1

******************
.SUBCKT PENTODE2 1 2 3 4 ; A G2 G1 C
RE1  7 0  1MEG    ; DUMMY SO NODE 7 HAS 2 CONNECTIONS
E1   7 0  VALUE={V(2,4)/KP*LOG(1+EXP((1/MU+V(3,4)/V(2,4))*KP))}	; E1 BREAKS UP LONG EQUATION FOR G1.
* G1   1 4  VALUE={(PWR(V(7),EX)+PWRS(V(7),EX))/KG1*ATAN(V(1,4)/KVB)}
G1   1 4  VALUE={pi/2*(PWR(V(7),EX)+PWRS(V(7),EX))/KG1*(1-exp(-2*V(1,4)/(pi*KVB)))}
G2   2 4  VALUE={(EXP(EX*(LOG((V(2,4)/MU)+V(3,4)))))/KG2}
* G2   2 4  VALUE={PWR(V(2,4)/MU+V(3,4),EX)/KG2}
RCP  1 4  1G      ; FOR CONVERGENCE	A  - C
C1   3 4  {CCG}   ; CATHODE-GRID 1	C  - G1
C2   1 3  {CPG1}  ; GRID 1-PLATE	G1 - A
C3   1 4  {CCP}   ; CATHODE-PLATE	A  - C
R1   3 5  {RGI}   ; FOR GRID CURRENT	G1 - 5
D3   5 4  DX      ; FOR GRID CURRENT	5  - C
.ENDS PENTODE2

******************
.SUBCKT PENTODE3 1 2 3 4 ; A G2 G1 C
RE1  7 0  1MEG    ; DUMMY SO NODE 7 HAS 2 CONNECTIONS
E1   7 0  VALUE={V(2,4)/KP*LOG(1+EXP((1/MU+V(3,4)/V(2,4))*KP))}	; E1 BREAKS UP LONG EQUATION FOR G1.
* G1   1 4  VALUE={(PWR(V(7),EX)+PWRS(V(7),EX))/KG1*ATAN(V(1,4)/KVB)}
G1   1 4  VALUE={pi/2*(PWR(V(7),EX)+PWRS(V(7),EX))/KG1*tanh(2*V(1,4)/(pi*KVB))}
G2   2 4  VALUE={(EXP(EX*(LOG((V(2,4)/MU)+V(3,4)))))/KG2}
* G2   2 4  VALUE={PWR(V(2,4)/MU+V(3,4),EX)/KG2}
RCP  1 4  1G      ; FOR CONVERGENCE	A  - C
C1   3 4  {CCG}   ; CATHODE-GRID 1	C  - G1
C2   1 3  {CPG1}  ; GRID 1-PLATE	G1 - A
C3   1 4  {CCP}   ; CATHODE-PLATE	A  - C
R1   3 5  {RGI}   ; FOR GRID CURRENT	G1 - 5
D3   5 4  DX      ; FOR GRID CURRENT	5  - C
.ENDS PENTODE3

******************
.MODEL DX D(IS=1N RS=1 CJO=10PF TT=1N) ; diode used by the Triode, Pentode Beam Tetrode models

******************
** Transformers **
******************

******************
.SUBCKT PAT-4006-CFB 1 2 3 4 5 6 7 8 9 10 11
* PLITRON PAT-4006-CFB OUTPUT TRANSFORMER 2KOHM UL PRIMARY
* OL NUMBERS CORRESPOND TO TRANSFORMER SCHEMATIC.
.PARAM PRIML=392.5     ; TOTAL PRIMARY L (FROM SPECS).
.PARAM LRATIO={5/2000} ; INDUCTANCE RATIO: (5 OHMS)/(PRIMARY).
.PARAM QFCTR=400000     ; Q-FACTOR: PRIMARY SHUNT L/LEAKAGE L.
LP1 1 2   {PRIML*.09}     ; PRIMARY
LP2 2 3   {PRIML*.04}
LP3 3 4   {PRIML*.04}
LP4 4 5   {PRIML*.09}   
CP1 1 5   .342NF      ; CAPACITANCE FROM SPECS
LP5 8 7   {PRIML*LRATIO/4}  ; 1/2 SPEAKER SECONDARY
LP6 7 6   {PRIML*LRATIO/4}  ; " "
LP7 11 10 {PRIML*LRATIO}    ; 1/2 FBK WINDING
LP8 10 9  {PRIML*LRATIO}    ; " "
KALL LP1 LP2 LP3 LP4 LP5 LP6 LP7 LP8 .9999987 ; 1-1/(2*403600) AWESOME!
.ENDS PAT-4006-CFB

******************
.SUBCKT DYNA_OUTPUT_XFRMR 1 2 3 4 5 6 7 8 9  ; PARAMETERS FOR MARK 3:
+PARAMS: LPRIM=60 LLKG=.040 RPRIM=125 CPRIM=1.04NF LRATIO={4/4300}

* ERIC BARBOUR ARTICLE:  ~233H TOTAL PRIMARY L FOR MARK 3.
* MARK 3: LPRIM=60 LLKG=.040 RPRIM=125 CPRIM=1.04NF LRATIO={4/4300}

* LPRIM  IS THE TOTAL PRIMARY L (VARIES WITH MEASUREMENT).
* LLKG   IS THE LEAKAGE L (MEASURABLE: CONSISTENT).
* RPRIM  IS THE TOTAL PRIMARY R.
* CPRIM  IS THE MEASURED PRIMARY CAPACITANCE.
* LRATIO IS THE INDUCTANCE RATIO: (4 OHMS)/(PRIMARY Z).

.PARAM QFCTR={LPRIM/LLKG}  ; Q-FACTOR.
CS1 1 5    {CPRIM}     ; PRIMARY CAPACITANCE
RS1 1 5    300K        ; SHUNT R FOR HIGH FREQUENCY EFFECTS.
LP1 1 12   {LPRIM*.09} ; .7164H  ; PRIMARY
RP1 12 2   {RPRIM*.5}
LP2 2 3    {LPRIM*.04} ; .3184H
LP3 3 4    {LPRIM*.04}
LP4 4 45   {LPRIM*.09}
RP4 45 5   {RPRIM*.5}
LP5 7 6    {.34315*LPRIM*LRATIO} ; 8-16  OHM WINDING: (2-SQRT(2))^2
LP6 8 7    {.17157*LPRIM*LRATIO} ; 4-8   OHM WINDING: (SQRT(2)-1)^2
LP7 9 8    {LPRIM*LRATIO}        ; COM-4 OHM WINDING
KALL LP1 LP2 LP3 LP4 LP5 LP6 LP7 {1-1/(2*QFCTR)}  ; COUPLING
.ENDS DYNA_OUTPUT_XFRMR 

*model D1N5292  anode
*               | cathode
*               | |
.subckt D1N5292 1 2
  j1 1 2 2 jx
  .model   jx   NJF(Beta=134u Betatce=-.5 Rd=1 Rs=0 Lambda=366.1u Vto=-2.149
+               Vtotc=-2.5m N=2 Xti=3 Cgd=3p Is=10f M=.5 Pb=1 Fc=.5 Af=1)
*               Motorola        pid=NKL         case=DO7
*               88-07-25 bam    POVmax=100
*               88-12-16 pwt
.ends

*model D1N5295  anode
*               | cathode
*               | |
.subckt D1N5295 1 2
  j1 1 2 2 jx
  .model   jx   NJF(Beta=277.5u Betatce=-.5 Rd=1 Rs=0 Lambda=203.3u Vto=-1.721
+               Vtotc=-2.5m N=2 Xti=3 Cgd=4.5p Is=10f M=.5 Pb=1 Fc=.5 Af=1)
*               Motorola        pid=NKM         case=DO7
*               88-07-25 bam    POVmax=100
*               88-12-16 pwt
.ends D1N5295

*  .PARAM statements:  The parameter to be stepped
*  in the PSPICE schematic is PAR1.  (PAR1 is a global variable set in
*  Analysis...  Setup...   Parametric... in the PSPICE schematic program.) 

* .PARAM PAR1=1.                        ; NORMAL SETTING IF NOT STEPPED.
* .PARAM PARM={1-PAR1}
* .STEP PARAM PFRAC 0 1 .25  ; -1 1 1 ;  0 1 .25
* .PARAM PARP={ .5*(PAR1+ABS(PAR1))}    ; =  PAR1  IF PAR1 >= 0
* .PARAM PARN={-.5*(PAR1-ABS(PAR1))}    ; = |PAR1| IF PAR1 <= 0
*  PARTX IS FOR THE PAS TREBLE CONTROL.
* .PARAM PAR2={.5*(1-COS(3.141593*PAR1))}
* .PARAM PARTX={(EXP(4.60517*PAR1)-1)/99}
