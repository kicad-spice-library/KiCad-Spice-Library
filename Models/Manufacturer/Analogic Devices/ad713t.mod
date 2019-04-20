* AD713T SPICE Macro-model       		1/91, Rev. A
*								JLW / PMI
*
* This version of the AD713 model simulates the worst case
* parameters of the 'T' grade. The worst case parameters 
* used correspond to those in the device data sheet.
*
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
* connections:  non-inverting input 
*               |  inverting input  
*               |  |  positive supply
*               |  |  |  negative supply
*               |  |  |  |  output
*               |  |  |  |  |
.SUBCKT AD713T 13 15 12 16 14
* 
VOS 15 8 DC 0.5M
EC 9 0 (14,0) 1
C1 6 7 .5P
RP 16 12 10.35K
GB 11 0 (3,0) 1.67K
RD1 6 16 16K
RD2 7 16 16K
ISS 12 1 DC 100U
CCI 3 11 45P
GCM 0 3 (0,1) 1.76N
GA 3 0 (7,6) 780U
RE 1 0 2.5MEG
RGM 3 0 2.6K
VC 12 2 DC 2.8
VE 10 16 DC 3.1
RO1 11 14 25
CE 1 0 2P
RO2 0 11 30
RS1 1 4 5.77K
RS2 1 5 5.77K
J1 6 13 4 FET
J2 7 8 5 FET
DC 14 2 DIODE
DE 10 14 DIODE
DP 16 12 DIODE
D1 9 11 DIODE
D2 11 9 DIODE
IOS 15 13 17.5E-12
.MODEL DIODE D()
.MODEL FET PJF(VTO=-1 BETA=1M IS=75E-12)
.ENDS
