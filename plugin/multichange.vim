if exists("g:loaded_multichange") || &cp
  finish
endif

let g:loaded_multichange = '0.1.0'
let s:keepcpo = &cpo
set cpo&vim

if !exists('g:multichange_mapping')
  let g:multichange_mapping = '<c-n>'
endif

command! -nargs=0 -count=0 Multichange call multichange#Setup(<count>)

if g:multichange_mapping != ''
  exe 'nnoremap '.g:multichange_mapping.' :Multichange<cr>'
  exe 'xnoremap '.g:multichange_mapping.' :Multichange<cr>'
endif

au InsertLeave * call multichange#Substitute()
au InsertLeave * call multichange#EchoModeMessage()
au CursorHold  * call multichange#EchoModeMessage()

let &cpo = s:keepcpo
unlet s:keepcpo

" vim: et sw=2
