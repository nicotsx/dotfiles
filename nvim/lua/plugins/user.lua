return {
  {
    -- Image Preview
    "3rd/image.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
  {
    "jwalton512/vim-blade",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>st", false },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
  },
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },
}
