return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  config = function()
    require('blink.cmp').setup({

      keymap = {
        preset = 'default',
        ['<C-m>'] = { 'select_and_accept', 'fallback' },
      },
      cmdline = {
        enabled = false,
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= 'cmdline'
          end,
        },
      },
      -- opts_extend = { 'sources.default' },
    })
  end,
}

