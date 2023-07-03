

local colors = {
    dark_bg = "#1B1B1B",
    mid_bg = "#222222",

    normal_blue = "#5078DE",
    blue_text = "#DEE7FF",
    command_red = "#AC3A3A",
    command_text = "#FF8C8C",
    visual_purple = "#66378D",
    visual_text = "#C886FF",
    insert_grey = "#6A6A6A",
    insert_text = "#E6E6E6",
    replace_purple = "#4B2D8C",
    replace_text = "#B38FFF",
    inactive_a = "#6A6A6A",
    inactive_text = "#E6E6E6",
    terminal_green = "#579541",
    terminal_text = "#234F1",

    title_text = "#FFFFFF",
    secondary_text = "#7E7E7E",
    tertiary_text = "#3D3D3D",
}


Dangercat = {
  normal = {
    a = {bg = colors.normal_blue, fg = colors.blue_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.normal_blue, fg = colors.title_text, gui = 'bold'}
  },
  insert = {
    a = {bg = colors.insert_grey, fg = colors.insert_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.insert_grey, fg = colors.title_text, gui = 'bold'}
  },
  visual = {
    a = {bg = colors.visual_purple, fg = colors.visual_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.visual_purple, fg = colors.title_text, gui = 'bold'}
  },
  replace = {
    a = {bg = colors.replace_purple, fg = colors.replace_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.replace_purple, fg = colors.title_text, gui = 'bold'}
  },
  command = {
    a = {bg = colors.command_red, fg = colors.command_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.command_red, fg = colors.title_text, gui = 'bold'}
  },
  terminal = {
    a = {bg = colors.terminal_green, fg = colors.terminal_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.terminal_green, fg = colors.terminal_text, gui = 'bold'}
  },
  inactive = {
    a = {bg = colors.inactive_a, fg = colors.inactive_text, gui = 'bold'},
    b = {bg = colors.mid_bg, fg = colors.title_text},
    c = {bg = colors.dark_bg, fg = colors.secondary_text},
    z = {bg = colors.inactive_a, fg = colors.title_text, gui = 'bold'}
  }
}


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = Dangercat,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '█████', right = '███▓▒░  ' } },
    },
    lualine_b = {
        {'branch', 'diff', 'diagnostics', separator = { left = '█████', right = '███▓▒░  ' } },
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {
        {'progress', separator = { left = '█████', right = '███▓▒░  ' } },
    },
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
