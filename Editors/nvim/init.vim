let mapleader="\<Space>"

"=================================================================================================== 
" # PLUGINS
"=================================================================================================== 
call plug#begin('~/.vim/plugged')
" Snippets
Plug 'justinmk/vim-sneak'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Fuzzy stuff
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" GUI Stuff
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'chriskempson/base16-vim'

" Notes
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
call plug#end()


set autoindent
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Sane splits
set splitright
set splitbelow

set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Use 2 space tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noexpandtab

" Wrapping settings
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

"Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set noswapfile
set nobackup

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

"Mouse support. Enables visual mode on select
set mouse=a

"=================================================================================================== 
" # GUI settings
"=================================================================================================== 
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set shortmess+=c " don't give |ins-completion-menu| messages.

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Bling
set termguicolors
colorscheme base16-gruvbox-dark-hard
let g:lightline = {
  \ 'colorscheme': 'deus',
\ }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


"=================================================================================================== 
" # Keyboard shortcuts 
"=================================================================================================== 

" ; as :
nnoremap ; :

" Ctrl+k as Esc
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

" Neat clipboard integration
" Copy to and fro system clipboard. Works well with mouse
vmap Y "+y
nnoremap P "+p 

" Leader prefixed shortcuts
nnoremap <Leader>w :w<CR>
nnoremap <Leader>tb :Tabularize /\|<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
nnoremap <leader>, :set invlist<cr>

" <leader>q shows stats
nnoremap <leader>q g<c-g>

" Keymap for replacing up to next _ or -
noremap <leader>m ct_


map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-Left> <C-\><C-n>:tabprevious<CR>
tnoremap <C-Right> <C-\><C-n>:tabnext<CR>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

"" Easier tab nav
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


"=================================================================================================== 
" # Miscellaneous 
"=================================================================================================== 
"Terminal settings
autocmd TermOpen * setlocal nonumber norelativenumber "Disable line numbers
autocmd BufWinEnter,WinEnter term://* startinsert "Get into insert mode when terminal is focused

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"VimTeX
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_enabled = 0


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
