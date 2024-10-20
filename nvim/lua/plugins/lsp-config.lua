local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern("package.json", "tsconfig.json")(fname)
end

local get_biome_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern("biome.json", "biome.jsonc")(fname)
end

local function has_eslint()
  return vim.fs.find({
    ".eslintrc",
    ".eslintrc.json",
    ".eslintrc.yml",
    ".eslintrc.yaml",
    ".eslintrc.json5",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.toml",
  }, { upward = true })[1] ~= nil
end

local function has_biome()
  return vim.fs.find({
    "biome.json",
    "biome.jsonc",
  }, { upward = true })[1] ~= nil
end

local biome_enabled = has_biome()
local eslint_enabled = has_eslint()

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        eslint = {
          enabled = eslint_enabled,
          root_dir = get_root_dir,
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
        biome = {
          enabled = biome_enabled,
          cmd = { "biome", "lsp-proxy" },
          filetypes = {
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "typescript",
            "typescript.tsx",
            "typescriptreact",
            "astro",
            "svelte",
            "vue",
            "css",
          },
          root_dir = get_biome_root_dir,
          single_file_support = false,
        },
        tsserver = {
          root_dir = get_root_dir,
        },
        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },
      },
    },
  },
}
