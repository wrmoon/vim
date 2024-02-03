"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bill Moon's .vimrc file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set nocompatible
set expandtab
set textwidth=120
set nobackup            " do not keep a backup file, it will be OK
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight search matches
set nowrap              " I like it to run off to the right
set linebreak           " ...but if I turn on 'wrap', I want it to wrap on words
set laststatus=2        " always draw a status line
set scrolloff=4         " keep lines above and below when scrolling
set sidescrolloff=4     " keep lines left and right when scrolling horiz
set shortmess=OtT       " truncate messages to avoid Hit Return... messages
set smartindent         " do smart indenting when starting new line. 'cindent' overrides
set shiftround          " indent 'shiftwidth' for > and < commands
set sidescroll=1        " scroll by 1 horizontally
set statusline=[%n/%{bufnr('$')}]\ \ %<%f%h%w%1*%m%r%0*%=%y\ \ %4l,%-12.12(%-c%-V%)\ \ \ \ %3.3p%%
set autoindent          " always set autoindenting on
set autochdir           " set vim's working directory to the current buffer
set directory=/tmp      " put swap files here
set cc=+1,120           " when tw is turned on, show that column, and soft-limit 120
set belloff=wildmode    " don't ring bell for wildcard completion
" Don't use Ex mode, use Q for formatting
map Q gq

if has('autocmd')
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif

" faster window navigation
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

if  has('syntax')
    syn on
endif


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
    nnoremap K 	        :grep -w <cword> *.php *.c *.cpp *.h *.s *.py *.bat *.xml *.txt *.md<CR>
else
    set grepprg=grep\ -nH
    " search character under cursor in source files
    nnoremap K 	        :grep -w <cword> *.php *.c *.cpp *.h *.s *.py *.sh *.xml *.txt *.md<CR>
endif

" vim shouldn't detect *.md files as modula2, but rather as markdown
au BufRead,BufNewFile *.md set filetype=markdown wrap

" I like the codedark codescheme, but not for git commits
autocmd BufEnter * silent! colorscheme codedark
autocmd BufEnter COMMIT_EDITMSG 
    \ colorscheme default |
    \ set background=dark

