return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      background = {
        light = "latte",
        dark = "frappe",
      },
      transparent_background = true,
      styles = {
        conditionals = {},
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
