" Use vim-plug
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'dracula/vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/goyo.vim'
call plug#end()

" specific to the vim-airline plugin:
" set airline theme
let g:airline_theme = 'dracula'
" use powerline fonts if we can
let g:airline_powerline_fonts = 1

" set the colour scheme!
colorscheme dracula " get this from vundle

" ensure we're using ALL the colours
set t_Co=256 "number of terminal colours to use. (all of them)
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" syntastic settings;
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" shade the window a different colour when wider than 80col.. should be here ->
set colorcolumn=80
" and now make it a suitable colour, not BRIGHT RED
highlight ColorColumn ctermbg=235

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" deal with backups and other junky files
set nobackup                    " backups are annoying
set nowritebackup                 " temp backup during write
set undodir=~/.vim/undo         " persistent undo storage
set undofile                    " persistent undo on
" theming specifc.
set background=dark " we are using a dark background

syntax on " yes we want syntax
set history=10000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard= " unset the clipboard. on mac this stops vim over-writing the OS clipboard.
set ffs=unix,dos,mac " support all three, in this order
let skip_defaults_vim=1 " do some weird shit
set viminfo="" " disable viminfo completely
set isk+=_,$,@,%,#,- " none of these should be word dividers
set scrolloff=2 " Minimal number of screen lines to keep above and below.
set lsp=1 " space it out a little more (easier to read)
set wildmenu " turn on the 'wild' menu
set ruler " Always show current positions along the bottom
set cmdheight=1 " the command bar is 1 high
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise
set noswapfile " don't write a swapfile
set smarttab "  When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set laststatus=2 " always show the status line
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set nosmartindent " it's balls.
set cindent " do c-style indenting
set nonu " I don't like numbers. They show in the statusbar anyway
set nowrap " do not wrap lines
set smarttab autoindent " use tabs at the start of a line, spaces elsewhere
set expandtab " use the right amount of numbers to tab in insert mode
set ignorecase smartcase
set showmatch
set ttyfast         " smoother changes
set hlsearch
set incsearch

" I keep typing :Q! instead of :q! and it's annoying
" this fixes it ;)
command -bang -bar Q :q<bang>

" global, forces all comments to look the same in my colour schemes.
set comments+=b:\"
set comments+=n::
set comments+=b:#

"The following line sets the smartindent mode for *.py files.
"It means that after typing lines which start with any of the keywords
" in the list (ie. def, class, if, etc)
"the next line will automatically indent itself to the next level of indentation:
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType py set textwidth=79 " PEP-8 Friendly
