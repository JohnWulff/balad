" Vim syntax file
" Language:	BALAD Assembler
" Maintainer:	John E. Wulff <immediatec@gmail.com>
" $Id: bl.vim 1.1 $
" for openSUSE ic.vim must be in /usr/share/vim/current/syntax

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

syn match asmLabel		"[a-z_][a-z0-9_]*:"he=e-1
syn match asmIdentifier		"[a-z_@][a-z0-9_]*"

" Various #'s as defined by GAS ref manual sec 3.6.2.1
" Technically, the first decNumber def is actually octal,
" since the value of 0-7 octal is the same as 0-7 decimal,
" I (Kevin) prefer to map it as decimal:
syn match decNumber		"0\+[1-7]\=[\t\n$,; ]"
syn match decNumber		"[1-9]\d*"
syn match octNumber		"0[0-7][0-7]\+"
syn match hexNumber		"0[xX][0-9a-fA-F]\+"
syn match binNumber		"0[bB][0-1]*"

syn keyword asmTodo		contained TODO

" The following are used as line comment characters:
syn match asmComment		"[#;].*" contains=asmTodo

" Strings
syn match asmString		"\".*\""

" Assembler directives
syn match asmDirective		"LOC"
syn match asmDirective		"BLK"

syn case match

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

" The default methods for highlighting.  Can be overridden later
hi def link asmSection	Special
" hi def link asmLabel	Label
hi def link asmComment	Comment
hi def link asmTodo	Todo
hi def link asmDirective	Statement

hi def link asmInclude	Include
hi def link asmCond	PreCondit
hi def link asmMacro	Macro

hi def link hexNumber	Number
hi def link decNumber	Number
hi def link octNumber	Number
hi def link binNumber	Number

" hi def link asmIdentifier	Statement
hi def link asmType	Type
hi def link asmString	String


let b:current_syntax = "balad"

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
