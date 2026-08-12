require('luasnip').setup({
  enable_autosnippets = true,
})

vim.pack.add({
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
})

pcall(function()
  require('luasnip.loaders.from_vscode').lazy_load()
end)
