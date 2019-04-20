* UA747 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 07/05/89 at 09:09
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt UA747	 1 2 3 4 5
*
  c1   11 12 4.664E-12
  c2    6  7 20.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 10.61E6 -10E6 10E6 10E6 -10E6
  ga	6  0 11 12 137.7E-6
  gcm	0  6 10 99 2.574E-9
  iee  10  4 dc 10.16E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   3 11 7.957E3
  rc2   3 12 7.957E3
  re1  13 10 2.740E3
  re2  14 10 2.740E3
  ree  10 99 19.69E6
  ro1   8  5 150
  ro2   7 99 150
  rp    3  4 18.11E3
  vb    9  0 dc 0
  vc	3 53 dc 2.600
  ve   54  4 dc 2.600
  vlim  7  8 dc 0
  vlp  91  0 dc 25
  vln   0 92 dc 25
.model dx D(Is=800.0E-18)
.model qx NPN(Is=800.0E-18 Bf=62.50)
.ends
