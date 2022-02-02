call plug#begin('~/.vim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"GUI Stuff
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'chriskempson/base16-vim'

Plug 'lervag/vimtex'

"Language support
Plug 'neovim/nvim-lspconfig'
Plug 'folke/zen-mode.nvim'

"===========Markdown========
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

"Line numbers
set nu
set tabstop=4
set shiftwidth=4
set noswapfile
set nobackup
set colorcolumn=80
"Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

"Mouse support. Enables visual mode on select
set mouse=a

"Leaders
let mapleader="\<Space>"
nnoremap <Leader>tb :Tabularize /\|<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>mp :MarkdownPreviewToggle<CR>

"Copy to system clipboard. Works well with mouse
vmap Y "+y
" Paste from system clipboard
nnoremap P "+p 

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

"Bling
set termguicolors
colorscheme base16-gruvbox-dark-hard
let g:lightline = {
  \ 'colorscheme': 'deus',
\ }

"Terminal settings
autocmd TermOpen * setlocal nonumber norelativenumber "Disable line numbers
autocmd BufWinEnter,WinEnter term://* startinsert "Get into insert mode when terminal is focused

tnoremap <Esc> <C-\><C-n>
tnoremap <C-Left> <C-\><C-n>:tabprevious<CR>
tnoremap <C-Right> <C-\><C-n>:tabnext<CR>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

"" Easier tab nav
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"VimTeX
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_enabled = 0

let g:sneak#s_next = 1

"Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Spell checker
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_new_list_item_indent = 2


"LSP Stuff
lua << EOF
require("lspconfig").pylsp.setup{}
require("lspconfig").rust_analyzer.setup{}
EOF

set completeopt-=preview

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
