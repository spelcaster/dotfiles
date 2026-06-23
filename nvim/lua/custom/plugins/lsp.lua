vim.pack.add({
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
  { src = 'https://github.com/ray-x/lsp_signature.nvim' },
  { src = 'https://github.com/ray-x/lsp_signature.nvim' },
  { src = 'https://github.com/stevearc/aerial.nvim' },
})

-- Then configure extra servers here
vim.lsp.config('vtsls', {
  cmd = { 'vtsls', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    '.git',
  },
})

vim.lsp.config('intelephense', {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = {
    'composer.json',
    '.git',
  },
})

vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
  },
  filetypes = {
    'c',
    'cpp',
    'objc',
    'objcpp',
    'cuda',
  },
  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
  },
})

vim.lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    'basedpyrightconfig.json',
    '.git',
  },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
    },
  },
})

require('lsp_signature').setup({
  bind = true,
  hint_enable = false,
  floating_window = true,
  handler_opts = {
    border = 'rounded',
  },
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


vim.keymap.set({ 'n' }, '<C-k>', function() require('lsp_signature').toggle_float_win() end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function() vim.lsp.buf.signature_help() end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set('n', '<F4>', '<cmd>AerialToggle!<CR>', { desc = 'Toggle code outline', })

vim.lsp.enable('basedpyright')
vim.lsp.enable('clangd')
vim.lsp.enable('intelephense')
vim.lsp.enable('vtsls')
