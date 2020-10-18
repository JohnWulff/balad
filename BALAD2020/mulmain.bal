;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  mulmain.bal	J.E. Wulff 11 Oct 2020
;
;  Temporary variables
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 10		; temporary variables
xx:	0
yy:	0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Format string for PRF command
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 20
fmt:	"%d * %d = %ld\n"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  Main program calling JMS multiply in file mulfunc.bal
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 100
main:	KDN xx		; Enter multiplicand
	JZR quit	;   quit program if zero
	KDN yy		; Enter mmultiplyer
	JMS multiply
	ADR xx
	ADR yy
	PRF fmt		; print "xx * yy = result\n"
	ADR xx
	ADR yy
	ADR ACC
	JMP main
quit:	HLT

