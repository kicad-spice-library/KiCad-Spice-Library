* (C) National Semiconductor, Inc.
* Models developed and under copyright by:
* National Semiconductor, Inc.
*
*/////////////////////////////////////////////////////////////////////
* Legal Notice: This material is intended for free software support.
* The file may be copied, and distributed; however, reselling the
*  material is illegal
*
*////////////////////////////////////////////////////////////////////
* For ordering or technical information on these models, contact:
* National Semiconductor's Customer Response Center
*                 7:00 A.M.--7:00 P.M.  U.S. Central Time
*                                (800) 272-9959
* For Applications support, contact the Internet address:
*  amps-apps@galaxy.nsc.com
*/////////////////////////////////////////
*LMV321  BICMOS  Low Voltage General Purpose Op Amp
* MODEL FORMAT: PSPICE
* Rev:  11/07/97 -- ABG
*/////////////////////////////////////////
* Connections       non-inverting input
*                   |  inverting input
*                   |  |  positive power supply
*                   |  |  |  negative power supply
*                   |  |  |  |  output
*                   |  |  |  |  |
.SUBCKT  LMV321     3  2  4  5  6
* Features:
* 2.7V and 5V Operation
* Low Supply Current:  130uA at VCC=5V
* Stable for AV = +1
*/////////////////////////////////////////
**************************************
EOX 120 10 31 32 2.0
RCX 120 121 1K
RDX 121 10 1K
RBX 120 122 1K
GOS 10 57 122 121 1.0
RVOS 31 32 1K
RINB 2 18 1000
RINA 3 19 1000
DIN1 5 18 DMOD2
DIN2 18 4 DMOD2
DIN3 5 19 DMOD2
DIN4 19 4 DMOD2
EXX 10 5 17 5 1.0
EEE 10 50 17 5 1.0
ECC 40 10 4 17 1.0
RAA 4 17 100MEG
RBB 17 5 100MEG
ISET 10 24 1e-3
DA1 24 23 DMOD1
RBAL 23 22 1000
ESUPP 22 21 4 5 1.0
VOFF 21 10 -1.25
DA2 24 25 DMOD1
VSENS1 25 26 DC 0
RSET 26 10 1K
CSET 26 10 1e-10
FSET 10 31 VSENS1 1.0
R001 34 10 1K
FTEMP 10 27 VSENS1 1.0
DTA 27 10 DMOD2
DTB 28 29 DMOD2
VTEMP 29 10 DC 0
ECMR 38 10 11 10 1.0
VCMX 38 39 DC 0
RCM2 41 10 1MEG
EPSR 42 10 4 10 1.0
CDC1 43 42 10U
VPSX 43 44 DC 0
RPSR2 45 10 1MEG
FCXX 57 10 VCXX 100
DCX1 98 97 DMOD1
DCX2 95 94 DMOD1
RCX1 99 98 100
RCX2 94 99 100
VCXX 99 96 DC 0
ECMX 96 10 11 10 1.0
DLIM1 52 57 DMOD1
DLIM2 57 51 DMOD1
ELIMP 51 10 26 10 99.3
GDM 10 57 3 2 1
C1 58 59 1e-10
DCLMP2 59 40 DMOD1
DCLMP1 50 59 DMOD1
RO2 59 10 1K
GO3 10 71 59 10 1
RO3 71 10 1
DDN1 73 74 DMOD1
DDN2 73 710 DMOD1
DDP1 75 72 DMOD1
DDP2 71 720 DMOD1
RDN2 710 71 100
RDP 720 72 100
VOOP 40 76 DC 0
VOON 77 50 DC 0
QNO 76 73 78 NPN1
QNP 77 72 79 PNP1
RNO 78 81 1
RPO 79 81 1
VOX 86 6 DC 0
RNT 76 81 100MEG
RPT 81 77 1MEG
FX 10 93 VOX 1.0
DFX1 93 91 DMOD1
VFX1 91 10 DC 0
DFX2 92 93 DMOD1
VFX2 10 92 DC 0
FPX 4 10 VFX1 1.0
FNX 10 5 VFX2 1.0
RAX 122 10 MRAX 1.014000e+03
* Input Offset Voltage
.MODEL MRAX RES (TC1=1e-05)
FIN1 18 5 VTEMP 0.833333
FIN2 19 5 VTEMP 1.16667
* Input Bias Currents
CIN1 2 10 1e-12
CIN2 3 10 1e-12
* Common Mode Input Capacitance
RD1 18 11 5e+08
RD2 19 11 5e+08
* Diff. Input Resistance
RCM 11 10 9.75e+09
* Common Mode Input Resistance
FCMR 10 57 VCMX 562.341
* Low Freq. CMRR
FPSR 10 57 VPSX 2000
* Low Freq. PSRR
RSLOPE 4 5 1e+12
* Slope of Supp. Curr. vs. Supp. Volt.
GPWR 4 5 26 10 0.00013
* Quiescent Supply Current
ETEMP 27 28 32 33 0.286906
RIB 32 33 MRIB 1K
* Temp. Co. of Input Currents
.MODEL MRIB RES (TC1=0.00283713)
RISC 33 34 MRISC 1K
.MODEL MRISC RES (TC1=-0.003)
RCM1 39 41 17782.8
CCM 41 10 5.30516e-12
* CMRR vs. Freq.
RPSR1 44 45 10000
CPSR 45 10 5.30516e-11
* PSRR vs. Freq.
ELIMN 10 52 26 10 99.3
RDM 57 10 725.52
C2 57 10 1.09683e-10
ECMP 40 97 26 10 0.8
ECMN 95 50 26 10 0.2
G2 58 10 57 10 1e-06
R2 58 10 1378.32
GO2 59 10 58 10 100
* Avol and Slew-Rate Settings
EPOS 40 74 26 10 0
ENEG 75 50 26 10 0.01
* Output Voltage Swing Settings
GSOURCE 74 73 33 34 0.0006
GSINK 72 75 33 34 0.0016
* Output Current Settings
ROO 81 86 8.5
.MODEL DMOD1 D
.MODEL DMOD2 D  (IS=1e-17)
.MODEL NPN1 NPN (BF=100 IS=1e-15)
.MODEL PNP1 PNP (BF=100 IS=1e-15)
.ENDS lmv321
