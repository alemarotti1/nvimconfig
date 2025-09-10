vim.cmd('source ~/AppData/Local/nvim/vimrc.vim')

require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Configurações básicas do vim 
	use 'tpope/vim-sensible'


	-- Configuração LSP
	use({
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	-- FuzzyFinder - Plugin para encontrar arquivos d forma fácil
	use {
		'junegunn/fzf.vim',
		requires = { 'junegunn/fzf', run = ':call fzf#install()' }
	}

	-- Instalação do Coq, utilizado para completar código
	use 'ms-jpq/coq_nvim'
	use 'ms-jpq/coq.artifacts'
	use 'ms-jpq/coq.thirdparty'



	-- Instalação do esquema de cores pastel
	use 'AmberLehmann/candyland.nvim'
end)



require("mason").setup()
require("mason-lspconfig").setup()


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)


local lspconfig = require('lspconfig')
lspconfig.ast_grep.setup({})
lspconfig.ts_ls.setup({})
lspconfig.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		}
	}
})

local on_attach = function(client, bufnr)
	local opts_buffer = { noremap = true, silent = true, buffer = bufnr }
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- Mappings: LSP
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts_buffer)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts_buffer)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts_buffer)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts_buffer)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts_buffer)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts_buffer)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts_buffer)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts_buffer)
	vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts_buffer)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts_buffer)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts_buffer)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts_buffer)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts_buffer)
	vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts_buffer)
end

local lsp_flags = {
	debounce_text_changes = 150,
}


require('lspconfig')['ts_ls'].setup({
	-- LSP-default-keymaps
	on_attach = on_attach,
	flags = lsp_flags,
})


require('lspconfig')['lua_ls'].setup({
	-- LSP-default-keymaps
	on_attach = on_attach,
	flags = lsp_flags,
})



--Definição do color scheme pastel
vim.cmd.colorscheme "candyland"
