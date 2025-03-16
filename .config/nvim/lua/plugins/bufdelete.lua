return {
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', 'Q', '<CMD>Bdelete<CR>', opts)
    vim.keymap.set('n', '<leader>Q', '<CMD>Bdetele!<CR>', opts)
  end,
}
