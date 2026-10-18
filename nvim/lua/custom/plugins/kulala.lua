vim.pack.add({
  {
    src = 'https://github.com/mistweaverco/kulala.nvim',
  },
})

require('kulala').setup({
  -- Environment from http-client.env.json.
  default_env = 'default',

  -- Keep the selected environment local to each buffer.
  environment_scope = 'b',

  -- Let Kulala manage its HTTP tree-sitter parser.
  treesitter = {
    enable = true,
    cli_path = 'tree-sitter',
  },

  -- Kulala has its own LSP for .http files.
  lsp = {
    enable = true,

    -- Important:
    -- prevents Kulala from attaching to normal .js/.ts/.lua files.
    -- It will only consider:
    --
    --   *.http.js
    --   *.http.ts
    --   *.http.lua
    --
    enforce_external_script_naming_convention = true,

    -- We already use Neovim's LSP mappings.
    keymaps = false,
  },

  ui = {
    display_mode = 'split',
    split_direction = 'right',

    default_view = 'body',
    winbar = true,

    show_icons = 'on_request',
    show_request_summary = true,
  },

  -- Kulala disables these by default.
  -- Enabling them gives us the complete <leader>R namespace.
  global_keymaps = true,

  global_keymaps_prefix = '<leader>R',
})
