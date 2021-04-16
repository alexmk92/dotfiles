"----------------------------------------------------
" PHP Documenter
"----------------------------------------------------
autocmd FileType php inoremap <C-d> <ESC>:call PhpDoc()<CR>i
autocmd FileType php nnoremap <C-d> :call PhpDoc()<CR>
autocmd FileType php vnoremap <C-d> :call PhpDocRange()<CR>
