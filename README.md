# balad
Beginners Assembly Language and Debugger

INTRODUCTION

Balad is an assembly level programming language for an emulated virtual computer with a 15 bit word length. It is combined with a comprehensive Debugging system which allows on line program assembly, execution of programs and the insertion of breakpoints to allow suspension of programs during execution.
Instructions are machine oriented, using integer and logical operations only. As a concession to the beginner, extra input/output instructions are provided for automatic Decimal to Binary conversion and the printing of Text Strings. These facilities will enable students to obtain reasonable print out of their results quickly, while concentrating their efforts on developing algorithms.

THE BALAD COMPUTER

The BALAD computer is a one accumulator machine with an arithmetic unit for performing logical operations and 15 bit two’s complement arithmetic. The Memory has 512 15 bit words with addresses 0 to 777 (octal numbering). Memory words may contain instructions, addresses of other memory words or data.
At the start of every instruction cycle the address in the Program Counter register (PC) is used by the computer to fetch the next instruction from memory into the Instruction Decoder. The program counter is normally incremented by 1 at the end of an instruction cycle so that the next instruction is fetched from the next location in Memory. Only a jump instruction can break this sequence by loading the Program counter (PC) with a new address which points to some arbitrary point in the memory from where the next instruction will then be fetched.
The Instruction Decoder isolates Bits 1 to 5 of the instruction and uses this as a number to distinguish between one of the 32 possible instructions. The instruction that has been identified is then executed. In a hardwired computer this process involves setting various switches to allow data to flow from various registers to other registers.
The last 10 bits of the instruction are used to determine a memory reference address. This can again be thought of as setting a big switch which connects one data path to one of 512 words in memory.

The Balad system was developed in 1970 as an aid for teaching electronics technicians and their teachers the basics of how a computer works internally. Even at that time the instruction sets and the multitude of special registers were confusing the fundamental simplicity of a computer based on the original von Neumann architecture. This is a much greater problem in the 21st century and this very simple Balad vitual computer should give students some insights into how the very core of a computer functions.
The details can easily be taught in one 45 minute lesson and from then on students can test their own skills in manipulating machine instuctions to develop higher level functionality, like a multiply routine, which is not part of the basic instructions set.
HINT: a very simple multiply algorithm is to add the multiplcand to the accumulator and decrement the multiplier in a loop. Terminate the loop  when the multiiplier is zero.

$Id: README.md 1.1 $
