if &compatible
  set nocompatible
endif

" status line
set laststatus=2
set title
" for airline
set t_Co=256

let g:python3_host_prog  = '~/.pyenv/shims/python'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    dein.vim configuration                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein path
let s:plugin_dir = expand('~/.vim/bundles/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
" plugin main file
let s:toml_main_file = expand('~/.vim/.dein.toml')
" plugin lazy file
let s:toml_lazy_file = expand('~/.vim/.dein_lazy.toml')
" plugin colorscheme file
let s:toml_colorscheme_file = expand('~/.vim/.colorscheme.toml')
let &runtimepath = s:dein_dir . ',' . &runtimepath

if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)
    call dein#load_toml(s:toml_main_file)
    call dein#load_toml(s:toml_lazy_file)
    call dein#load_toml(s:toml_colorscheme_file)
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" identify filetype
filetype indent off
filetype plugin on

highlight Normal ctermbg=none
set background=dark

" colorscheme
colorscheme codeschool
syntax enable

" history size
set history=1000
" automatically reload
set autoread
set hidden

set encoding=utf8
" show line number
set number
" show current cursor position
set ruler
" show candidates
set wildmenu
" when moving cursor(e.g. gg, G), cursor does not lie in start of the text
set nostartofline
" show command on the bottom of the line
set showcmd
" show parentheses, bracket, etc corresponded to them
set showmatch
" time to keep something match highlite
set matchtime=3
" indent
set expandtab
set tabstop=4
set softtabstop=4
set shiftround
" clipboard
set clipboard=unnamed,unnamedplus
" scroll at 5 lines above BOT
set scrolloff=5
" backup and swapfile
set nobackup
set nowritebackup
set noswapfile
" backspace key's behavior
set backspace=indent,eol,start
" show \n \t
set list
" help
set helpheight=999
"search
" ignore small or capital letter
set ignorecase
" if small -> ignore capital
" else -> do not ignore capital
set smartcase
" if search at BOT, jump at the beginning of the file
set wrapscan
" highlight match string
set hlsearch
" enable incremental search
set incsearch
" show cursorline
set cursorline
" IME config
"set iminsert=0

" key bind
"nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap t :bn<CR>
