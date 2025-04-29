return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      -- Set global fold options
      vim.o.foldcolumn = '1' -- Show fold column
      vim.o.foldlevel = 99 -- Start with all folds open
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Setup nvim-ufo
      require('ufo').setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' } -- Use treesitter and indent as fold providers
        end,
      }

      -- Keybindings for folding
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    end,
  },
}
