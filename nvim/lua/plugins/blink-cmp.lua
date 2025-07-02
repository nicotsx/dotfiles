return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      -- disable the keymap to grep files
      { "<leader>/", false },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = { border = "single" },
        documentation = { window = { border = "single" } },
        ghost_text = {
          enabled = false,
        },
      },
      signature = { window = { border = "single" } },
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      sources = {
        default = { "lsp" },
        providers = {
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            enabled = true,
          },
          snippets = {
            name = "Snippets",
            module = "blink.cmp.sources.snippets",
            enabled = false,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
        },
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          "select_next",
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },
        ["<C-f>"] = {},
        ["¬"] = {
          function(cmp)
            cmp.show({ providers = { "lsp" } })
          end,
        },
      },
    },
  },
}
