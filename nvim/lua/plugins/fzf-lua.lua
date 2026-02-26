return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      -- Use fd for file finding (respects .gitignore by default)
      files = {
        cmd = "fd --type f --strip-cwd-prefix --hidden -E .git",
        -- Don't follow symlinks
        follow = false,
        -- Disable preview to prevent hanging on large file lists
        winopts = {
          preview = {
            hidden = "hidden",  -- Disable preview
          },
        },
      },
      -- Use ripgrep for searching
      grep = {
        rg_opts = "--color=never --no-heading --with-filename --line-number --column --smart-case",
      },
      -- Configure LSP symbol search to handle servers that don't support workspace symbols
      lsp = {
        symbols = {
          -- Use document symbols as fallback for servers without workspace symbol support
          icon_map = {},
          symbol_style = 1,
          async_or_timeout = 5000,
        },
      },
    },
  },
}

