LOC 10
01

LOC 20
"ACC: %05o CARRY: %o\n"

LOC 100
CLR 777
LDA 10
PRF 20
ADR 0
ADR 777
ASL 0
JNR 102
PRF 20
ADR 0
ADR 777
ROR 0
PRF 20
ADR 0
ADR 777
ASR 0
JZC 113
PRF 20
ADR 0
ADR 777
HLT
