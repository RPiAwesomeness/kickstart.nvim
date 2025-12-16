return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in current window' })
      vim.keymap.set('n', '<leader>ex', function()
        vim.cmd 'vsplit'
        require('oil').open()
      end)
      vim.keymap.set('n', '<leader>sex', function()
        vim.cmd 'split'
        require('oil').open()
      end)
    end,
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
