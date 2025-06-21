local function biome_lsp_or_prettier()
  local has_prettier = vim.fs.find({
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.toml",
    "prettier.config.js",
    "prettier.config.cjs",
  }, { upward = true })[1]

  local has_biome = vim.fs.find({
    "biome.json",
    "biome.jsonc",
  }, { upward = true })[1]

  if has_prettier then
    return { "prettier" }
  end

  if has_biome then
    return { "biome-check" }
  end

  return {}
end

local function python_formatter()
  local has_ruff = vim.fs.find({ "ruff.toml" }, { upward = true })[1]

  if has_ruff then
    return { "ruff_format" }
  end

  return {}
end

return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        -- lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        sql = { "sql_formatter" },
        go = { "gofmt" },
        python = python_formatter(),
        javascript = biome_lsp_or_prettier,
        typescript = biome_lsp_or_prettier,
        typescriptreact = biome_lsp_or_prettier,
        javascriptreact = biome_lsp_or_prettier,
        css = biome_lsp_or_prettier,
        html = biome_lsp_or_prettier,
        vue = biome_lsp_or_prettier,
        json = { "biome-check" },
        markdown = biome_lsp_or_prettier,
      },
    }
    return opts
  end,
}
