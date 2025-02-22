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
set autoindent          " always set autoindenting on
set autochdir           " set vim's working directory to the current buffer
set directory=/tmp      " put swap files here
set colorcolumn=+1,120  " when tw is turned on, show that column, and soft-limit 120
set belloff=wildmode    " don't ring bell for wildcard completion
set nu                  " number those lines

" map Q to something a little more useful
nmap Q gQ

" this gets redone with powerline, but here for backup
set statusline=[%n/%{bufnr('$')}]\ \ %<%f%h%w%1*%m%r%0*%=%y\ \ %4l,%-12.12(%-c%-V%)\ \ \ \ %3.3p%%

set guifont=Source\ Code\ Pro\ for\ Powerline\ 11

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

" search navigation (after using :grep)
nnoremap <c-right> :cnext<cr>
nnoremap <c-left>  :cprev<cr>
nnoremap <c-up>    :crewind<cr>
nnoremap <c-down>  :clist<cr>

if  has('syntax')
    syn on
endif


" quick access to buffer explorer
nmap ff     \be
nmap fh     \bs
nmap fv     \bv

" quick access to NERDTree
nnoremap <S-f>     :NERDTreeVCS<cr>
nnoremap ,f        :NERDTreeFind<CR>:wincmd p<CR>

" set F6 to turn off search highlight
nnoremap <F6> :nohlsearch<cr>

if has("win32")
    set grepprg=grep.exe\ -nH
    " search word under cursor in current directory
    nnoremap K 	        :grep -w <cword> *.php *.c *.cpp *.h *.s *.py *.bat *.xml *.txt *.md<CR>
else
    " NOTE: This needs grepc tool installed in path
    set grepprg=grepc
    " search word under cursor in all folders in project
    nnoremap K 	        :grep -w <cword><CR>
endif

" Use real tabs in makefiles
au BufEnter Makefile,*.mak  setlocal noexpandtab

" vim shouldn't detect *.md files as modula2, but rather as markdown
au BufRead,BufNewFile *.md set filetype=markdown wrap

" NOTE: requires etags, and smartroot tool installed in path
set tags=./TAGS,../TAGS,../../TAGS,../../../TAGS,../../../../TAGS,../../../../../TAGS,../../../../../../TAGS
au BufWritePost *.c,*.cpp,*.h,*.py  silent! !etags -f $(smartroot)/TAGS --options=$(smartroot)/.etags_options $(smartroot) &

" I like the codedark codescheme
colorscheme codedark
autocmd BufEnter COMMIT_EDITMSG 
    \ set tw=0
"   \ colorscheme default |
"   \ set background=dark |

" powerline
"set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim
set rtp+=/usr/share/powerline/bindings/vim
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
