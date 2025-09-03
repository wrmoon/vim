"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bill Moon's .vimrc file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set nocompatible
set expandtab
set textwidth=90
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
"set autochdir           " set vim's working directory to the current buffer
set directory=/tmp      " put swap files here
set colorcolumn=+1      " when tw is turned on, show that column.
set belloff=wildmode    " don't ring bell for wildcard completion
set nu                  " number those lines

" this gets redone with powerline, but here for backup
set statusline=[%n/%{bufnr('$')}]\ \ %<%F%h%w%1*%m%r%0*%=%y\ \ %4l,%-12.12(%-c%-V%)\ \ \ \ %3.3p%%

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

" netrw has its own ctrl-l, that I don't like
" spent way too much time trying to override. Went to /usr/share/vim/vim81/autoload/netrw.vim and altered there.
" This did not work, after opening a dir in netrw:
"au BufReadPost,BufWritePost,BufEnter,BufCreate,BufNew NetrwTreeListing :silent! nunmap <buffer> <c-l>

" search navigation (after using :grep)
nnoremap <c-right> :cnext<cr>
nnoremap <c-left>  :cprev<cr>
nnoremap <c-up>    :crewind<cr>
nnoremap <c-down>  :clist<cr>

" tag navigation
nnoremap <c-F12> :tnext<cr>
nnoremap <c-F11> :tprev<cr>

if  has('syntax')
    syn on
endif


" quick access to buffer explorer
nnoremap <silent> ff     :BufExplorer<CR>
nnoremap <silent> ft     :ToggleBufExplorer<CR>
nnoremap <silent> fh     :BufEnterHorizontalSplit<CR>
nnoremap <silent> fv     :BufEnterVerticalSplit<CR>

let g:bufExplorerSortBy='fullpath'

" NERDTree-like functionality but using built-in netrw
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25

" quick access to netrw
" nnoremap <S-f>     :Vex<cr>
nnoremap <S-f>     :NERDTreeToggleVCS<cr>
nnoremap ,f        :NERDTreeFind<CR>:wincmd p<CR>

" turn on mouse wheel support
set mouse=a
 

" set F6 to turn off search highlight
nnoremap <F6> :nohlsearch<cr>

if has("win32")
    set grepprg=grep.exe\ -nH
    " search word under cursor in current directory
    nnoremap K 	        :grep -w <cword> *.php *.c *.cpp *.cc *.hh *.h *.hpp *.s *.py *.bat *.xml *.txt *.md<CR>
    " NOTE: This needs grepc tool installed in path
    set grepprg=grepc
    " search word under cursor in all folders in project
    nnoremap K 	        :grep -w <cword><CR>
endif

" Use real tabs in makefiles
au BufEnter Makefile,*.mak  setlocal noexpandtab

" vim shouldn't detect *.md files as modula2, but rather as markdown
au BufRead,BufNewFile *.md set filetype=markdown wrap

" vim should detect *.tpp files as cpp
au BufRead,BufNewFile *.tpp set filetype=cpp

set path=.,/usr/include,/opt/ti/ccs1230/bios_6_50_02_00/packages,/opt/ti/ccs1230/xdctools_3_62_01_16_core/packages

au BufEnter * set tags=./TAGS,../TAGS,/home/wmoon/code/Sparrow500/TAGS,/opt/ti/ccs1230/bios_6_50_02_00/packages/ti/sysbios/TAGS
au BufWritePost *.c,*.cpp,*.h  silent! !myetags c

au BufEnter *.py set tags=./PTAGS,../PTAGS,/home/wmoon/code/Sparrow500/PTAGS
au BufWritePost *.py  silent! !myetags py

" autoload autogen files
au BufReadPost */SharedMover/Corvus/Tests/*.{cpp,h},*/SharedMover/Corvus/Messages/*.{cpp,h,json} setlocal autoread

" I like the codedark colorscheme
colorscheme codedark
autocmd BufEnter COMMIT_EDITMSG
    \ set tw=0

" powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
