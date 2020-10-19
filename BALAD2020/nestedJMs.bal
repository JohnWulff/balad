;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  $Id: nestedJMs.bal 1.1 $
;
;  Test Balad u - until feature with nested JMS subroutines
;    NOTE: it is not possible to call subroutines recursively in BALAD
;          unless special stack is implemented (same as PDP-8)
;
;  set a breakpoint at location break (204)
;  >> 204b
;  hit any key	0 1 2 3 4
;  		break point at pc = 204
;  !> u		break point at pc = 165
;  !> u		break point at pc = 145
;  !> u		break point at pc = 125
;  !> u		break point at pc = 105
;  !> u
;  hit any key	0 1 2 3 4
;  ...
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 10
nest:	0
fnest:	"%d\n";

	LOC 100
main:	KCH ACC		; delay
	CLR nest	; nest = 0
	PRF fnest
	ADR nest
	JMS n1
	PRF fnest
	ADR nest
	JMP main

	LOC 120
n1:	0
	INC nest
	PRF fnest
	ADR nest
	JMS n2
	PRF fnest
	ADR nest
	DEC nest
	JMP @n1

	LOC 140
n2:	0
	INC nest
	PRF fnest
	ADR nest
	JMS n3
	PRF fnest
	ADR nest
	DEC nest
	JMP @n2

	LOC 160
n3:	0
	INC nest
	PRF fnest
	ADR nest
	JMS n4
	PRF fnest
	ADR nest
	DEC nest
	JMP @n3

	LOC 200
n4:	0
	INC nest
	PRF fnest
	ADR nest
break:	DEC nest
	JMP @n4
