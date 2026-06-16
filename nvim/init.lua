--vim.cmd('source ~/AppData/Local/nvim/vimrc.vim') -- Use this line if using windows
vim.cmd('source ~/.config/nvim/vimrc.vim')

vim.pack.add({
	-- Configurações básicas do vim 
	"https://github.com/tpope/vim-sensible",
	
	-- Configurações para utilização do emmet dentro do vim
	"https://github.com/mattn/emmet-vim",


	-- Configuração LSP
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",

	-- FuzzyFinder - Plugin para encontrar arquivos de forma fácil
	"https://github.com/junegunn/fzf.vim",

	-- Instalação do Coq, utilizado para completar código
	"https://github.com/ms-jpq/coq_nvim",
	"https://github.com/ms-jpq/coq.artifacts",
	"https://github.com/ms-jpq/coq.thirdparty",

	"https://github.com/sahilsehwag/macrobank.nvim",


	-- Instalação do esquema de cores pastel
	"https://github.com/AmberLehmann/candyland.nvim"
})

local macrobank = require("macrobank")
macrobank.setup()


local mason = require("mason")
mason.setup()
local masonLspConfig = require("mason-lspconfig")
masonLspConfig.setup({
	store_path_global = vim.fn.stdpath('config') .. '/macrobank_store.json',
	project_store_paths = nil,


})


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)



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



--Definição do color scheme pastel
vim.cmd.colorscheme "candyland"
