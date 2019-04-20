* TLE2161 operational amplifier "macromodel" subcircuit
* created using Parts release 4.01 on 07/08/89 at 16:18
* (REV N/A)
* connections:   non-inverting input
*                | inverting input
*                | | positive power supply
*                | | | negative power supply
*                | | | | output
*                | | | | |
.subckt TLE2161  1 2 3 4 5
*
  c1   11 12 125.4E-14
  c2    6  7 5.000E-12
  dc    5 53 dx
  de   54  5 dx
  dlp  90 91 dx
  dln  92 90 dx
  dp    4  3 dx
  egnd 99  0 poly(2) (3,0) (4,0) 0 .5 .5
  fb    7 99 poly(5) vb vc ve vlp vln 0 4.085E6 -4E6 4E6 4E6 -4E6
  ga    6  0 11 12 201.1E-6
  gcm   0  6 10 99 3.576E-9
  iss   3 10 dc 45.00E-6
  hlim 90  0 vlim 1K
  j1   11  2 10 jx
  j2   12  1 10 jx
  r2    6  9 100.0E3
  rd1   4 11 4.973E3
  rd2   4 12 4.973E3
  ro1   8  5 280
  ro2   7 99 280
  rp    3  4 113.2E3
  rss  10 99 4.444E6
  vb    9  0 dc 0
  vc    3 53 dc 2
  ve   54  4 dc 2
  vlim  7  8 dc 0
  vlp  91  0 dc 50
  vln   0 92 dc 50
.model dx D(Is=800.0E-18)
.model jx PJF(Is=1.000E-12 Beta=480E-6 Vto=-1)
.ends
