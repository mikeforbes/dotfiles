""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mikes fucking rad .vimrc file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load the pathogen plugin
" you'll want to enable this if you have pathogen
" (you should get pathogen) https://github.com/tpope/vim-pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" highlight anything past 80 columns wide (requires at least vim 7.3)
execute "set colorcolumn=" . join(range(81,335), ',')
set background=dark " we are using a dark background

colorscheme coal
" get the colors from https://github.com/mikeforbes/dotfiles/blob/master/coal.vim
" put it in ~/.vim/colors/

" set cul " highlight the line with the cursor on it (decided I didn't like this)
set nocompatible " get out of horrible vi-compatible mode
set modelines=0
filetype on " detect the type of file
filetype plugin indent on " load filetype plugins
syntax on
set history=10000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard+=unnamed " turns out I do like clipboard
set ffs=unix,dos,mac " support all three, in this order
set viminfo+=! " make sure it can save viminfo
set viminfo='10,\"100,:20,%,n~/.viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
set scrolloff=2 " Minimal number of screen lines to keep above and below the cursor. (2)
set t_Co=256 "number of terminal colours to use. (all of them)
set lsp=1 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 1 high
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
set nobackup " turn off file backup, because its balls
set nowb " Don't write a backup file
set noswapfile " don't write a swapfile
set smarttab "  When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set laststatus=2 " always show the status line
set ai " autoindent
set nosmartindent " it's balls.
set cindent " do c-style indenting
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
setlocal smarttab
set expandtab
set nonu " I don't like numbers.
set nowrap " do not wrap lines
set smarttab autoindent " use tabs at the start of a line, spaces elsewhere
set expandtab " use the right amount of numbers to tab in insert mode
set paste " pastes properly.
set ignorecase smartcase
set showmatch
set ttyfast         " smoother changes
syntax enable
set hlsearch
set incsearch
" I keep typing :Q! instead of :q! and it's annoying
" this fixes it ;)
command -bang -bar Q :q<bang>
" global, forces all comments to look the same in my colour schemes.
set comments+=b:\"
set comments+=n::
set comments+=b:#

""""""
" kick-ass statusline
""""""
 function! CurDir()
    let curdir = substitute(getcwd(), '/home/mike', "~/", "g")
     return curdir
 endfunction
  "Format the statusline
  set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L\ Column:\%c
""""""
" end statusline
""""""

""""""
" Super awesome search thing (press * or #)
""""""
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
""""""
" end search thing
""""""
" The following line sets the smartindent mode for *.py files.
" It means that after typing lines which start with any of the keywords in the list (ie. def, class, if, etc)
" the next line will automatically indent itself to the next level of indentation:
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre * :%s/\s\+$//e
au FileType py set textwidth=79 " PEP-8 Friendly

" tab complettion specifics. (^p)
imap <Tab> <C-P>
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
nnoremap R "_d
"map CTRL-j and CTRL-k to next and previous buffer
" and CTRL-l and CTRL-h to next and previous tabs.
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR
