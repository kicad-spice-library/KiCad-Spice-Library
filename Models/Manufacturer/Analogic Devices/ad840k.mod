* AD-840K SPICE Macro-model                 1/91, Rev. A   
*                                           AAG / PMI
*
* This version of the AD-840 model simulates the worst case 
* parameters of the 'K' grade.  The worst case parameters
* used correspond to those in the data sheet.
*
* Copyright 1991 by Analog Devices, Inc.
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
*              | | |   negative supply
*              | | |   |   output
*              | | |   |   |
.SUBCKT AD-840K 1 2 100 101 36
*
* INPUT STAGE & POLE AT 120 MHz
*
IOS	1	2	DC	0.1U
CIN	1	2	2P
R1	1	3	5.172K
R2	2	3	5.172K
EOS	9	1	POLY(1)	16	11	300U	1
R3	100	5	195.46
R4	100	6	195.46
C2	5	6	3.3927P
R5	7	4	143.74
R6	8	4	143.74
Q1	5	2	7	QX
Q2	6	9	8	QX
I1	4	101	DC	1E-3
*
*	VIRTUAL NODE
*
RVN1	100	10	25K
RVN2	10	101	25K
*
* GAIN STAGE & DOMINANT POLE AT 2.85 KHz
*
EREF	11	0	10	0	1
G1	11	12	5	6	5.1161E-3
R7	12	11	19.546MEG
C3	12	11	2.857P
V1	100	13	DC	5.0875
D1	12	13	DX
V2	14	101	DC	5.0875
D2	14	12	DX
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 31.7 KHz
*
ECM	15	11	3	11	5.0119
RCM1	15	16	1E6
CCM	15	16	5.0207P
RCM2	16	11	1
*
* NEGATIVE ZERO STAGE AT 290 MHz
*
EZ1	17	11	12	11	1E6
RZ1	17	18	1
CZ1	17	18	-548.81P
RZ2	18	11	1E-6
*
* POLE STAGE AT 500 MHz
*
GP1	11	19	18	11	1E-6
RP1	19	11	1E6
CP1	19	11	318.31E-18
*
* OUTPUT STAGE
*
IDC	100	101	DC	10.4M
VX	19	30
V3	32	35	DC	2.725
D3	30	32	DX
V4	35	33	DC	2.575
D4	33	30	DX
D5	100	31	DX
GO1	31	101	30	35	16.667E-3
D6	101	31	DY
D7	100	34	DX
GO2	34	101	35	30	16.667E-3
D8	101	34	DY
RO1	100	35	60
GO3	35	100	100	30	16.667E-3
RO2	35	101	60
GO4	101	35	30	101	16.667E-3
LO	35	36	0.04U
*
* MODELS USED
*
.MODEL QX NPN(BF=100)
.MODEL DX D(IS=1E-15)
.MODEL DY D(IS=1E-15 BV=50)
.ENDS AD-840K
