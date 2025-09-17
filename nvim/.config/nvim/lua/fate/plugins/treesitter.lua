return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            treesitter.setup({
                highlight = {
                    enable = true,
                },
                indent = { enable = true },

                ensure_installed = {
                    "rust",
                    "toml",
                    "c",
                    "cpp",
                    "make",
                    "cmake",
                    "go",
                    "python",
                    "lua",
                    "zig",
                    "sql",
                    "bash",
                    "prisma",
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "svelte",
                    "vue",
                    "graphql",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "vim",
                    "query",
                    "dockerfile",
                    "gitignore",
                    "http",
                    "ron"
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                    },
                },
                additional_vim_regex_highlighting = false,
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        enabled = true,
        ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true,
                    },
                    ["typescriptreact"] = {
                        enable_close = true,
                    },
                },
            })
        end,
    },
}
