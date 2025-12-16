local version = vim.version()
local header = {
  '                                                  .                 ',
  '                                                 /i`                ',
  '            :h-                                  Nhy`               ',
  '           -mh.                           h.    `Ndho               ',
  '           hmh+                          oNm.   oNdhh               ',
  '          `Nmhd`                        /NNmd  /NNhhd               ',
  '          -NNhhy                      `hMNmmm`+NNdhhh               ',
  '          .NNmhhs              ```....`..-:/./mNdhhh+               ',
  '           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ',
  '           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ',
  '      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ',
  ' .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ',
  ' h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ',
  ' hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ',
  ' /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ',
  '  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ',
  '   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ',
  '     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ',
  '       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ',
  '       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ',
  '       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ',
  '       //+++//++++++////+++///::--                 .::::-------::   ',
  '       :/++++///////////++++//////.                -:/:----::../-   ',
  '       -/++++//++///+//////////////               .::::---:::-.+`   ',
  '       `////////////////////////////:.            --::-----...-/    ',
  '        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ',
  '         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ',
  '           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ',
  '            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``',
  '           s-`::--:::------:////----:---.-:::...-.....`./:          ',
  '          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ',
  '         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ',
  '        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ',
  '                        .-:mNdhh:.......--::::-`                    ',
  '                           yNh/..------..`                          ',
  '                                                                    ',
  'N E O V I M - v ' .. version.major .. '.' .. version.minor,
  '',
}

local center = {
  {
    desc = 'Find File                     ',
    keymap = '',
    key = 'f',
    icon = '  ',
    action = 'Telescope find_files',
  },
  {
    desc = 'Recents',
    keymap = '',
    key = 'r',
    icon = '  ',
    action = 'Telescope oldfiles',
  },

  {
    desc = 'Browse Files',
    keymap = '',
    key = 'b',
    icon = '  ',
    action = 'Oil',
  },

  {
    desc = 'New File',
    keymap = '',
    key = 'n',
    icon = '  ',
    action = 'enew',
  },

  {
    desc = 'Load Last Session',
    keymap = '',
    key = 'L',
    icon = '  ',
    action = 'SessionLoad',
  },

  {
    desc = 'Update Plugins',
    keymap = '',
    key = 'u',
    icon = '  ',
    action = 'Lazy update',
  },

  {
    desc = 'Manage Extensions',
    keymap = '',
    key = 'e',
    icon = '  ',
    action = 'Mason',
  },

  {
    desc = 'Config',
    keymap = '',
    key = 'c',
    icon = '  ',
    action = 'Telescope find_files cwd=~/.config/nvim',
  },
  {
    desc = 'Exit',
    keymap = '',
    key = 'q',
    icon = '  ',
    action = 'exit',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  group = vim.api.nvim_create_augroup('Dashboard_au', { clear = true }),
  callback = function()
    vim.cmd [[
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler fillchars=eob:\
            nnoremap <buffer> <F2> :h news.txt<CR>
        ]]
  end,
})

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    enabled = true,
    keys = { { '<F3>', '<cmd>Dashboard<CR>', { desc = 'Dashboard: open' } } },
    opts = {
      theme = 'doom',
      config = {
        header = header,
        center = center,
        footer = function()
          return {
            'type  :help<Enter>  or  <F1>  for on-line help,  <F2>  news changelog',
            'Startup time: ' .. require('lazy').stats().startuptime .. ' ms',
          }
        end,
      },
    },
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
--
-- return {
--   {
--     'nvimdev/dashboard-nvim',
--     event = 'VimEnter',
--     config = function()
--       require('dashboard').setup {
--         theme = 'doom',
--         header = {},
--         center = {
--           {
--             icon = ' ',
--             icon_hl = 'Title',
--             desc = 'Find File           ',
--             desc_hl = 'String',
--             key = 'b',
--             keymap = 'SPC s f',
--             key_hl = 'Number',
--             key_format = ' %s', -- remove default surrounding `[]`
--             action = 'lua print(2)',
--           },
--           {
--             icon = ' ',
--             desc = 'Find Dotfiles',
--             key = 'f',
--             keymap = 'SPC s n',
--             key_format = ' %s', -- remove default surrounding `[]`
--             action = 'lua print(3)',
--           },
--         },
--         footer = {}, --your footer
--       }
--
--       local g = vim.g
--       g.dashboard_session_directory = '~/.config/nvim/.sessions'
--       g.dashboard_default_executive = 'telescope'
--       g.dashboard_custom_section = {
--         a = { description = { '  Find File                 leader f f' }, command = 'Telescope find_files' },
--         b = { description = { '  Recents                   leader f h' }, command = 'Telescope oldfiles' },
--         c = { description = { '  Find Word                 leader f g' }, command = 'Telescope live_grep' },
--         d = { description = { '  New File                  leader e n' }, command = 'DashboardNewFile' },
--         e = { description = { '  Bookmarks                 leader m  ' }, command = 'Telescope marks' },
--         f = { description = { '  Load Last Session         leader l  ' }, command = 'SessionLoad' },
--         g = { description = { '  Update Plugins            leader u  ' }, command = 'PackerUpdate' },
--         h = { description = { '  Settings                  leader e v' }, command = 'edit $MYVIMRC' },
--         i = { description = { '  Exit                      leader q  ' }, command = 'exit' },
--       }
--
--       g.dashboard_custom_footer = { 'type  :help<Enter>  or  <F1>  for on-line help' }
--       vim.cmd [[
-- augroup dashboard_au
--      autocmd! * <buffer>
--      autocmd User dashboardReady let &l:stl = 'Dashboard'
--      autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
--      autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
--      autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
-- augroup END
-- ]]
--
--       g.dashboard_custom_header = {
--         '            :h-                                  Nhy`               ',
--         '           -mh.                           h.    `Ndho               ',
--         '           hmh+                          oNm.   oNdhh               ',
--         '          `Nmhd`                        /NNmd  /NNhhd               ',
--         '          -NNhhy                      `hMNmmm`+NNdhhh               ',
--         '          .NNmhhs              ```....`..-:/./mNdhhh+               ',
--         '           mNNdhhh-     `.-::///+++////++//:--.`-/sd`               ',
--         '           oNNNdhhdo..://++//++++++/+++//++///++/-.`                ',
--         '      y.   `mNNNmhhhdy+/++++//+/////++//+++///++////-` `/oos:       ',
--         ' .    Nmy:  :NNNNmhhhhdy+/++/+++///:.....--:////+++///:.`:s+        ',
--         ' h-   dNmNmy oNNNNNdhhhhy:/+/+++/-         ---:/+++//++//.`         ',
--         ' hd+` -NNNy`./dNNNNNhhhh+-://///    -+oo:`  ::-:+////++///:`        ',
--         ' /Nmhs+oss-:++/dNNNmhho:--::///    /mmmmmo  ../-///++///////.       ',
--         '  oNNdhhhhhhhs//osso/:---:::///    /yyyyso  ..o+-//////////:/.      ',
--         '   /mNNNmdhhhh/://+///::://////     -:::- ..+sy+:////////::/:/.     ',
--         '     /hNNNdhhs--:/+++////++/////.      ..-/yhhs-/////////::/::/`    ',
--         '       .ooo+/-::::/+///////++++//-/ossyyhhhhs/:///////:::/::::/:    ',
--         '       -///:::::::////++///+++/////:/+ooo+/::///////.::://::---+`   ',
--         '       /////+//++++/////+////-..//////////::-:::--`.:///:---:::/:   ',
--         '       //+++//++++++////+++///::--                 .::::-------::   ',
--         '       :/++++///////////++++//////.                -:/:----::../-   ',
--         '       -/++++//++///+//////////////               .::::---:::-.+`   ',
--         '       `////////////////////////////:.            --::-----...-/    ',
--         '        -///://////////////////////::::-..      :-:-:-..-::.`.+`    ',
--         '         :/://///:///::://::://::::::/:::::::-:---::-.-....``/- -   ',
--         '           ::::://::://::::::::::::::----------..-:....`.../- -+oo/ ',
--         '            -/:::-:::::---://:-::-::::----::---.-.......`-/.      ``',
--         '           s-`::--:::------:////----:---.-:::...-.....`./:          ',
--         '          yMNy.`::-.--::..-dmmhhhs-..-.-.......`.....-/:`           ',
--         '         oMNNNh. `-::--...:NNNdhhh/.--.`..``.......:/-              ',
--         '        :dy+:`      .-::-..NNNhhd+``..`...````.-::-`                ',
--         '                        .-:mNdhh:.......--::::-`                    ',
--         '                           yNh/..------..`                          ',
--         '                                                                    ',
--         '                              N E O V I M                           ',
--       }
--     end,
--   },
-- }
