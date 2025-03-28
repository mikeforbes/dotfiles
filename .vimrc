" A heavily customised, commented and actively used .vimrc
" Assumes a recent version of Vim (at least 7.0)
"
" First up, I use vim-plug: https://github.com/junegunn/vim-plug
" which assumes things like you having git, curl, a working internet connection
" (for the first time install, at least) and probably some other things.
"
" all of this helps streamline my setup, but you could probably exclude it
" entirely if you don't care about colour, other extra features/plugins..
" or my shenanigans.
" If no vim-plug setup is detected, it won't attempt to load anything.

" You could uncomment the below to auto-magically install vim-plug once
" .. if you like.
" and below that, to also install all of the plugins and reload.
" again, assumptions: probably a working internet connection, curl, etc
" and being OK with pulling a file over the heckin internet and executing it
"  ... doveryay, no proveryay. Trust but verify.


" Install vim-plug if not found
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/cdea0244a538a3178bba45e743e691e5bee61b4d/plug.vim
"   " mm that commit hash
"   " cdea0244a538a3178bba45e743e691e5bee61b4d
"endif

" Run PlugInstall if there are missing plugins
"autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \| PlugInstall --sync | q| source $MYVIMRC
"\| endif

" so: checking for the vim-plug file, if it's there we load plugins
" again, fixed to the commit last verified
" https://github.com/<username>/<repo>/commit/<hash>
" you can redo this with :PlugSnapshot
if ! empty(globpath(&rtp, 'autoload/plug.vim'))
  call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/syntastic'
    Plug 'dracula/vim', { 'as': 'dracula' } " otherwise it ends up as 'vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    let g:plugs['dracula'].commit = 'd4b0823100c702af127cba8dd5595a8f599041ec'
    let g:plugs['goyo.vim'].commit = 'fa0263d456dd43f5926484d1c4c7022dfcb21ba9'
    let g:plugs['limelight.vim'].commit = '0c8cc7f503a775c505dc9c67f1f5041ab4d5f1fd'
    let g:plugs['syntastic'].commit = '8d5e37c29cf5952fbf300b9230bffe424c61a488'
    let g:plugs['vim-airline'].commit = '7a552f415c48aed33bf7eaa3c50e78504d417913'
    let g:plugs['vim-airline-themes'].commit = 'cda3b5ea087f7e301a3d4e61727108f66ba6dd20'
    let g:plugs['vim-better-whitespace'].commit = '86a0579b330b133b8181b8e088943e81c26a809e'
    let g:plugs['vim-gitgutter'].commit = '6620e5fbbe6a28de0bfed081f5bd2767023b7eea'
    call plug#end()
" that's it - we're done.
endif

" specific to the vim-airline plugin:
"   'silent!' makes it stfu if it errors
if filereadable($HOME."/.vim/plugged/vim-airline/plugin/airline.vim")
    " set airline theme
    silent! let g:airline_theme = 'dracula'
    " use powerline fonts if we can
    silent! let g:airline_powerline_fonts = 1
    " puts another bar type thing at the top
    silent! let g:airline#extensions#tabline#enabled = 1
    " and we can customise it:
    silent! let g:airline#extensions#tabline#left_sep = ' '
    silent! let g:airline#extensions#tabline#right_sep = ' '
    silent! let g:airline#extensions#tabline#left_alt_sep = '|'
    silent! let g:airline#extensions#tabline#right_alt_sep = '|'
    silent! let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
endif

set t_Co=256 " set the number of terminal colours to use. (all of them)

" set the colourscheme I want, fallback to something else, but default sucks
try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme zaibatsu
endtry

if exists('$TMUX') " a fix for tmux escape commands? I can't recall this now.
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " but honestly, it still works.
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " so fuck it, right?
endif
" make sure we're using ALL the colours
set termguicolors
" syntastic settings;
if get(g:, 'loaded_syntastic_plugin', 0)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
endif

" if using Goyo, use Limelight too!
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" shade the window a different colour when wider than 80col.. should be here ->
set colorcolumn=80

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" deal with backups and other junky files
set nobackup                    " backups are annoying
set nowritebackup                 " temp backup during write
set undodir=~/.vim/undo         " persistent undo storage
set undofile                    " persistent undo on
" theme specifc. dracula likes dark
set background=dark " we are using a dark background
" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Fast editing and reloading of vimrc configs
" leader+e (default leader key is \)
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

" misc settings
syntax on " yes we want syntax
set history=10000 " How many lines of history to remember
set cf " enable error files and error jumping
set clipboard= " unset the clipboard. on mac this stops vim over-writing the OS clipboard.
set ffs=unix,dos,mac " support all three, in this order
let skip_defaults_vim=1 " do some weird shit
set viminfo="" " disable viminfo completely
" and the 'nuke the whole site from orbit' method, c/o lurbs sime time in 2008?
autocmd VimLeave * call delete('~/.viminfo')
autocmd VimLeavePre * call delete('~/.viminfo')
set isk+=_,$,@,%,#,- " none of these should be word dividers
set scrolloff=2 " Minimal number of screen lines to keep above and below.
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
set shiftwidth=4 " 4. always 4.
" setting the below causes vim to bang you down onto a newline when you hit 79
" chars, which can be annoying to some.
" but i find it soothing.
set textwidth=79
set nosmartindent " it's balls.
set cindent " do c-style indenting instead
set nonu " I don't like numbers. They show in the statusbar anyway
set nowrap " do not wrap long lines when they are being displayed. textwidth sets linewrapping when you're writing
set smarttab autoindent " use tabs at the start of a line, spaces elsewhere
set expandtab " use the right amount of numbers to tab in insert mode
set ignorecase smartcase
set showmatch " visually helps you when there are brackets involved
set ttyfast  " smoother changes
set hlsearch " search highlighting
set incsearch " more of the same

" I keep typing :Q! instead of :q! and it's annoying
" this fixes it ;)
command -bang -bar Q :q<bang>

" global, forces all comments to look the same in my colour schemes.
" could break some other syntax formatting
set comments+=b:\"
set comments+=n::
set comments+=b:#

"The following line sets the smartindent mode for *.py files.
"It means that after typing lines which start with any of the keywords
" in the list (ie. def, class, if, etc)
"the next line will automatically indent itself to the next level of indentation:
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" more as an example, you can enforce things like textwidth per filetype, e.g
au FileType py set textwidth=79 " PEP-8 Friendly
