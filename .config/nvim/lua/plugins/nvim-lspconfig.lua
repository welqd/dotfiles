return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          border = 'single',
        },
      })
    end,
  },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      { 'saghen/blink.cmp' },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig['lua_ls'].setup({ capabilities = capabilities })
      lspconfig['pyright'].setup({ capabilities = capabilities })
      lspconfig['ltex'].setup({ capabilities = capabilities })
      lspconfig['html'].setup({ capabilities = capabilities })
      lspconfig['bashls'].setup({ capabilities = capabilities })
      lspconfig['cssls'].setup({ capabilities = capabilities })
      lspconfig['gopls'].setup({ capabilities = capabilities })
      lspconfig['clangd'].setup({
        cmd = {
          'clangd',
          '--fallback-style=webkit',
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'grr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })
    end,
  },
}
