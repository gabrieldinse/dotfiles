set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off                  " required

" Needs installing Vundle: https://github.com/VundleVim/Vundle.vim
"
" set the runtime path to include Vundle and initialize set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Open this file on vim and run "PluginInstall"
Plugin 'https://github.com/ycm-core/YouCompleteMe.git'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'https://github.com/morhetz/gruvbox.git'
Plugin 'https://github.com/itchyny/lightline.vim.git'
Plugin 'https://github.com/prettier/vim-prettier.git'
Plugin 'https://github.com/kergoth/vim-bitbake.git'
Plugin 'https://github.com/sheerun/vim-polyglot.git'
Plugin 'https://github.com/zivyangll/git-blame.vim.git'
Plugin 'https://github.com/mhinz/vim-signify.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
"Plugin 'https://github.com/Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set nu
set t_Co=256

set background=dark
colorscheme gruvbox

let g:lightline = {
\   'colorscheme': 'gruvbox',
\   'active': {
\     'left': [
\       [ 'mode', 'paste' ],
\       [ 'readonly', 'absolutepath', 'modified' ]
\     ],
\   },
\ }

set backspace=2
set cscopeverbose
set cursorline
set fsync
set hlsearch
set incsearch
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set laststatus=2
set nrformats="bin,hex"
set ttyfast
set list
set autoindent

set tags=./tags

"set tabstop=2 shiftwidth=2 expandtab                 "bash
"set tabstop=8 shiftwidth=8                           "switchd
set tabstop=4 shiftwidth=4 expandtab                 "lua
"set tabstop=4 shiftwidth=4                           "fm / switchd
set colorcolumn=80

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0

let g:sql_type_defaults='sqlanywhere'

let g:ctrlp_custom_ignore = { 'dir': '\v(build|\.git|node_modules|platforms|App_Resources)$' }
let g:ctrlp_working_path_mode = 'a'

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp

" Type '\' + 's'
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
