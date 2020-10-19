;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  $Id: mulsuboct.bal 1.1 $
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  Format string for PRF command
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LOC 20
"%d * %d = %ld\n"	; fmt:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Main program calling JMS multiply
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LOC 100
KDN 6	; main:	; Enter multiplicand xx
JZR 113		;   quit program if zero
KDN 7		; Enter mmultiplyer  yy
JMS 200	; multiply
ADR 6		; xx
ADR 7		; yy
PRF 20	; fmt	; print "xx * yy = result\n"
ADR 6		; xx
ADR 7		; yy
ADR 0		; ACC (adr 0 and 1)
JMP 100
HLT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Simple multiply subroutine using rotate right of the multiplyer and
;  repeated addition of the left shifted multiplicand for every bit of
;  the multiplyer
;  JMS 200
;  ADR xx	; address of single precision multiplier
;  ADR yy	; address of single precision multiplicand
;  next		; double precision result in ACC (adr 0 and 1)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LOC 200
0	; multiply:	; return address
LDA @200
INC 200
LDA @0
STA 2		; loc 2 lo part of multiplicand
CLR 3		; loc 3 hi part of multiplicand (filled during left shift)
LDA @200
INC 200
LDA @0
STA 4		; loc 4 multiplyer
CLR 0		; ACC   lo part of result
CLR 1		; loc 1 hi part of result
TST 4	; loop:   is multiplyer all 0's ?
JZR @200	; yes - return
CLR 777
ROR 4
JZC 230	; skip:
CLR 777
ADD 2
STA 5		; save ACC
LDA 1
ADD 3		; add shifted hi part to hi result
STA 1
LDA 5		; restore ACC
CLR 777	; skip:
ROL 2
ROL 3		; double precision shift left of multiplicand
JMP 214	; loop
