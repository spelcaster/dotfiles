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
