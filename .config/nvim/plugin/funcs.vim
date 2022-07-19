fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_DOOR
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
