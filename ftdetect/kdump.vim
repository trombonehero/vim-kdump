augroup filetype
  au! BufRead,BufNewFile *.dump set filetype=kdump
  au! BufRead,BufNewFile *.kdump set filetype=kdump
  au! BufRead,BufNewFile *.ktrace set filetype=kdump
augroup end
