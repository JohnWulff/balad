	LOC 770
tmp:	BLK 5		; room for 9 bytes of string

	LOC 10
string:	ADR tmp
pointr:	BLK 1
word:	BLK 1
LF:	"\n"
limit:	0775
entry:	"Enter a string of characters: "
overfl:	"\nMemory overflow at pointr %#o\n"

	LOC 100
loop:	LDA string
	STA pointr
	TCS entry
next:	KCH 0
	CMP LF
	JZR even
	STA word
	KCH 0
	CMP LF
	JZR odd
	SWP 0
	ADD word
	STA @pointr
	INC pointr
	LDA limit
	CMP pointr
	JGE next
	TCS overfl
	ADR pointr
	HLT
odd:	LDA word	; last odd charcter and terminating NULL
	JMP out
even:	CLR 0		; terminating NULL after even
out:	STA @pointr
	TCS tmp
	TCS LF
	JMP loop
