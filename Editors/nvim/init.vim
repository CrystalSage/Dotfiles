let mapleader="\<Space>"

"============================================================================== 
" # PLUGINS
"============================================================================== 
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
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" LSP Stuff
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" Only because nvim-cmp _requires_ snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Language specific configurations
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

set autoindent
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
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

"============================================================================== 
" # GUI settings
"============================================================================== 
set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber
set number " Also show absolute line number of current line
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
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

set background=dark
let base16colorspace=256
let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"
colorscheme base16-gruvbox-dark-hard
syntax on
hi Normal ctermbg=NONE

 " Customize the highlight a bit.
" Make comments more prominent -- they are important.
call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")

"============================================================================== 
" # Keyboard shortcuts 
"============================================================================== 

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

nnoremap <Leader>f. :e /home/bourbon/.config/nvim/init.vim<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>q exits
nnoremap <leader>q :q<CR>

" Go to the repository on Github
nnoremap <leader>gv :!gh browse<CR>

" Markdown preview in browser
nnoremap <leader>mp :MarkdownPreviewToggle<CR>

" Keymap for replacing up to next symbol
" Useful for when editing code
nnoremap <leader>< dt<
nnoremap <leader>( dt(
nnoremap <leader>) dt)
nnoremap <leader>_ dt_
nnoremap <leader>, dt,

" Window positioning
nnoremap <leader>vm <C-W>\| <C-W>_
nnoremap <leader>vr <C-W>= 

" Project shortcuts
nnoremap <leader>s :Rg<CR>

map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-Left> <C-\><C-n>:tabprevious<CR>
tnoremap <C-Right> <C-\><C-n>:tabnext<CR>
tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

"" Easier tab nav
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>

"==============================================================================
" # LSP configuration
"==============================================================================
lua << END
local cmp = require'cmp'
local lspconfig = require'lspconfig'

require("nvim-lsp-installer").setup {}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "vim", "javascript", "vue", "css", "bash",  "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Setup completion
cmp.setup({
  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    -- Tab immediately completes. C-n/C-p to select.
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
	  ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
		['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
  },
  sources = cmp.config.sources({
    -- TODO: currently snippets from lsp end up getting prioritized 
		-- stop that!
    { name = 'nvim_lsp' },
  }, {
    { name = 'path' },
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

-- Rust
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      completion = {
	postfix = {
	  enable = false,
	},
      },
    },
  },
  capabilities = capabilities,
}
END

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
autocmd CursorHold,CursorHoldI *.vue :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }

"==============================================================================
" # Miscellaneous 
"==============================================================================
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
let g:UltiSnipsJumpForwardTrigger='<s-tab>'

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

