* ISO130X   SIMPLIFIED CIRCUIT MODEL
* CREATED   12/19/94  SB
* REV. A
*
*  ------------------------------------------------------------------------ 
* |  NOTICE: THE INFORMATION PROVIDED HEREIN IS BELIEVED TO BE RELIABLE;   |
* |  HOWEVER; BURR-BROWN ASSUMES NO RESPONSIBILITY FOR INACCURACIES OR     |
* |  OMISSIONS.  BURR-BROWN ASSUMES NO RESPONSIBILITY FOR THE USE OF THIS  |
* |  INFORMATION, AND ALL USE OF SUCH INFORMATION SHALL BE ENTIRELY AT     |
* |  THE USER'S OWN RISK.  NO PATENT RIGHTS OR LICENSES TO ANY OF THE      |
* |  CIRCUITS DESCRIBED HEREIN ARE IMPLIED OR GRANTED TO ANY THIRD PARTY.  |
* |  BURR-BROWN DOES NOT AUTHORIZE OR WARRANT ANY BURR-BROWN PRODUCT FOR   |
* |  USE IN LIFE-SUPPORT DEVICES AND/OR SYSTEMS.                           |
*  ------------------------------------------------------------------------ 
*
* CONNECTIONS:   VS1
*                |  VIN+
*                |  |  VIN-
*                |  |  |  GND1
*                |  |  |  |  GND2
*                |  |  |  |  |  VOUT-
*                |  |  |  |  |  |  VOUT+
*                |  |  |  |  |  |  |  VS2
.SUBCKT ISO130X  1  2  3  4  5  6  7  8
*
* INPUT STAGE
*
D1   2    1   DMOD
D2   3    1   DMOD
R1   2    9   530
R2   3    10  530
D3   4    9   DMOD
D4   4    10  DMOD
R3   4    9   530k
R4   4    10  530k
I1   4    9   670n
I2   4    10  670n
GVS1 1    4   POLY(1) (22,23) 4.37M 0 -445U 0 69.1U 0 -6.34U
R5   1    4   790
*
E1   11   5   POLY(1) (9,10) -3.6M 4
V2   13   11  2.395
V3   12   5   3.61
Q1   13   11  14   QMOD
Q2   17   5   16   QMOD
RE1  14   15  31k
RE2  15   16  31k
I3   15   5   37.356U
R6   12   17  65.7k
TDELAY 17 5 18 5 Z0=65.7k TD=970n
C1   18   5   6.3p
R7   18   19  65.7k
C2   19   5   6.3p
R8   19   20  52.7k
C3   20   22  15.2p
R9   20   21  52.7k
C4   21   5   6.52p
E2   22   5  21  5  1
E3   23   5   POLY(1) (22,5) 4.79 -1
R10  22   7   11
R11  23   6   11            
R12  8    5   2.2k
GVS2 8    5   POLY(1) (22,23) 8.71M 145U 189U -1.22U -15.8U -127N 1.43U
.MODEL  DMOD  D  IS=8E-13
.MODEL  QMOD  NPN
.ENDS ISO130X
