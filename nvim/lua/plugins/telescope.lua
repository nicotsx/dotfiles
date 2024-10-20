return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    -- add keymaps for telescope
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    {
      "<leader>sr",
      function()
        require("telescope.builtin").resume({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Resume Last Telescope",
    },
  },
}
