""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vundle Auto Installing                           "
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Vundle Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Auto Complete http://www.vim.org/scripts/script.php?script_id=2540
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Auto Complete PopUp
Plugin 'vim-scripts/AutoComplPop'
"Plugin 'Shougo/neocomplete.vim'

" format #ffffff to color http://www.vim.org/scripts/script.php?script_id=5056
Plugin 'ap/vim-css-color'

" filesystem tree http://www.vim.org/scripts/script.php?script_id=1658
Plugin 'scrooloose/nerdtree'

" vim scheme https://github.com/zeis/vim-kolor
Plugin 'zeis/vim-kolor'

" JSDoc
Plugin 'heavenshell/vim-jsdoc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Install Plugins Automatically                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
  :qall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General Settings                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number " show line number

" text encoding
set encoding=utf-8
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=utf8
set termencoding=utf8
set <C-u>=^U
set <C-b>=^B
map <C-u> :set fileencoding=utf8
map <C-b> :set fileencoding=big5

" Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab " tab to spaces
set smarttab " Be smart when using tabs ;)

" Auto intent: After enable auto intent, paste text from clipboard may mess
" the content. Try "set paste" instead
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines

" auto Complete () {} []
" :inoremap ( ()<ESC>i
" :inoremap { {<CR>}<ESC>O
" :inoremap [ []<ESC>i

" use mouse
if has('mouse')
  set mouse=a
endif

" color settings
syntax on " show syntax color
" 256
if &term == "xterm"
    set t_Co=256
endif

" putty color fix
if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

" scheme
colorscheme kolor
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Plugin Settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SirVer/ultisnips
" Trigger Settings: If you already use https://github.com/Valloric/YouCompleteMe. disable this
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<s-q>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" NERDTree
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <F2> :NERDTreeToggle <CR>
