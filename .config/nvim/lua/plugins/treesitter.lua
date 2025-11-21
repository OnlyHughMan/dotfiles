return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "vim", "bash", "python" },
            highlight = {
                enable = true, -- Enable highlighting
            },
            indent = {
                enable = true, -- Optional: enable indentation support
            },
        })
    end,
}

