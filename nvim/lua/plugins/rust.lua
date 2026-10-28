return {
  -- Ensure crates.nvim is properly configured (LazyVim rust extra handles the main config)
  {
    "saecki/crates.nvim",
  },

  -- rustaceanvim configuration (already installed via LazyVim extra)
  {
    "mrcjkb/rustaceanvim",
    opts = {
      -- Keep Neotest's Rust runner on Cargo. `cargo test` is available for every
      -- Rust project and supports the libtest arguments emitted by rust-analyzer.
      tools = {
        enable_nextest = false,
      },
      server = {
        -- Use rustup's proxy so the server follows the project's toolchain,
        -- even when Homebrew's rust-analyzer comes first in PATH.
        cmd = { (vim.env.CARGO_HOME or vim.fn.expand("~/.cargo")) .. "/bin/rust-analyzer" },
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = "all",
              buildScripts = {
                enable = true,
              },
            },
            checkOnSave = true,
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
  },
}
