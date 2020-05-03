scriptencoding utf-8

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
set splitright " makes vsplit split to the right instead of left
set encoding=utf-8
set background=dark
syntax on
colorscheme gruvbox

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

" Open NERDTree in current folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Sets working directory to current open file
autocmd BufEnter * lcd %:p:h

" Show hidden files in NERDTree by default
let NERDTreeShowHidden=1

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Easy tabswitching
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Easy window switching
nnoremap <silent> <M-Up> :wincmd k<CR>
nnoremap <silent> <M-Down> :wincmd j<CR>
nnoremap <silent> <M-Left> :wincmd h<CR>
nnoremap <silent> <M-Right> :wincmd l<CR>

" ---- MARKDOWN ----
let g:vim_markdown_folding_disabled = 1
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" ---- COLORSCHEME SWITCHING ----
nnoremap <F1> :colorscheme dracula<CR> 
nnoremap <F2> :colorscheme gruvbox<CR>
