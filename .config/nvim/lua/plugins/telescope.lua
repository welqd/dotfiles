return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>ft', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            'venv',
            '__pycache__',
            'requierments*',
            'pyproject.toml',
          },
        },
        pickers = {
          buffers = {
            ignore_current_buffer = true,
            sort_mru = true,
            theme = 'dropdown',
            previewer = false,
            initial_mode = 'normal',
          },
          live_grep = {
            theme = 'dropdown',
          },
          help_tags = {
            theme = 'dropdown',
          },
          find_files = {
            theme = 'dropdown',
            previewer = false,
          },
        },
      })
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}
