*//////////////////////////////////////////////////////////////////////
* (C) National Semiconductor, Corporation.
* Models developed and under copyright by:
* National Semiconductor, Corporation.  
*/////////////////////////////////////////////////////////////////////
* Legal Notice:  
* The model may be copied, and distributed without any modifications;
* however, reselling or licensing the material is illegal.
* We reserve the right to make changes to the model without prior notice. 
* Pspice Models are provided "AS IS, WITH NO WARRANTY OF ANY KIND" 
*////////////////////////////////////////////////////////////////////
* NATIONAL LM8261
* PINOUT ORDER IS
*  +IN -IN VCC VEE OUT
*   3   2   7   4   6
.SUBCKT LM8261 3 2 7 4 6
V5 8 34 0.7E-3
Q6 5 8 11 Q6M 
R2 12 38 100.0E3
D1 46 31 D1M 
E1 16 0 17 0 1.0
V6 31 12 0.75
V7 34 51 4.0E-3
R3 2 36 500.0
R4 51 3 500.0
M1 20 12 46 46 MWPM
I1 7 46 100.0E-6
I2 41 4 50.0E-6
I3 7 44 50.0E-6
R5 29 27 500.0
E2 38 16 43 9 1.0
RE2 43 0 1.0E12
V4 7 43 2.0
R7 7 9 10.0E6
R20 9 4 10.0E6
Q7 26 36 37 Q6M 
R14 7 26 300.0
R15 7 5 300.0
R6 29 33 500.0
Q3 23 23 8 QQN
R18 37 42 500.0
Q9 42 18 4 QQN
R19 11 42 500.0
Q1 13 13 7 QQP
Q2 21 21 4 QQN
R16 28 4 300.0
R17 45 4 300.0
C4 19 6 8.0E-12
R8 17 19 220.0
R10 7 22 12.0
Q4 36 36 23 QQN
R11 4 15 12.0
Q5 8 8 49 QQN
R12 24 15 100.0
I5 32 7 4.0E-6
Q28 14 35 28 QQN
R13 25 22 100.0
Q8 49 49 36 QQN
R9 46 30 1.0
Q29 17 35 45 Q29M
Q30 50 20 4 QQN
Q31 20 20 4 QQN
Q32 6 50 15 Q32M
Q33 50 24 4 QQN
I6 4 35 4.0E-6
Q34 44 44 21 QQN
I7 39 7 2.0E-6
V10 7 40 1.4
Q35 7 44 50 QQN
Q36 6 30 22 Q36M
Q37 12 25 7 QQP
Q38 41 41 13 QQP
Q40 50 41 46 QQP
Q41 14 32 26 QQP
Q42 17 32 5 Q42M
Q43 29 39 7 QQP
Q44 45 34 27 Q44M
Q45 28 36 33 Q45M
Q46 18 40 29 QQP
Q47 18 18 4 QQN
.MODEL QQN NPN
.MODEL QQP PNP
.MODEL Q44M PNP BF=85.0
.MODEL Q45M PNP BF=85.0
.MODEL Q6M NPN BF=200.0
.MODEL Q29M NPN VAF=150.0
.MODEL Q42M PNP VAF=150.0
.MODEL Q32M NPN BF=600.0 VAF=125.0
.MODEL Q36M PNP BF=165.0 VAF=100.0
.MODEL MWPM PMOS KP=1.0E-3 VTO=-0.6
.MODEL D1M D IS=7.0E-14 M=0.45 N=2 TT=6.0E-9
.ENDS
