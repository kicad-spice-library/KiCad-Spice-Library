* OP-200E SPICE Macro-model                 12/90, Rev. B
*                                           AAG / PMI
*
* Revision History:
*     Re-ordered subcircuit call out nodes to put the 
*     output node last.
*     Changed Ios from 1E-9 to 5E-10
*
* This version of the OP-200 model simulates the worst case 
* parameters of the 'E' grade.  The worst case parameters
* used correspond to those in the data sheet.
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
* Node assignments
*               non-inverting input
*               | inverting input
*               | | positive supply
*               | | |   negative supply
*               | | |   |   output
*               | | |   |   |
.SUBCKT OP-200E 1 2 100 101 29
*
* INPUT STAGE & POLE AT 4.5 MHZ
*
RI1	2	9	1K
RI2	1	10	1K
IOS	10	9	0.5N
CIN	9	10	3.2P
R1	9	3	13MEG
R2	3	10	13MEG
D1	10	9	DX
D2	9	10	DX
R3	100	5	517.2
R4	100	6	517.2
C2	5	6	34.192P
EOS	11	10	POLY(1)	20	23	75U	1
Q1	5	9	4	QX
Q2	6	11	4	QX
I1	4	101	0.1M
*
* FIRST GAIN STAGE
*
EREF	12	0	23	0	1
G1	12	13	5	6	117.81
R5	13	12	1
E1	100	14	POLY(1)	100	23	-2.4	1
D3	13	14	DX
E2	15	101	POLY(1)	23	101	-2.4	1
D4	15	13	DX
*
* SECOND GAIN STAGE & DOMINANT POLE AT 0.3125 HZ
*
G2	12	16	13	23	33.33U
R6	16	12	509.29MEG
C3	16	12	1000P
V1	100	17	DC	3.9725
D5	16	17	DX
V2	18	101	DC	3.9725
D6	18	16	DX
*
* COMMON-MODE GAIN NETWORK WITH ZERO AT 112.47 HZ
*
ECM	19	12	3	23	1
R7	19	20	1MEG
R8	20	12	1
C4	19	20	1.4151N
*
* POLE AT 4.5 MHZ
*
G3	12	21	16	23	1U
R9	21	12	1MEG
C5	21	12	35.368F
*
* POLE AT 4.5 MHZ
*
G4	12	22	21	23	1U
R10	22	12	1MEG
C6	22	12	35.368F
*
* OUTPUT STAGE
*
R11	100	23	533.33K
R12	23	101	533.33K
IDC	100	101	DC	597U
V3	25	28	DC	2.15
D7	22	25	DX
V4	28	26	DC	2.275
D8	26	22	DX
D9	100	24	DX
D10	100	27	DX
G5	24	101	22	28	4M
D11	101	24	DY
G6	27	101	28	22	4M
D12	101	27	DY
G7	28	100	100	22	4M
R13	100	28	250
G8	101	28	22	101	4M
R14	28	101	250
L1	28	29	0.7U
*
* MODELS USED
*
.MODEL QX NPN(BF=25000)
.MODEL DX D(IS=1E-15)
.MODEL DY D(IS=1E-15 BV=50)
.ENDS OP-200E
