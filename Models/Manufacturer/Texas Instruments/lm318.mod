* LM318 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 09/08/89 at 08:27
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt LM318    1 2 3 4 5
*
  c1   11 12 8.50E-12
  c2    6  7 25.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 1.697E6 -2E6 2E6 2E6 -2E6
  ga	6  0 11 12 2.474E-3
  gcm   0  6 10 99 13.25E-9
  iee  10  4 dc 1.750E-3
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   3 11 424.4
  rc2   3 12 424.4
  re1  13 10 394.7
  re2  14 10 394.7
  ree  10 99 114.3E3
  ro1   8  5 50
  ro2   7 99 50
  rp    3  4 9.231E3
  vb    9  0 dc 0
  vc    3 53 dc 2.700
  ve   54  4 dc 2.700
  vlim  7  8 dc 0
  vlp  91  0 dc 21
  vln   0 92 dc 21
.model dx D(Is=800.0E-18)
.model qx NPN(Is=800.0E-18 Bf=5.833E3)
.ends
