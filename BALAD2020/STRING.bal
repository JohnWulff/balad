LOC 10
0177

LOC 20
"John E. Wulff\n37 Bellbird Crescent\nBowen Mountain 2756\n"

LOC 100
PRF 20
JMS 200
ADR 20
HLT

; print string function using only PCH
; arg 1: pointer to string to be printed
LOC 200
0
LDA @200	; arg1
INC 200		; step return
STA 1		; pointer to string
LDA @1		; next word of string
AND 10		; 0177
JZR @200	; return on zero byte
PCH 0		; print right byte
LDA @1		; same word of string
SWP 0
AND 10		; 0177
JZR @200	; return on zero byte
PCH 0		; print left byte
INC 1		; point to next word
JMP 204
