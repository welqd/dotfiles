return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        opts = {
            linters_by_ft = {
                markdown = { "vale" },
                css = { "stylelint" },
                lua = { "luacheck" },
                python = { "flake8" },
                go = { "revive" },
            },
        },
        config = function()
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
