vim.pack.add({
  {
    src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim',
  },
})

local telescope = require('telescope')

telescope.setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      depth = 10,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>nf', function()
  telescope.extensions.file_browser.file_browser({
    path = vim.fn.getcwd(),
    cwd = vim.fn.getcwd(),
    files = false,
    depth = 10,
    respect_gitignore = true,
  })
end, {
  desc = '[N]ew [F]ile',
})

local telescopeBuiltin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', telescopeBuiltin.find_files, {
  desc = 'Find files',
})

vim.keymap.set('n', '<leader>sf', function()
  telescopeBuiltin.find_files({
    cwd = vim.fn.expand('%:p:h'),
  })
end, {
  desc = 'Find files in current directory',
})
