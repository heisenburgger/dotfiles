vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-vinegar",
	"jiangmiao/auto-pairs",
	"tpope/vim-commentary",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		'nvim-telescope/telescope.nvim', 
		dependencies = { 
			'nvim-lua/plenary.nvim' 
		}
	}
})

vim.opt.relativenumber = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.laststatus = 0

vim.cmd[[colorscheme tokyonight]]
vim.cmd('syntax off')

require("telescope").setup{
	pickers = {
		find_files = {
			previewer = false
		},
		live_grep = {
			previewer = false
		},
		buffers = {
			previewer = false
		},
	}
}

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>e', builtin.find_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', builtin.buffers, {})
