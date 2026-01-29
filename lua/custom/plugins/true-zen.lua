return {
  'Pocco81/true-zen.nvim',
  opts = {},
  keys = {

    {
      '<leader>zf',
      mode = { 'n' },
      function()
        require('true-zen').focus()
      end,
      desc = 'TrueZen Focus',
      noremap = true,
    },
    {
      '<leader>zm',
      mode = { 'n' },
      function()
        require('true-zen').minimalist()
      end,
      desc = 'TrueZen Minimalist (hide bars)',
      noremap = true,
    },
    {
      '<leader>za',
      mode = { 'n' },
      function()
        require('true-zen').ataraxis()
      end,
      desc = 'TrueZen Atraxis',
      noremap = true,
    },
    {
      '<leader>zn',
      mode = { 'v' },
      function()
        local first = 0
        local last = vim.api.nvim_buf_line_count(0)
        require('true-zen').narrow(first, last)
      end,
      desc = 'TrueZen narrow',
      noremap = true,
    },
    {
      '<leader>zn',
      mode = { 'v' },
      function()
        local first = vim.fn.line 'v'
        local last = vim.fn.line '.'
        require('true-zen').narrow(first, last)
      end,
      desc = 'Narrow',
      noremap = true,
    },
  },
}
