-- First the leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- Preferences
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.foldlevelstart = 99

vim.opt.scrolloff = 2
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'

vim.opt.termguicolors = true

-- Oh what would I do without you...
vim.opt.relativenumber = true

-- and you too...
vim.opt.number = true

-- When splitting, the new panes should be at
-- right in case of horizontal splits and 
-- below in case of vertical splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- For nostalgia's sake...
vim.opt.undofile = true

-- List all matches in completion, to longest common match
vim.opt.wildmode = 'list:longest'

-- Ignore these when suggesting completions
vim.opt.wildignore = '*.png,*.jpg'

-- Tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false

-- Search settings
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- No terminal beeps
vim.opt.vb = true

-- Ignore whitespaces in diffs
vim.opt.diffopt:append('iwhite')
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')

-- Column at 80 characters 
vim.opt.colorcolumn = '80'
-- Except for Rust where we use 100 characters
-- vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn = 100'})

-- Show hidden characters
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'


-----------+-------------------------------------------+
-- Hotkeys |===========================================|
-----------+-------------------------------------------+
vim.keymap.set('', '<C-p>', vim.cmd.Files)
vim.keymap.set('n', '<leader>;', vim.cmd.Buffers)
vim.keymap.set('n', '<leader>w', vim.cmd.w)

vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<C-j>', '<Esc>')
vim.keymap.set('i', '<C-j>', '<Esc>')
vim.keymap.set('v', '<C-j>', '<Esc>')
vim.keymap.set('s', '<C-j>', '<Esc>')
vim.keymap.set('x', '<C-j>', '<Esc>')
vim.keymap.set('c', '<C-j>', '<Esc>')
vim.keymap.set('o', '<C-j>', '<Esc>')
vim.keymap.set('l', '<C-j>', '<Esc>')
vim.keymap.set('t', '<C-j>', '<Esc>')
-- Ctrl-j is a little awkward unfortunately:
-- https://github.com/neovim/neovim/issues/5916
-- So we also map Ctrl+k
vim.keymap.set('n', '<C-k>', '<Esc>')
vim.keymap.set('i', '<C-k>', '<Esc>')
vim.keymap.set('v', '<C-k>', '<Esc>')
vim.keymap.set('s', '<C-k>', '<Esc>')
vim.keymap.set('x', '<C-k>', '<Esc>')
vim.keymap.set('c', '<C-k>', '<Esc>')
vim.keymap.set('o', '<C-k>', '<Esc>')
vim.keymap.set('l', '<C-k>', '<Esc>')
vim.keymap.set('t', '<C-k>', '<Esc>')

vim.keymap.set('v', '<C-h>', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>nohlsearch<cr>')
-- Jump to start and end of line using the home row keys
vim.keymap.set('', 'H', '^')
vim.keymap.set('', 'L', '$')

-- Leader specific shortcuts
-- Delete empty lines
vim.keymap.set('n', '<leader>de', '<cmd>g/^$/d<cr>')


-- Ripgrep
vim.keymap.set('n', '<leader>rg', '<cmd>Rg<cr>')

-- Toggle between buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', '<leader>q', vim.cmd.q)

-- Greatest remap ever
vim.keymap.set('x', '<leader>p', "_dP")

-- Center when navigating
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('n', '*', '*zz', { silent = true })
vim.keymap.set('n', '#', '#zz', { silent = true })
vim.keymap.set('n', 'g*', 'g*zz', { silent = true })
-- "very magic" (less escaping needed) regexes by default
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%sm/')

-- Make g and j move by visual lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Put stuff inside parentheses in quotes.
-- Cursor must be inside parentheses
vim.keymap.set("n", '<leader>s"', "F(a\"<esc>f)i\"<esc>")


-- Spell checking!
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
-- Replace misspelled word with the best match
vim.keymap.set("n", "<C-l>", "1z=")


-----------+-------------------------------------------+
-- Actions |===========================================|
-----------+-------------------------------------------+
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{
		pattern = "*",
		callback = function(ev)
						if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
				-- except for in git commit messages
				-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
				if not vim.fn.expand('%:p'):find('.git', 1, true) then
					vim.cmd('exe "normal! g\'\\""')
				end
			end
		end
	}
)


-----------+-------------------------------------------+
-- Plugins |===========================================|
-----------+-------------------------------------------+
--- Setup using https://github.com/folke/lazy.nvim
--- Install if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require("lazy").setup({
	{
		"wincent/base16-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
			vim.o.background = 'dark'

			-- More prominent comments
			local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
			vim.api.nvim_set_hl(0, 'Comment', bools)

			local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
			vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
		end
	},

	-- Bar at bottom
	{
		'itchyny/lightline.vim',
		lazy = false, -- also load at start since it's UI
		config = function()
			-- no need to also show mode in cmd line when we have bar
			vim.o.showmode = false
			vim.g.lightline = {
				colorscheme = "deus",
				active = {
					left = {
						{ 'mode', 'paste' },
						{ 'readonly', 'filename', 'modified' }
					},
					right = {
						{ 'lineinfo' },
						{ 'percent' },
						{ 'fileencoding', 'filetype' }
					},
				},
				component_function = {
					filename = 'LightlineFilename'
				},
			}
			function LightlineFilenameInLua(opts)
				if vim.fn.expand('%:t') == '' then
					return '[No Name]'
				else
					return vim.fn.getreg('%')
				end
			end
			-- https://github.com/itchyny/lightline.vim/issues/657
			vim.api.nvim_exec(
				[[
				function! g:LightlineFilename()
					return v:lua.LightlineFilenameInLua()
				endfunction
				]],
				true
			)
		end
	},

	-- Quick navigation
	{
		"ggandor/leap.nvim",
		config = function()
			require('leap').create_default_mappings()
		end
	},

	-- Better navigation with %
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup"}
		end
	},

	-- Fuzzy finder
	{
		"junegunn/fzf.vim",
		dependencies = {
			{ 'junegunn/fzf', dir = "~/.fzf", build = "./install -all" },
		},

	},
	{
	'neovim/nvim-lspconfig',
	config = function()
		-- Setup language servers.
		local lspconfig = require('lspconfig')

		lspconfig.pyright.setup {}

		-- Rust
		lspconfig.rust_analyzer.setup {
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					imports = {
						group = {
							enable = false,
						},
					},
					completion = {
						postfix = {
							enable = false,
						},
					},
				},
			},
		}

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<leader>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<leader>f', function()
					vim.lsp.buf.format { async = true }
				end, opts)

				local client = vim.lsp.get_client_by_id(ev.data.client_id)

				-- When https://neovim.io/doc/user/lsp.html#lsp-inlay_hint stabilizes
				-- *and* there's some way to make it only apply to the current line.
				-- if client.server_capabilities.inlayHintProvider then
				--     vim.lsp.inlay_hint(ev.buf, true)
				-- end

				-- None of this semantics tokens business.
				-- https://www.reddit.com/r/neovim/comments/143efmd/is_it_possible_to_disable_treesitter_completely/
				client.server_capabilities.semanticTokensProvider = nil
			end,
		})
	end
	},
	-- LSP-based code-completion
	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			'neovim/nvim-lspconfig',
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED by nvim-cmp. get rid of it once we can
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					-- Accept currently selected item.
					-- Set `select` to `false` to only confirm explicitly selected items.
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
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
		end
	},
	-- inline function signatures
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			-- Get signatures (and _only_ signatures) when in argument lists.
			require "lsp_signature".setup({
				doc_lines = 0,
				handler_opts = {
					border = "none"
				},
			})
		end
	},
})
