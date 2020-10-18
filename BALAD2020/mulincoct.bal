LOC 20
"%d * %d = %ld\n"

LOC 100
KDN 10
JZR 113
KDN 11
JMS 200		; multiply
ADR 10
ADR 11
PRF 20		; print "xx * yy = result\n"
ADR 10		; xx
ADR 11		; yy
ADR 0		; ACC (adr 0 and 1)
JMP 100
HLT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Simple multiply subroutine using decrement of multiplyer and
;  repeated addition of multiplicand until multiplyer is zero
;  JMS 200
;  ADR xx	; address of single precision multiplier
;  ADR yy	; address of single precision multiplicand
;  next		; double precision result in ACC (adr 0 and 1)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LOC 200
0		; return address
LDA @200
INC 200
LDA @0
STA 2
LDA @200
INC 200
LDA @0
STA 3
CLR 0
CLR 1
TST 2
JZR @200
CLR 777
ADD 2
JZC 221
INC 1
DEC 3
JNR 215
JMP @200
