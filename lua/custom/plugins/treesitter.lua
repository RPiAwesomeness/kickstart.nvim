return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    branch = 'main',
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    init = function()
      local ensureInstalled =
        { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'typescript', 'tsx', 'javascript', 'jsx' } -- (list of your parsers)
      local alreadyInstalled = require('nvim-treesitter.config').get_installed()
      vim.defer_fn(function()
        require('nvim-treesitter').install(ensureInstalled)
      end, 1000)
      require('nvim-treesitter').update()

      -- auto-start highlights & indentation
      vim.api.nvim_create_autocmd('FileType', {
        desc = 'User: enable treesitter highlighting',
        callback = function(ctx)
          -- highlights
          local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

          -- indent
          local noIndent = {}
          if hasStarted and not vim.list_contains(noIndent, ctx.match) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  {
    {
      'MeanderingProgrammer/treesitter-modules.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter' },
      opts = {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<A-o>',
            node_incremental = '<A-o>',
            scope_incremental = '<A-O>',
            node_decremental = '<A-i>',
          },
        },
      },
    },
  },
}
