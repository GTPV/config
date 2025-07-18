" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'github/copilot.vim'
call plug#end()
" if has("syntax")
	" syntax on
" endif
syntax on

let g:lsp_document_highlight_enabled = 0
let g:lsp_settings_filetype_python = ['pyright-langserver']

" ========== Settings from set.lua ==========

" set t_Co=256
set termguicolors
set background=light
let g:airline_theme='base16'
set nu
set mouse=a

set tabstop=8
set softtabstop=8
set shiftwidth=8
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

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
  " execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
" 
" function! OpamConfOcpIndex()
  " execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
" 
" function! OpamConfMerlin()
  " let l:dir = s:opam_share_dir . "/merlin/vim"
  " execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')
" 
" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
  " " Respect package order (merlin should be after ocp-index)
  " if count(s:opam_available_tools, tool) > 0
    " call s:opam_configuration[tool]()
  " endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" " ## added by OPAM user-setup for vim / ocp-indent ## de24d50cfa0037ed2cc43ca24f59886b ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
  " source "/Users/gtpv/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
" endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
