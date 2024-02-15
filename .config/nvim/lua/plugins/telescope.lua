return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>ft", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>bb", builtin.buffers, {})
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = {
          "venv",
          "__pycache__",
          "requierments*",
          "pyproject.toml",
        },
      },
      pickers = {
        buffers = {
          ignore_current_buffer = true,
          sort_mru = true,
          theme = "dropdown",
          previewer = false,
          initial_mode = "normal",
        },
        live_grep = {
          theme = "dropdown",
        },
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })
  end,
}
