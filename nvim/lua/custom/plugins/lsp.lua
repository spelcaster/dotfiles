local ok, blink = pcall(require, 'blink.cmp')

vim.lsp.config('*', {
  capabilities = blink.get_lsp_capabilities()
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

vim.lsp.enable('basedpyright')
vim.lsp.enable('clangd')
vim.lsp.enable('intelephense')
vim.lsp.enable('vtsls')
