# Neovim

My personal Neovim configuration. It is built **on top of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)**:
kickstart provides the base (`init.lua`, sane defaults, core LSP/treesitter/telescope/blink.cmp setup), and the files in this
directory live under `lua/custom/` and `ftplugin/` to layer my own plugins, language servers and keymaps on top of it.

Plugins are installed with Neovim's native `vim.pack` (no `lazy.nvim`/`packer` required).

## Layout

| Path | Purpose |
| --- | --- |
| `lua/custom/plugins/init.lua` | Entry point. Requires every module below **in a fixed order** (order matters, see comments in the file). |
| `lua/custom/plugins/plugins.lua` | General editing plugins (theme, git, motions, treesitter, comments, colorizer, line numbers). |
| `lua/custom/plugins/telescope.lua` | Telescope file-browser extension plus custom find-files keymaps. |
| `lua/custom/plugins/aerial.lua` | Symbol outline window (`aerial.nvim`). |
| `lua/custom/plugins/cmp.lua` | Snippet engine config (LuaSnip) and the `friendly-snippets` collection. |
| `lua/custom/plugins/lsp.lua` | Extra language servers (TS/JS, PHP, C/C++, Python) and generic LSP code-action keymaps. |
| `lua/custom/plugins/lsp/java.lua` | `nvim-jdtls` install + `JavaLSP.setup()`, the Java LSP bootstrap used by `ftplugin/java.lua`. |
| `lua/custom/plugins/debugger.lua` | Debug Adapter Protocol (DAP) stack. |
| `lua/custom/plugins/indent.lua` | Indentation options, indent guides and indent/unindent keymaps. |
| `lua/custom/plugins/copilot.lua` | GitHub Copilot / CodeCompanion (currently commented out / disabled). |
| `ftplugin/java.lua` | Calls `require('custom.plugins.lsp.java').setup()`, loaded only for Java files. |

## Plugins

### Editing & UI (`plugins.lua`)

Also sets `number`/`relativenumber` for line numbers.

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

### Telescope extension (`telescope.lua`)

| Plugin | What | Why | When |
| --- | --- | --- | --- |
| [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) | File browser extension for Telescope, hijacks `netrw`. | Create/rename/delete files and browse the tree without leaving Telescope. | `<leader>nf`. |

This file also rebinds two core `find_files` pickers (see keymaps below) on top of the base kickstart Telescope setup.

### Code outline (`aerial.lua`)

| Plugin | What | Why | When |
| --- | --- | --- | --- |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol outline window (LSP/treesitter/markdown/man backends). | Navigate classes/methods/functions in the current file. | `<F4>`. |

### Completion & snippets (`cmp.lua`)

Completion itself (`blink.cmp`) comes from the kickstart base; this file only configures the snippet engine on top of it.

| Plugin | What | Why | When |
| --- | --- | --- | --- |
| LuaSnip | Snippet engine. | Configured here with `enable_autosnippets = true`. | Always (provided by kickstart base). |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection. | Ready-made snippets for many languages, loaded via LuaSnip's VS Code loader. | Always. |

### Language servers (`lsp.lua` + `lsp/java.lua`)

`lsp.lua` doesn't install a plugin itself — it configures four extra servers on top of kickstart's built-in LSP client and
wires generic code-action keymaps. `lsp/java.lua` installs `nvim-jdtls` and exposes `JavaLSP.setup()`.

| Plugin / Server | What | Why |
| --- | --- | --- |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | Java language server bridge. | Rich Java tooling via `jdtls` (started from `ftplugin/java.lua`). |
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

> No keymaps or adapter configuration are wired up in this file yet — the plugins are installed but not yet set up.

### Indentation (`indent.lua`)

Also sets indentation options: `expandtab`, `tabstop=4`, `shiftwidth=4`, `softtabstop=4`, `smartindent`.

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

### Telescope — `telescope.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<leader>nf` | Open the file browser (Telescope file-browser) rooted at the cwd. |
| Normal | `<C-p>` | Find files. |
| Normal | `<leader>sf` | Find files starting from the current buffer's directory. |

### Code outline — `aerial.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<F4>` | Toggle the Aerial code outline. |

### LSP — `lsp.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<leader>lca` | Trigger a code action. |
| Normal | `<leader>lum` | Run the code action whose title contains "unimplemented methods". |

### Indentation — `indent.lua`

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<Tab>` | Indent the current line. |
| Normal | `<S-Tab>` | Unindent the current line. |
| Visual | `<Tab>` | Indent the selection (keeps selection). |
| Visual | `<S-Tab>` | Unindent the selection (keeps selection). |

### Java — `lsp/java.lua` via `ftplugin/java.lua` (Java files only)

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `<leader>jo` | Organize imports. |
| Normal | `<leader>jv` | Extract variable. |
| Visual | `<leader>jx` | Extract method. |
| Normal | `<leader>jm` | Move the current file to another package (prompts for destination). |
| Normal | `<leader>lum` | Run the "override" code action to add unimplemented methods (overrides the generic `lsp.lua` binding above for Java buffers). |

> `<leader>jo`, `<leader>jv` and `<leader>jx` are set with `buffer = true` (strictly buffer-local); `<leader>lum` is re-bound
> globally each time a Java file's LSP starts.

## kickstart.nvim

This configuration assumes the **latest version of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)** as
its base. Staying on the most recent kickstart is **encouraged**: it tracks current Neovim APIs (e.g. the modern
`vim.lsp.config`/`vim.lsp.enable` and `blink.cmp` used here), ships security and bug fixes, and keeps the base config
aligned with upstream defaults so the custom overlay in this directory keeps working. Before adding or changing plugins,
update kickstart first and re-apply the files from `lua/custom/` and `ftplugin/` on top of it.
