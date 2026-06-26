# Neovim

My personal Neovim configuration. It is built **on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)**:
kickstart provides the base (`init.lua`, sane defaults, core LSP/treesitter/telescope setup), and the files in this
directory live under `lua/custom/` and `ftplugin/` to layer my own plugins, language servers and keymaps on top of it.

Plugins are installed with Neovim's native `vim.pack` (no `lazy.nvim`/`packer` required).

## Layout

| Path | Purpose |
| --- | --- |
| `lua/custom/plugins/plugins.lua` | General editing plugins (theme, git, motions, treesitter, comments, colorizer). |
| `lua/custom/plugins/cmp.lua` | Completion engine (`nvim-cmp`) and snippet sources. |
| `lua/custom/plugins/lsp.lua` | Language servers, signature help and code outline. |
| `lua/custom/plugins/debugger.lua` | Debug Adapter Protocol (DAP) stack. |
| `lua/custom/plugins/indent.lua` | Indentation guides and indent/unindent keymaps. |
| `lua/custom/plugins/copilot.lua` | GitHub Copilot / CodeCompanion (currently commented out / disabled). |
| `ftplugin/java.lua` | Per-buffer Java (`jdtls`) setup, loaded only for Java files. |

## Plugins

### Editing & UI (`plugins.lua`)

| Plugin | What | Why | When |
| --- | --- | --- | --- |
| [vim-sleuth](https://github.com/tpope/vim-sleuth) | Auto-detects `shiftwidth`/`expandtab`. | Match each project's indentation without manual config. | Always (loaded immediately). |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git wrapper. | Stage, diff, blame and commit without leaving the editor. | Git operations. |
| [vim-surround](https://github.com/tpope/vim-surround) | Add/change/delete surrounding pairs. | Quickly edit quotes, brackets and tags. | Text editing. |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | Multiple cursors. | Edit many occurrences at once. | Bulk edits. |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Color scheme (active theme). | Comfortable, high-contrast palette. | Always. |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library. | Shared dependency for other plugins. | As a dependency. |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax parsing. | Accurate highlighting, indentation and text objects. | Always. |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comment toggling. | Comment/uncomment lines and blocks. | Editing. |
| [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua) | Highlights color codes inline. | See CSS/Tailwind colors in place. | Editing styles/markup. |
| [mini.pairs](https://github.com/echasnovski/mini.pairs) | Auto-closes brackets/quotes. | Less typing, balanced pairs. | Always. |
| [emmet-vim](https://github.com/mattn/emmet-vim) | Emmet HTML/CSS abbreviations. | Expand markup quickly. | Lazy-loaded for `html`, `css`, `javascriptreact`, `typescriptreact`, `php`, `blade`. |
| [argonaut.nvim](https://git.sr.ht/~foosoft/argonaut.nvim) | Split/join function arguments. | Reflow argument lists and provide `a`rgument text objects. | Lazy-loaded on `VeryLazy`. |

### Completion & snippets (`cmp.lua`)

| Plugin | What | Why |
| --- | --- | --- |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine. | Drives the popup completion menu. |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source. | Completions from language servers. |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer source. | Complete words from open buffers. |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Path source. | Complete filesystem paths. |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Snippet source. | Feed LuaSnip snippets into cmp. |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection. | Ready-made snippets for many languages. |

### Language servers (`lsp.lua`)

| Plugin / Server | What | Why |
| --- | --- | --- |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | Java language server bridge. | Rich Java tooling via `jdtls`. |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) | Function signature hints. | Show parameter help while typing. |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol outline window. | Navigate classes/methods in a file. |
| `vtsls` | TypeScript/JavaScript server. | JS/TS diagnostics and completion. |
| `intelephense` | PHP server. | PHP diagnostics and completion. |
| `clangd` | C/C++ server. | C/C++/CUDA diagnostics and completion. |
| `basedpyright` | Python server. | Python type-checking and completion. |

> Servers must be installed and available on `PATH` (e.g. `vtsls`, `intelephense`, `clangd`, `basedpyright-langserver`, `jdtls`).

### Debugging (`debugger.lua`)

| Plugin | What | Why |
| --- | --- | --- |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client. | Set breakpoints and step through code. |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugger UI. | Scopes, watches, stacks and REPL panes. |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Inline variable values. | See values next to code while debugging. |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO library. | Dependency for `nvim-dap-ui`. |

### Indentation (`indent.lua`)

| Plugin | What | Why |
| --- | --- | --- |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides. | Visualize indent levels and current scope. |

### Disabled (`copilot.lua`)

The Copilot / [CodeCompanion](https://github.com/olimorris/codecompanion.nvim) setup is committed but **commented out**.
Uncomment the file to enable AI assistance through Copilot.

## Keymaps

Leader key is `<Space>` (kickstart default).

### Editing — `plugins.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Visual | `//` | Toggle comment and keep the selection. |
| Normal | `<leader>a` | Toggle argument split/join (Argonaut). |
| Visual / Operator | `ia` | Inner argument text object. |
| Visual / Operator | `aa` | Outer argument text object. |
| Normal / Visual / Operator | `<leader>n` | Select inner argument. |
| Normal / Visual / Operator | `<leader>p` | Select outer argument. |

### Completion — `cmp.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Insert | `<C-Space>` | Trigger completion. |
| Insert | `<CR>` | Confirm the selected item. |
| Insert / Select | `<C-j>` | Next item, or expand/jump snippet. |
| Insert / Select | `<C-k>` | Previous item, or jump snippet backwards. |

### LSP — `lsp.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<C-k>` | Toggle the floating signature window. |
| Normal | `<leader>k` | Show signature help. |
| Normal | `<F4>` | Toggle the Aerial code outline. |

### Indentation — `indent.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<Tab>` | Indent the current line. |
| Normal | `<S-Tab>` | Unindent the current line. |
| Visual | `<Tab>` | Indent the selection (keeps selection). |
| Visual | `<S-Tab>` | Unindent the selection (keeps selection). |

### Java — `ftplugin/java.lua` (buffer-local, Java files only)

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<leader>jo` | Organize imports. |
| Normal | `<leader>jv` | Extract variable. |
| Visual | `<leader>jm` | Extract method. |

## kickstart.nvim

This configuration assumes the **latest version of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)** as
its base. Staying on the most recent kickstart is **encouraged**: it tracks current Neovim APIs (e.g. the modern
`vim.lsp.config`/`vim.lsp.enable` used here), ships security and bug fixes, and keeps the base config aligned with
upstream defaults so the custom overlay in this directory keeps working. Before adding or changing plugins, update
kickstart first and re-apply the files from `lua/custom/` and `ftplugin/` on top of it.
