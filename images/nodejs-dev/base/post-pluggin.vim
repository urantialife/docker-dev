
" Simple debugger integration.

fu! g:SendDBBreak()
	call system("tmux send-keys -t right 'sb(" . line('.') . ")\n'")
endfu

fu! g:SendDBCmd(cmd)
	call system("tmux send-keys -t right '" . a:cmd . "\n'")
endfu

au FileType javascript nnoremap <buffer> ,b :call g:SendDBBreak()<cr>
au FileType javascript nnoremap <buffer> ,s :call g:SendDBCmd('s')<cr>
au FileType javascript nnoremap <buffer> ,n :call g:SendDBCmd('n')<cr>
au FileType javascript nnoremap <buffer> ,c :call g:SendDBCmd('c')<cr>
au FileType javascript nnoremap <buffer> ,r :call g:SendDBCmd('r')<cr>
au FileType javascript nnoremap <buffer> ,R :call g:SendDBCmd('restart')<cr>

" Enable jsx by default as many projects use .js extension for jsx files.
let g:jsx_ext_required = 0

" revert changes done in:
" https://github.com/vim/vim/issues/4830
au BufNewFile,BufRead *.jsx	set ft=javscript
au BufNewFile,BufRead *.tsx set ft=typescript

" add keybinds for YouCompleteMe
call g:YcmKeybindings('typescript')
call g:YcmKeybindings('javascript')
