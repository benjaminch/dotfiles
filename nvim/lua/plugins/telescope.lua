return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- Use ripgrep with gitignore respect for better performance on large codebases
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },
      },
      pickers = {
        find_files = {
          -- Use fd for file finding (respects .gitignore by default)
          find_command = {
            "fd",
            "--type", "f",
            "--strip-cwd-prefix",
            "--hidden",
            "-E", ".git",
            "-E", "target",
            "-E", ".terraform",
            "-E", "node_modules",
            "-E", ".vscode",
            "-E", ".idea",
          },
          -- Limit the number of results to prevent slowdowns
          follow = true,
          hidden = true,
        },
      },
    },
  },
}
