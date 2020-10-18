;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  compare.bal
;
;  Check the CMP instruction with JLT, JGE etc in the BALAD run time
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 10
MR:	0

	LOC 100
main:	KDN ACC
	KDN MR

	PRF fACC	; "ACC 5 is "
	ADR ACC
	CMP MR
	JLT lt
	PRF not		; "not "
lt:	PRF fLT		; "<  %d in MR"
	ADR MR

	PRF fACC	; "ACC 5 is "
	ADR ACC
	CMP MR
	JGE ge
	PRF not		; "not "
ge:	PRF fGE		; ">= %d in MR"
	ADR MR

	PRF fACC	; "ACC 5 is "
	ADR ACC
	CMP MR
	JLE le
	PRF not		; "not "
le:	PRF fLE		; "<= %d in MR"
	ADR MR

	PRF fACC	; "ACC 5 is "
	ADR ACC
	CMP MR
	JGT gt
	PRF not		; "not "
gt:	PRF fGT		; ">  %d in MR"
	ADR MR

	PRF fACC	; "ACC 5 is "
	ADR ACC
	CMP MR
	JEQ eq
	PRF not		; "not "
eq:	PRF fEQ		; "== %d in MR"
	ADR MR

	PRF fACC	; "ACC 5 is "
	ADR ACC
	CMP MR
	JNE ne
	PRF not		; "not "
ne:	PRF fNE		; "!= %d in MR"
	ADR MR
	JMP main

; Strings
not:	"not "
fACC:	"ACC %d is "
fLT:	"<  %d in MR	JZC\n"
fGE:	">= %d in MR	JNC\n"
fLE:	"<= %d in MR	JEZ\n"
fGT:	">  %d in MR	JBN\n"
fEQ:	"== %d in MR	JZR\n"
fNE:	"!= %d in MR	JNR\n"
