return {
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
          },
        },
      },
      keymap = {
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return
            end
            return true
          end,
          "select_next",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return
            end
            return true
          end,
          "select_prev",
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
