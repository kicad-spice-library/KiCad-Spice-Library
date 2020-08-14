** Math.inc

.func deadb(x,y,z,b) {if((min(y,z)<x)&(x<max(y,z)),b,x)}

.func trunc(x) {if(x<0,ceil(x),floor(x))}

.func mode(x,y) {x-y*sgn(y)*floor(x/abs(y))}
.func modf(x,y) {x-y*floor(x/y)}
.func modr(x,y) {x-y*round(x/y)}
.func modt(x,y) {x-y*trunc(x/y)}
.func modrf(x,y) {x-y*floor(x/y+0.5)}

.func intq(x) {x<=floor(x)}

.func bitlsh(x,b) {floor(x*(2**b))}
.func bitrsh(x,b) {floor(x/(2**b))}
.func bittst(x,b) {inv(intq(bitrsh(x,b)/2))}
.func bitset(x,b) {if(bittst(x,b),x,x+2**b)}
.func bitclr(x,b) {if(bittst(x,b),x-2**b,x)}
.func bitinv(x,b) {if(bittst(x,b),x-2**b,x+2**b)}

.func int8(x) {round(modrf(int(x),256))}
.func uint8(x) {round(modf(int(x),256))}

.func inv8(x) {
+  (inv(bittst(x,0)))
+ +(inv(bittst(x,1)))*2
+ +(inv(bittst(x,2)))*4
+ +(inv(bittst(x,3)))*8
+ +(inv(bittst(x,4)))*16
+ +(inv(bittst(x,5)))*32
+ +(inv(bittst(x,6)))*64
+ +(inv(bittst(x,7)))*128
+ }

.func and8(x,y) {
+  (bittst(x,0)&bittst(y,0))
+ +(bittst(x,1)&bittst(y,1))*2
+ +(bittst(x,2)&bittst(y,2))*4
+ +(bittst(x,3)&bittst(y,3))*8
+ +(bittst(x,4)&bittst(y,4))*16
+ +(bittst(x,5)&bittst(y,5))*32
+ +(bittst(x,6)&bittst(y,6))*64
+ +(bittst(x,7)&bittst(y,7))*128
+ }

.func or8(x,y) {
+  (bittst(x,0)|bittst(y,0))
+ +(bittst(x,1)|bittst(y,1))*2
+ +(bittst(x,2)|bittst(y,2))*4
+ +(bittst(x,3)|bittst(y,3))*8
+ +(bittst(x,4)|bittst(y,4))*16
+ +(bittst(x,5)|bittst(y,5))*32
+ +(bittst(x,6)|bittst(y,6))*64
+ +(bittst(x,7)|bittst(y,7))*128
+ }

.func xor8(x,y) {
+  (bittst(x,0)^bittst(y,0))
+ +(bittst(x,1)^bittst(y,1))*2
+ +(bittst(x,2)^bittst(y,2))*4
+ +(bittst(x,3)^bittst(y,3))*8
+ +(bittst(x,4)^bittst(y,4))*16
+ +(bittst(x,5)^bittst(y,5))*32
+ +(bittst(x,6)^bittst(y,6))*64
+ +(bittst(x,7)^bittst(y,7))*128
+ }
