* AD744 SPICE Macro-model       		1/91, Rev. A
*								JLW / PMI
*
* This version of the AD744 model simulates the typical
* parameters that correspond to those in the device data
* sheet.
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
* An external compensation capacitor, connected between the
* compensation terminals in main circuit, is required at low
* gains. A nominal 0.001pF capacitor is supplied in this
* subcircuit.
*
* connections: non-inverting input
*               |  inverting input
*               |  |  positive power supply
*               |  |  |  negative power supply
*               |  |  |  |  output
*               |  |  |  |  |   compensation
*               |  |  |  |  |  / \
.subckt AD744  11 14 10 16 13 12 15
* 
VOS 14 7 DC 0
EC 8 0 (13,0) 1
C1 5 6 0.33P
GB 12 0 (15,0) 1.67K 
RD1 5 16 16K
RD2 6 16 16K
ISS 10 1 DC 100U
GCM 0 15 (0,1) 1.76N
GA 15 0 (6,5) 2.33M
CCE 12 15 0.001P
RE 1 0 2.5MEG
RGM 15 0 1.76K
VC 10 2 DC 2.8
VE 9 16 DC 2.8
RO1 12 13 25
CE 1 0 1P
RO2 0 12 30
RS1 1 3 5.77K
RS2 1 4 5.77K
CCI 15 12 40P
RP 16 10 8.5K
J1 5 11 3 FET
J2 6 7 4 FET
DC 13 2 DIODE
DE 9 13 DIODE
DP 16 10 DIODE
D1 8 12 DIODE
D2 12 8 DIODE
.MODEL DIODE D()
.MODEL FET PJF(VTO=-1 BETA=1M IS=30E-12)
.ENDS
