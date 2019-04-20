* TLC27M7 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 06/02/89 at 12:57
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt TLC27M7  1 2 3 4 5
*
  c1   11 12 12.044E-12
  c2    6  7 15.00E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 38.14E6 -40E6 40E6 40E6 -40E6
  ga    6  0 11 12 84.83E-6
  gcm   0  6 10 99 1.693E-9
  iss   3 10 dc 8.400E-6
  hlim 90  0 vlim 1K
  j1   11  2 10 jx
  j2   12  1 10 jx
  r2    6  9 100.0E3
  rd1   4 11 11.79E3
  rd2   4 12 11.79E3
  ro1   8  5 85
  ro2   7 99 85
  rp    3  4 69.93E3
  rss  10 99 23.81E6
  vb    9  0 dc 0
  vc    3 53 dc 2
  ve   54  4 dc .7
  vlim  7  8 dc 0
  vlp  91  0 dc 20
  vln   0 92 dc 20
.model dx D(Is=800.0E-18)
.model jx PJF(Is=50.00E-15 Beta=475E-6 Vto=0)
.ends
