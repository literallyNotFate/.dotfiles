return {
    {
        "datsfilipe/vesper.nvim",
        opts = {
            transparent = false,
            italics = {
                comments = false,
                keywords = false,
                functions = false,
                strings = false,
                variables = false,
            },
            overrides = {},
            palette_overrides = {}
        },
        config = function(_, opts)
            require("vesper").setup(opts)
            vim.cmd.colorscheme("vesper")
        end,
    }
}

