":h
":option

"tab
set tabstop=4
set	autoindent
set shiftwidth=4
"linenumber
set rnu
set nu

set ruler
set guicursor=
syntax on
"tern off highlight after search
set nohlsearch
set	noerrorbells
set noswapfile
set	nowrap

set encoding=utf-8
set hidden

set	nobackup
set	undodir=~/.vim/undodir
set	undofile

set incsearch

set scrolloff=8
"Remaps
let mapleader = " "
nnoremap <C-h> : wincmd h<CR>
nnoremap <C-j> : wincmd j<CR>
nnoremap <C-k> : wincmd k<CR>
nnoremap <C-l> : wincmd l<CR>
nnoremap <silent> <leader>+ : vertical resize +5<CR>
nnoremap <silent> <leader>- : vertical resize -5<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pv : wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>u : UndotreeShow<CR>
nnoremap <leader>v : wincmd v<bar> :vertical resize 80<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"color
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
"directory
Plugin 'preservim/nerdtree'
"42
Plugin	'pbondoer/vim-42header'
"txt search in files
Plugin 'jremmen/vim-ripgrep'
"git
Plugin 'tpope/vim-fugitive'
if has('nvim')
	Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
endif
"
Plugin	'mbbill/undotree'
Plugin	'vim-utils/vim-man'
Plugin	'kien/ctrlp.vim'

Plugin	'neoclide/coc.nvim', {'branch': 'release'}

Plugin	'preservim/tagbar'
call vundle#end()

"colorscheme molokai
colorscheme gruvbox
set background=dark

"42 header
nmap std Stdheader<CR>


"nerdtree line number
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
autocmd FileType nerdtree setlocal number
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

if executable('rg')
	let g:rg_derive_root='true'
endif

"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s ls-file -oc --exclude-standard']


set colorcolumn=80
set	signcolumn=yes
highlight Colorlolumn ctermbg=2 guibg=lightgrey

if has('nvim')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {  },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
endif



" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
