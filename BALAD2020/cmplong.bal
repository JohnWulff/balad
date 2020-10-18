;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;  cmplong.bal
;
;  Check the CMP instruction with JLT, JGE etc in the BALAD run time
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	LOC 10
M0:	0L
MR:	0L

	LOC 100
main:	KDD M0
	KDD MR

	PRF fM0		; "M0 5 is "
	ADR M0
	LDA M0+1
	CMP MR+1	; compare hi part
	JLT lt
	JNE ltn
	LDA M0		; hi parts equal
	CMP MR		; compare lo part
	JLT lt
ltn:	PRF not		; "not "
lt:	PRF fLT		; "<  %d in MR"
	ADR MR

	PRF fM0		; "M0 5 is "
	ADR M0
	LDA M0+1
	CMP MR+1	; compare hi part
	JGT ge
	JNE gen
	LDA M0		; hi parts equal
	CMP MR		; compare lo part
	JGE ge
gen:	PRF not		; "not "
ge:	PRF fGE		; ">= %d in MR"
	ADR MR

	PRF fM0		; "M0 5 is "
	ADR M0
	LDA M0+1
	CMP MR+1	; compare hi part
	JLT le
	JNE len
	LDA M0		; hi parts equal
	CMP MR		; compare lo part
	JLE le
len:	PRF not		; "not "
le:	PRF fLE		; "<= %d in MR"
	ADR MR

	PRF fM0		; "M0 5 is "
	ADR M0
	LDA M0+1
	CMP MR+1	; compare hi part
	JGT gt
	JNE gtn
	LDA M0		; hi parts equal
	CMP MR		; compare lo part
	JGT gt
gtn:	PRF not		; "not "
gt:	PRF fGT		; ">  %d in MR"
	ADR MR

	PRF fM0		; "M0 5 is "
	ADR M0
	LDA M0+1
	CMP MR+1	; compare hi part
	JNE eqn
	LDA M0		; hi parts equal
	CMP MR		; compare lo part
	JEQ eq
eqn:	PRF not		; "not "
eq:	PRF fEQ		; "== %d in MR"
	ADR MR

	PRF fM0		; "M0 5 is "
	ADR M0
	LDA M0+1
	CMP MR+1	; compare hi part
	JNE ne
	LDA M0		; hi parts not equal
	CMP MR		; compare lo part
	JNE ne
	PRF not		; "not "
ne:	PRF fNE		; "!= %d in MR"
	ADR MR
	JMP main

; Strings
not:	"not "
fM0:	"M0 %D is "
fLT:	"<  %D in MR	JZC\n"
fGE:	">= %D in MR	JNC\n"
fLE:	"<= %D in MR	JEZ\n"
fGT:	">  %D in MR	JBN\n"
fEQ:	"== %D in MR	JZR\n"
fNE:	"!= %D in MR	JNR\n"
