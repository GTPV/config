" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()
" if has("syntax")
	" syntax on
" endif
syntax on

let g:lsp_document_highlight_enabled = 0

" ========== Settings from set.lua ==========

" set t_Co=256
set termguicolors
set background=light
let g:airline_theme='base16'
set nu
set mouse=a

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set noswapfile
set nobackup

set nohlsearch
set incsearch

set scrolloff=5

set updatetime=50
set timeoutlen=2000

" ========== Remaps from remap.lua ==========

let mapleader = " "

" Normal mode
nnoremap <leader>ex :Ex<CR>
nnoremap <leader>pv :Ex<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

nnoremap Q <Nop>

nnoremap <leader><CR> o<Esc>

" Visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Insert mode
inoremap <C-j> <Esc>o
inoremap <C-k> <Esc>O
