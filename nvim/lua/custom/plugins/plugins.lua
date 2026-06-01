-- Native Neovim vim.pack version of your lazy.nvim plugin spec.
-- Requires Neovim with vim.pack support.
-- Put this somewhere sourced by your config, for example:
--   ~/.config/nvim/lua/custom/plugins.lua
-- and call:
--   require('custom.plugins')

local gh = function(repo)
  return 'https://github.com/' .. repo
end

local packadd = function(name)
  vim.cmd.packadd(name)
end

-- Plugins that should be available immediately.
vim.pack.add({
  gh('tpope/vim-sleuth'),
  gh('tpope/vim-fugitive'),
  gh('tpope/vim-surround'),
  { src = gh('mg979/vim-visual-multi'), version = 'master' },
  gh('ellisonleao/gruvbox.nvim'),
  gh('github/copilot.vim'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-treesitter/nvim-treesitter'),
  { src = gh('olimorris/codecompanion.nvim'), version = 'v17.33.0' },
  gh('numToStr/Comment.nvim'),
  gh('NvChad/nvim-colorizer.lua'),
}, { load = true })

-- Plugins loaded manually/lazily.
vim.pack.add({
  gh('mattn/emmet-vim'),
  'https://git.sr.ht/~foosoft/argonaut.nvim',
}, { load = false })

-- Theme
vim.cmd.colorscheme('gruvbox')

-- codecompanion.nvim
require('codecompanion').setup({
  strategies = {
    chat = { adapter = 'copilot' },
    inline = { adapter = 'copilot' },
    agent = { adapter = 'copilot' },
  },
})

-- Comment.nvim
require('Comment').setup({})

-- nvim-colorizer.lua
require('colorizer').setup({
  user_default_options = {
    names = true,
    RGB = true,
    RRGGBB = true,
    rgb_fn = true,
    hsl_fn = true,
    tailwind = true,
    mode = 'background', -- or "virtualtext"
  },
})

-- emmet-vim: lazy-load on selected filetypes.
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'css', 'javascriptreact', 'typescriptreact', 'php', 'blade' },
  once = true,
  callback = function()
    packadd('emmet-vim')
  end,
})

-- argonaut.nvim: approximate lazy.nvim's `event = "VeryLazy"`.
vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  once = true,
  callback = function()
    packadd('argonaut.nvim')

    require('argonaut').setup({
      brace_last_indent = false,
      brace_last_wrap = true,
      brace_pad = false,
      comma_last = false,
      comma_prefix = false,
      comma_prefix_indent = false,
      limit_cols = 512,
      limit_rows = 64,
      by_filetype = {
        go = { comma_last = true },
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map('n', '<leader>a', ':<c-u>ArgonautToggle<cr>', opts)
    map({ 'x', 'o' }, 'ia', ':<c-u>ArgonautObject inner<cr>', opts)
    map({ 'x', 'o' }, 'aa', ':<c-u>ArgonautObject outer<cr>', opts)
    map({ 'x', 'o', 'n' }, '<leader>n', ':<c-u>ArgonautObject inner<cr>', opts)
    map({ 'x', 'o', 'n' }, '<leader>p', ':<c-u>ArgonautObject outer<cr>', opts)
  end,
})

-- If you do not already emit this elsewhere, this mimics lazy.nvim's VeryLazy phase.
vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds('User', { pattern = 'VeryLazy', modeline = false })
    end)
  end,
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

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
    },
  },
})

vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('intelephense')
vim.lsp.enable('vtsls')
