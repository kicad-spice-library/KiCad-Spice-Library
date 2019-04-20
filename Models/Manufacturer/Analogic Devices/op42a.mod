* OP-42A SPICE Macro-model                  12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 4E-11 to 2E-11
*
*
* This version of the OP-42 model simulates the worst case 
* parameters of the 'A' grade.  The worst case parameters
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
*              non-inverting input
*              | inverting input
*              | | positive supply
*              | | |  negative supply
*              | | |  |  output
*              | | |  |  |
.SUBCKT OP-42A 1 2 99 50 32
*
* INPUT STAGE & POLE AT 15.9 MHZ
*
R1   1  3     5E11
R2   2  3     5E11
R3   5 50     636.63
R4   6 50     636.63
CIN  1  2     5E-12
C2   5  6     7.9E-12
I1  99  4     1E-3
IOS  1  2     2E-11
EOS  7  1     POLY(1)  20 26  1E-3  1
J1   5  2  4  JX
J2   6  7  4  JX
*
* SECOND STAGE & POLE AT 45 HZ
*
R5   9 99     63.663E6
R6   9 50     63.663E6
C3   9 99     22.222E-12
C4   9 50     22.222E-12
G1  99  9     POLY(1)  5  6  4.76E-3  1.571E-3
G2   9 50     POLY(1)  6  5  4.76E-3  1.571E-3
V2  99  8     3.582
V3  10 50     3.582
D1   9  8     DX
D2  10  9     DX
*
* POLE-ZERO PAIR AT 1.80 MHZ / 2.20 MHZ
*
R7  11 99     1E6
R8  11 50     1E6
R9  11 12     4.5E6
R10 11 13     4.5E6
C5  12 99     16.1E-15
C6  13 50     16.1E-15
G3  99 11     9  26  1E-6
G4  11 50     26  9  1E-6
*
* POLE-ZERO PAIR AT 1.80 MHZ / 2.20 MHZ
*
R11 14 99     1E6
R12 14 50     1E6
R13 14 15     4.5E6
R14 14 16     4.5E6
C7  15 99     16.1E-15
C8  16 50     16.1E-15
G5  99 14     11 26  1E-6
G6  14 50     26 11  1E-6
*
* POLE AT 53 MHZ
*
R15 17 99     1E6
R16 17 50     1E6
C9  17 99     3E-15
C10 17 50     3E-15
G7  99 17     14 26  1E-6
G8  17 50     26 14  1E-6
*
* POLE AT 53 MHZ
*
R17 18 99     1E6
R18 18 50     1E6
C11 18 99     3E-15
C12 18 50     3E-15
G9  99 18     17 26  1E-6
G10 18 50     26 17  1E-6
*
* POLE AT 53 MHZ
*
R19 19 99     1E6
R20 19 50     1E6
C13 19 99     3E-15
C14 19 50     3E-15
G11 99 19     18 26  1E-6
G12 19 50     26 18  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 317 KHZ
*
R21 20 21     1E6	
R22 20 23     1E6
L1  21 99     0.5017
L2  23 50     0.5017
G13 99 20     3  26  5.012E-11
G14 20 50     26  3  5.012E-11
*
* POLE AT 79.6 MHZ
*
R24 25 99     1E6
R25 25 50     1E6
C15 25 99     2E-15
C16 25 50     2E-15
G15 99 25     19 26  1E-6
G16 25 50     26 19  1E-6
*
* OUTPUT STAGE
*
R26 26 99     111.1E3
R27 26 50     111.1E3
R28 27 99     90
R29 27 50     90
L3  27 32     2.5E-7
G17 30 50     25 27  11.1111E-3
G18 31 50     27 25  11.1111E-3
G19 27 99     99 25  11.1111E-3
G20 50 27     25 50  11.1111E-3
V6  28 27     0.2
V7  27 29     0.2
D5  25 28     DX
D6  29 25     DX
D7  99 30     DX
D8  99 31     DX
D9  50 30     DY
D10 50 31     DY
*
* MODELS USED
*
.MODEL JX PJF(BETA=1.245E-3  VTO=-2.000  IS=2E-10)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-42A
