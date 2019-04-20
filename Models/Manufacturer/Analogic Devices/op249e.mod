* OP-249E SPICE Macro-model                 12/90, Rev. B
*                                           JCB / PMI
*
* Revision History:
*   REV. B
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 15E-12 to 7.5E-12
*
*
* This version of the OP-249 model simulates the worst case 
* parameters of the 'E' grade.  The worst case parameters
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
.SUBCKT OP-249E  1 2 99 50 30
*
* INPUT STAGE & POLE AT 100 MHZ
*
R1   1  3     5E11
R2   2  3     5E11
R3   5 50     469.3
R4   6 50     469.3
CIN  1  2     5E-12
C2   5  6     1.7E-12
I1  99  4     1E-3
IOS  1  2     7.5E-12
EOS  7  1     POLY(1)  20 24  300E-6  1
J1   5  2  4  JX
J2   6  7  4  JX
*
* SECOND STAGE & POLE AT 6.1 HZ
*
R5   9 99     469.3E6
R6   9 50     469.3E6
C3   9 99     55.6E-12
C4   9 50     55.6E-12
G1  99  9     POLY(1)  5  6  5.65E-3  2.131E-3
G2   9 50     POLY(1)  6  5  5.65E-3  2.131E-3
V2  99  8     3.4
V3  10 50     3.4
D1   9  8     DX
D2  10  9     DX
*
* POLE-ZERO PAIR AT 2 MHZ / 4.0 MHZ
*
R7  11 99     1E6
R8  11 50     1E6
R9  11 12     1E6
R10 11 13     1E6
C5  12 99     39.79E-15
C6  13 50     39.79E-15
G3  99 11     9  24  1E-6
G4  11 50     24  9  1E-6
*
* ZERO-POLE PAIR AT 4 MHZ / 8 MHZ
*
R11 99 15     1E6
R12 14 15     1E6
R13 14 16     1E6
R14 50 16     1E6
L1  99 15     19.89E-3
L2  50 16     19.89E-3
G5  99 14     11 24  1E-6
G6  14 50     24 11  1E-6
*
* POLE AT 20 MHZ
*
R15 17 99     1E6
R16 17 50     1E6
C9  17 99     7.96E-15
C10 17 50     7.96E-15
G7  99 17     14 24  1E-6
G8  17 50     24 14  1E-6
*
* POLE AT 50 MHZ
*
R17 18 99     1E6
R18 18 50     1E6
C11 18 99     3.18E-15
C12 18 50     3.18E-15
G9  99 18     17 24  1E-6
G10 18 50     24 17  1E-6
*
* POLE AT 50 MHZ
*
R19 19 99     1E6
R20 19 50     1E6
C13 19 99     3.18E-15
C14 19 50     3.18E-15
G11 99 19     18 24  1E-6
G12 19 50     24 18  1E-6
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 95 KHZ
*
R21 20 21     1E6
R22 20 22     1E6
L3  21 99     1.67
L4  22 50     1.67
G13 99 20     3  24  50E-12
G14 20 50     24  3  50E-12
*
* POLE AT 50 MHZ
*
R23 23 99     1E6
R24 23 50     1E6
C15 23 99     3.18E-15
C16 23 50     3.18E-15
G15 99 23     19 24  1E-6
G16 23 50     24 19  1E-6
*
* OUTPUT STAGE
*
R25 24 99     135E3
R26 24 50     135E3
R27 29 99     70
R28 29 50     70
L5  29 30     4E-7
G17 27 50     23 29  14.3E-3
G18 28 50     29 23  14.3E-3
G19 29 99     99 23  14.3E-3
G20 50 29     23 50  14.3E-3
V4  25 29     .1
V5  29 26     .1
D3  23 25     DX
D4  26 23     DX
D5  99 27     DX
D6  99 28     DX
D7  50 27     DY
D8  50 28     DY
*
* MODELS USED
*
.MODEL JX PJF(BETA=2.27E-3  VTO=-2.000  IS=50E-12)
.MODEL DX   D(IS=1E-15)
.MODEL DY   D(IS=1E-15 BV=50)
.ENDS OP-249E