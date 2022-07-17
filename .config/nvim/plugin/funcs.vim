fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_DOOR
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
