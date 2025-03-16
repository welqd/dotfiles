return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform will run multiple formatters sequentially
          python = { 'isort', 'black' },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { 'rustfmt', lsp_format = 'fallback' },
          -- Conform will run the first available formatter
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          markdown = { 'markdownlint-cli2', lsp_format = 'fallback' },
          go = { 'gofmt' }
        },
      })
      vim.keymap.set('n', 'gF', function()
        require('conform').format({ async = true })
      end)
    end,
  },
}
