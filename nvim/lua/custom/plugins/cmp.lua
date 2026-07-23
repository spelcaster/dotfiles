local ok, blink = pcall(require, 'blink.cmp')

require('luasnip').setup({
  enable_autosnippets = true,
})

vim.pack.add({
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
})

pcall(function()
  require('luasnip.loaders.from_vscode').lazy_load()
end)

-- Extend/override blink options after Kickstart loads.
blink.setup({
  snippets = {
    preset = 'luasnip',
  },
  sources = {
    -- Global default.
    default = { 'lsp', 'path', 'snippets', 'buffer' },

    -- Java-specific: remove buffer completion so JDTLS owns class completions/imports.
    per_filetype = {
      java = { 'lsp', 'path', 'snippets' },
    },
  },

  keymap = {
    preset = 'default',

    ['<Tab>'] = {
      'select_and_accept',
      'fallback',
    },

    ['<S-Tab>'] = {
      'select_prev',
      'fallback',
    },

    ['<CR>'] = { 'accept', 'fallback' },
    ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-j>'] = { 'select_next', 'snippet_forward', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'snippet_backward', 'fallback' },
  },
})
