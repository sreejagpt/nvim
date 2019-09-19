set number
set termguicolors
set nowrap
set wildmenu
set ignorecase
set smartcase
set incsearch
set lazyredraw
set magic
set showmatch
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

" WHITESPACE

highlight ExtraWhitespace ctermbg=173 guibg=#d7875f "rgb=255,175,95

" Highlight EOL whitespace,
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd BufRead,BufNew * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/

" Don't highlight when in Insert more
autocmd InsertLeave * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/
autocmd InsertEnter * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+\%#\@<!$/
