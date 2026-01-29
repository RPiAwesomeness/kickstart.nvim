-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Workaround for files opened via Telescope not properly being detected
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('detect-fold-on-BufEnter', { clear = true }),
  callback = function()
    local fmeth = vim.opt.foldmethod:get()
    if fmeth == 'expr' then
      vim.schedule(function()
        vim.opt.foldmethod = 'expr'
      end)
    elseif fmeth == 'syntax' then
      vim.schedule(function()
        vim.opt.foldmethod = 'syntax'
      end)
    end
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  callback = function()
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname))
end

change_alacritty_padding_augroup = vim.api.nvim_create_augroup('change-alacritty-folding', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
  group = change_alacritty_padding_augroup,
  callback = function()
    Sad('13', 14, 0, '~/.config/alacritty/alacritty.toml')
    Sad('14', 14, 0, '~/.config/alacritty/alacritty.toml')
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  group = change_alacritty_padding_augroup,
  callback = function()
    Sad('13', 0, 14, '~/.config/alacritty/alacritty.toml')
    Sad('14', 0, 14, '~/.config/alacritty/alacritty.toml')
  end,
})
