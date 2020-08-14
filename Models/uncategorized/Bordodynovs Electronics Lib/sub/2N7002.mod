* Fairchild model
* 2N7002 ELECTRICAL MODEL (SOT-23 Single N-Ch DMOS)
* -----------------------
.SUBCKT  2N7002  20  10  30
Rg     10    1    1
M1      2    1    3    3    DMOS    L=1u   W=1u
.MODEL DMOS NMOS (VTO={2.1*{-0.0016*TEMP+1.04}}  KP=0.35  THETA=0.086 VMAX=2.2E5  LEVEL=3)
Cgs     1    3    60p
Rd     20    4    0.3 TC=0.0075
Dds     3    4    DDS
.MODEL     DDS    D(BV={60*{0.00072*TEMP+0.982}}   M=0.36  CJO=23p   VJ=0.8)
Dbody   3   20    DBODY
.MODEL   DBODY    D(IS=1.4E-13   N=1   RS=40m   TT=100n)
Ra      4    2    0.4 TC=0.0075
Rs      3    5    10m
Ls      5    30   .5n
M2      1    8    6    6   INTER
E2      8    6    4    1   2
.MODEL   INTER    NMOS(VTO=0  KP=10   LEVEL=1)
Cgdmax  7    4    85p
Rcgd    7    4    10meg
Dgd     6    4    DGD
Rdgd    4    6    10meg
.MODEL     DGD    D(M=0.53   CJO=85p   VJ=0.12)
M3      7    9    1    1   INTER
E3      9    1    4    1   -2
.ENDS 2N7002
