return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      markdown = { 'markdownlint-cli2' },
      lua = { 'luacheck' },
      python = { 'ruff' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'TextChanged', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
