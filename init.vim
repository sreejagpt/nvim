set termguicolors
set nowrap
set wildmenu
set ignorecase
set smartcase
set incsearch
set lazyredraw
set magic
set showmatch

" ERROR BELLS
set noerrorbells
set novisualbell
set encoding=utf8

" TABS
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" INDENTING
set ai
set si

" DON'T CLOSE ON BUFFER CLOSE
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

colorscheme acme
syntax enable
