* TL060 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 09/22/89 at 13:08
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |  compensation
*                | | | | | / \
.subckt TL060    1 2 3 4 5 6 7
*
  c1   11 12 2.332E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 477.4E3 -500E3 500E3 500E3 -500E3
  ga    6  0 11 12 62.84E-6
  gcm	0  6 10 99 2.178E-9
  iss   3 10 dc 35.00E-6
  hlim 90  0 vlim 1K
  j1   11  2 10 jx
  j2   12  1 10 jx
  r2    6  9 100.0E3
  rd1   4 11 15.91E3
  rd2   4 12 15.91E3
  ro1   8  5 200
  ro2   7 99 200
  rp    3  4 150.0E3
  rss  10 99 5.714E6
  vb    9  0 dc 0
  vc	3 53 dc 2.130
  ve   54  4 dc 2.130
  vlim  7  8 dc 0
  vlp  91  0 dc 15
  vln   0 92 dc 15
.model dx D(Is=800.0E-18)
.model jx PJF(Is=15.00E-12 Beta=64E-6 Vto=-1)
.ends
