scriptencoding utf-8
set nocompatible

" ---- PLUGINS ----
packadd! dracula

" ---- GENERAL SETTINGS ----
filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set number
set cursorline

set splitbelow splitright " defaults :sp to below and :vsp to the right

set title
set ruler
set background=dark
set rulerformat=%10(%l,%c%V%)
set backspace=indent,eol,start
set encoding=utf-8

syntax on
colorscheme gruvbox

autocmd BufEnter * lcd %:p:h "Sets working directory to current open file

" Move line up and down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+1<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Up> <Esc>:m+1<CR>
vnoremap <S-Up> :m '<-2<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv

" ---- SEARCH ----
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" ---- STATUSLINE ----
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2
set statusline=
set statusline+=%#WildMenu#
set statusline+=[%n]
set statusline+=\ %F
set statusline+=\ %{StatuslineGit()}
set statusline+=\ %m

set statusline+=%=
set statusline+=%#IncSearch#
set statusline+=\ %c:%l/%L 
set statusline+=\ %%%p
set statusline+=\ %y 


" ---- NERDTree ----
let NERDTreeShowHidden=1 "show hidden files by default

" Open NERDTree in current folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Easy tabswitching
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" ---- MARKDOWN ----
let g:vim_markdown_folding_disabled = 1

" ---- COLORSCHEME SWITCHING ----
nnoremap <F1> :colorscheme dracula<CR> 
nnoremap <F2> :colorscheme gruvbox<CR>
