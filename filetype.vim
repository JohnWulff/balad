" Vim filetype file
" Language:	iC
" Maintainer:	John E. Wulff <immediatec@gmail.com>
" Last Change:	2008 Jun 24 - 2015 Apr 6
" $Id: filetype.vim 1.5 $
" local filetype.vim must be in ~/.vim (ic.vim does not work there)

" combined version for immediate C and BALAD

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ic		setfiletype ic
  au! BufRead,BufNewFile *.ica		setfiletype ic
  au! BufRead,BufNewFile *.ih		setfiletype ic
  au! BufRead,BufNewFile *.lst		setfiletype ic
  au! BufRead,BufNewFile *.lst6		setfiletype ic
  au! BufRead,BufNewFile *.bl		setfiletype bl
  au! BufRead,BufNewFile *.bal		setfiletype bl
  au! BufRead,BufNewFile *.bll		setfiletype bl
augroup END
