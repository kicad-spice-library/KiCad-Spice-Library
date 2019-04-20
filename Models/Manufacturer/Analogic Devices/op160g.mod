* OP-160G SPICE Macro-model                 12/90, Rev. B   
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*
*
* This version of the OP-160 model simulates the worst case 
* parameters of the 'G' grade.  The worst case parameters
* used correspond to those in the data book.
*
*
* Copyright 1990 by Analog Devices, Inc.
*
* The information on this diskette is protected under the
* United States copyright laws.  Analog Devices, Inc.("ADI")
* hereby grants users of these macro-models hereto referred
* to as licensee, a nonexclusive, nontransferable license to
* use these macro-models as long as the licensee abides by
* the terms of this agreement.  Before using the macro-
* models the licensee should read this license.  If the
* licensee does not accept these terms, this diskette should
* be returned to ADI within 30 days.
*
* The licensee may not sell, load, rent, lease, or license
* the macro-models, in whole, in part, or in modified form,
* to anyone outside the licensee's company.  The licensee
* may modify these macro-models to suit his specific
* applications, and the licensee may make copies of this 
* diskette or macromodels for use within his company only.
*
* These macro-models are provided "AS IS, WHERE IS, AND WITH
* NO WARRANTY OF ANY KIND EITHER EXPRESSED OR IMPLIED, 
* INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES OF
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE."
* In no event will ADI be liable for special, collateral,
* incidental, or consequential damages in connection with or
* arising out of the use of these macro-models.  ADI
* reserves the right to make changes to the products and the
* macro-models without prior notice.
*
*
* Node assignments
*                non-inverting input
*                | inverting input
*                | | positive supply
*                | | |  negative supply
*                | | |  |  output
*                | | |  |  |
.SUBCKT OP-160G  1 2 99 50 28
*
* INPUT STAGE
*
R1   99  8     1K
R2   10 50     1K 
V1   99  9     4.2
D1   9   8     DX
V2   11 50     4.2
D2   10 11     DX
I1   99  5     175U
I2   4  50     175U
Q1   50  3  5  QP 
Q2   99  3  4  QN 
Q3   8   6 30  QN
Q4   10  7 30  QP 
R3   5   6     300K
R4   4   7     300K
C1   99  6     0.0133P
C2   50  7     0.0133P
*
* INPUT ERROR SOURCES
* 
GB1  99  1     POLY(1)  1  22  1.5E-6  125E-8
GB2  99 30     POLY(1)  1  22  3E-5  125E-8
VOS  3   1     5E-3
LS1  30  2     1E-6
CS1  99  2     1.5E-12
CS2  50  2     1.5E-12
*
EREF 97  0     22  0  1
*
* GAIN STAGE & DOMINANT POLE
*
R5   12 97     3E6
C3   12 97     6P
G1   97 12     99  8  1E-3
G2   12 97     10 50  1E-3
V3   99 13     4.2
V4   14 50     4.2
D3   12 13     DX
D4   14 12     DX
CF   29 28     30p
RF   12 29     300
*
* ZERO / POLE PAIR AT 50 MHZ / 300 MHZ
*
R6  15 16     1E6
L1  16 97     2.65E-3
R7  16 97     5E6
G3  97 15     12 22  1E-6
*
* POLE AT 300 MHZ
*
R8  17 97     1E6
C4  17 97     0.531E-15
G4  97 17     15 22  1E-6
*
* POLE AT 300 MHZ
*
R9  18 97     1E6
C5  18 97     0.531E-15
G5  97 18     17 22  1E-6
*
* POLE AT 500 MHZ
*
R10 19 97     1E6
C6  19 97     0.318E-15
G6  97 19     18 22  1E-6
*
* POLE AT 500 MHZ
*
R11 20 97     1E6
C7  20 97     0.318E-15
G7  97 20     19 22  1E-6
*
* POLE AT 500 MHZ
*
R12 21 97     1E6
C8  21 97     0.318E-15
G8  97 21     20 22  1E-6
*
* OUTPUT STAGE
*
ISY 99 50     3.15E-3
R13 22 99     3.333E3
R14 22 50     3.333E3
R15 27 99     40
R16 27 50     40
L2  27 28     4E-8
G9  25 50     21 27  25E-3
G10 26 50     27 21  25E-3
G11 27 99     99 21  25E-3
G12 50 27     21 50  25E-3
V5  23 27     0
V6  27 24     0
D5  21 23     DX
D6  24 21     DX
D7  99 25     DX
D8  99 26     DX
D9  50 25     DY
D10 50 26     DY
*
* MODELS USED
*
.MODEL QN   NPN(BF=1E9 IS=1E-15 VAF=51.6)
.MODEL QP   PNP(BF=1E9 IS=1E-15 VAF=51.6)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-160G
