execute pathogen#infect()
filetype plugin indent on
set showcmd

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'readonly': '%{&readonly?"x":""}',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ }

if !has('gui_running')
    set t_Co=256
endif

set laststatus=2
set encoding=utf-8
scriptencoding utf-8

syntax on
colorscheme basic-dark
set number
set tabstop=4
set shiftwidth=4
set expandtab
set wrap
set linebreak
set nolist
