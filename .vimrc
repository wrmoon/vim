set ts=4
set sw=4
set nocompatible
set expandtab
set textwidth=120
set nobackup		" do not keep a backup file, it will be OK
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set hlsearch		" highlight search matches
set nowrap		    " I like it to run off to the right
set linebreak		" ...but if I turn on 'wrap', I want it to wrap on words
set laststatus=2	" always draw a status line
set scrolloff=4		" keep lines above and below when scrolling
set sidescrolloff=4	" keep lines left and right when scrolling horiz
set shortmess=OtT 	" truncate messages to avoid Hit Return... messages
set smartindent		" do smart indenting when starting new line. 'cindent' overrides
set shiftround		" indent 'shiftwidth' for > and < commands
set sidescroll=1	" scroll by 1 horizontally
set statusline=[%n/%{bufnr('$')}]\ \ %<%f%h%w%1*%m%r%0*%=%y\ \ %4l,%-12.12(%-c%-V%)\ \ \ \ %3.3p%%
set autoindent		" always set autoindenting on
set autochdir       " set vim's working directory to the current buffer
set directory=/var/tmp/vim  " put swap files here
set cc=+1,120       " when tw is turned on, show that column, and soft-limit 120
syn on

" Don't use Ex mode, use Q for formatting
map Q gq

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " cd to the current buffer's path (auto-cd)
  " *** not needed - using autochdir *** autocmd BufEnter *  execute "cd ".expand("%:h")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
endif " has("autocmd")

" faster window navigation
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" quick access to buffer explorer
nmap ff     \be
nmap fh     \bs
nmap fv     \bv

" quick access to NERDTree
nnoremap <S-f>     :NERDTree<cr>

" set F6 to turn off search highlight
nnoremap <F6> :nohlsearch<cr>

if has("win32")
    set grepprg=grep.exe\ -nH
    " search character under cursor in source files
    nnoremap K 	        :set grepprg=grep.exe\ -nH<CR>:grep -w <cword> *.php *.c *.cpp *.h *.s *.py *.bat *.xml *.txt<CR>
else
    set grepprg=grep\ -nH
    " search character under cursor in source files
    nnoremap K 	        :set grepprg=grep\ -nH<CR>:grep -w <cword> *.php *.c *.cpp *.h *.s *.py *.sh *.xml *.txt<CR>
endif

" vim shouldn't detect *.md files as modula2, but rather as markdown
au BufRead,BufNewFile *.md set filetype=markdown wrap

colorscheme moonDesert
nnoremap <F2> :colorscheme moonDesert<cr>
nnoremap <S-F2> :colorscheme visualstudio<cr>

nnoremap <F3> :cnext<cr>
nnoremap <S-F3> :cprevious<cr>

" increase and decrease font size
if has("win32")
    nmap <kMinus>   :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) - 1)', '')<cr> 
    nmap <kPlus>    :let &guifont = substitute(&guifont, ':h\(\d\+\)', '\=":h" . (submatch(1) + 1)', '')<cr> 
else
    nmap <kMinus>   :let &guifont = substitute(&guifont, ' \(\d\+\)', '\=" " . (submatch(1) - 1)', '')<cr> 
    nmap <kPlus>    :let &guifont = substitute(&guifont, ' \(\d\+\)', '\=" " . (submatch(1) + 1)', '')<cr> 
" for keyboards without a numeric keypad
    nmap <C-PageDown>   :let &guifont = substitute(&guifont, ' \(\d\+\)', '\=" " . (submatch(1) - 1)', '')<cr> 
    nmap <C-PageUp>     :let &guifont = substitute(&guifont, ' \(\d\+\)', '\=" " . (submatch(1) + 1)', '')<cr> 
endif
