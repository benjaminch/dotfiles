return {
  -- Catppuccin - Best for Rust development
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        mason = true,
        neotree = true,
        telescope = {
          enabled = true,
        },
        which_key = true,
      },
    },
  },

  -- Kanagawa - Disabled to prevent conflicts
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    enabled = false,
  },

  -- Tokyo Night - Disabled to prevent conflicts
  {
    "folke/tokyonight.nvim",
    lazy = true,
    enabled = false,
  },

  -- Cyberdream - Disabled to prevent conflicts
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    enabled = false,
  },

  -- Configure LazyVim to load your preferred theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
