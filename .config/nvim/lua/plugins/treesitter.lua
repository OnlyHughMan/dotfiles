return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "java", "lua", "vim", "bash", "python" }, -- Add "java"
            highlight = {
                enable = true, -- Enable highlighting
            },
            indent = {
                enable = true, -- Optional: enable indentation support
            },
        })
    end,
}

