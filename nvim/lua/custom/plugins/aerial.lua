vim.pack.add({
  { src = 'https://github.com/stevearc/aerial.nvim' },
})

require('aerial').setup({
  backends = { 'lsp', 'treesitter', 'markdown', 'man' },

  layout = {
    default_direction = 'left',
    width = 40,
  },

  filter_kind = {
    'Class',
    'Constructor',
    'Enum',
    'Function',
    'Interface',
    'Method',
    'Module',
    'Namespace',
    'Package',
    'Property',
    'Struct',
    'Field',
    'Constant',
  },
})

vim.keymap.set('n', '<F4>', '<cmd>AerialToggle!<CR>', { desc = 'Toggle code outline', })
