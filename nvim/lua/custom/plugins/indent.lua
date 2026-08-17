vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.tabstop = 4           -- visual width of a tab character
vim.opt.shiftwidth = 4        -- indentation width for >>, <<, autoindent
vim.opt.softtabstop = 4       -- spaces inserted/deleted with Tab/Backspace
vim.opt.smartindent = true

vim.pack.add({
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
})

require("ibl").setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      "help",
      "dashboard",
      "lazy",
      "mason",
      "notify",
      "terminal",
    },
  },
})


vim.keymap.set("n", "<Tab>", ">>", {
  desc = "Indent line",
})

vim.keymap.set("n", "<S-Tab>", "<<", {
  desc = "Unindent line",
})

vim.keymap.set("v", "<Tab>", ">gv", {
  desc = "Indent selection",
})

vim.keymap.set("v", "<S-Tab>", "<gv", {
  desc = "Unindent selection",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "o" })
    end,
})
