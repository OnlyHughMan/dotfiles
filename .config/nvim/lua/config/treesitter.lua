return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "java", "lua", "vim", "bash", "python", "glimmer_typescript", "glimmer_javascript" },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            modules = {},
            highlight = {
              enable = true,
              disable = {},
            },
            indent = { enable = true },
            additional_vim_regex_highlighting = false,
        })
    end,
}
