return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"clangd",
				"rust_analyzer",
				"gopls",
				"ts_ls",
				"zls",
				"pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"clang-format",
				"gofumpt",
				"goimports",
				"black",

				"biome",
				"ruff",

				"codelldb",
				"debugpy",
				"delve",
				"js-debug-adapter",
			},
		})
	end,
}
