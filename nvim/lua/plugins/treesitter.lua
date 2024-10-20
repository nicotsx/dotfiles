return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      enable = true,
      disable = function()
        return vim.b.large_buf
      end,
    },
  },
}
