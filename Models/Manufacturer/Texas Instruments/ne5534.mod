* NE5534 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 04/10/89 at 12:41
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |  compensation
*                | | | | | / \
.subckt NE5534   1 2 3 4 5 6 7
*
  c1   11 12 7.703E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 2.893E6 -3E6 3E6 3E6 -3E6
  ga    6  0 11 12 1.382E-3
  gcm   0  6 10 99 13.82E-9
  iee  10  4 dc 133.0E-6
  hlim 90  0 vlim 1K
  q1   11  2 13 qx
  q2   12  1 14 qx
  r2    6  9 100.0E3
  rc1   3 11 723.3
  rc2   3 12 723.3
  re1  13 10 329
  re2  14 10 329
  ree  10 99 1.504E6
  ro1   8  5 50
  ro2   7 99 25
  rp    3  4 7.757E3
  vb    9  0 dc 0
  vc    3 53 dc 2.700
  ve   54  4 dc 2.700
  vlim  7  8 dc 0
  vlp  91  0 dc 38
  vln   0 92 dc 38
.model dx D(Is=800.0E-18)
.model qx NPN(Is=800.0E-18 Bf=132)
.ends
