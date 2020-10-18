;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  mulfunc.bal	J.E. Wulff 11 Oct 2020
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 2		; temporary variables
L2:	0
L3:	0
L4:	0
L5:	0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Simple multiply subroutine using rotate right of the multiplyer and
;  repeated addition of the left shifted multiplicand for every bit of
;  the multiplyer
;  JMS 200
;  ADR xx	; address of single precision multiplicand
;  ADR yy	; address of single precision multiplyer
:  next		; double precision result in ACC (adr 0 and 1)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 200
multiply: 0		; return address
	LDA @multiply
	INC multiply
	LDA @ACC
	STA L2		; lo part of multiplicand
	CLR L3		; hi part of multiplicand (filled during left shift)
	LDA @multiply
	INC multiply
	LDA @ACC
	STA L4		; multiplyer
	CLR ACC		; lo part of result
	CLR L1		; hi part of result
loop:  	TST L4		; is multiplyer all 0's ?
	JZR @multiply	; yes - return
	CLR C
	ROR L4
	JZC skip
	CLR C
	ADD L2
	STA L5		; save ACC
	LDA L1
	ADD L3		; add shifted hi part to hi result
	STA L1
	LDA L5		; restore ACC
skip:	CLR C
	ROL L2
	ROL L3		; double precision shift left of multiplicand
	JMP loop
