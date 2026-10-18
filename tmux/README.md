# tmux

Configuration for [tmux](https://github.com/tmux/tmux/wiki), a terminal multiplexer.

## What

| File | Purpose |
| --- | --- |
| `tmux.conf` | Main config: core options (true color, vi mode-keys, big history/scrollback, top status bar, system clipboard), the [tpm](https://github.com/tmux-plugins/tpm) plugin list (`tmux-sensible`, `tmux-yank`, `tmux-resurrect`/`tmux-continuum`, `tmux-thumbs`, `tmux-fzf`(-url), `tmux-sessionx`, `tmux-floax`, `tmux-gruvbox` theme, `tmux-battery`) and their settings. It sources `tmux.reset.conf` first. |
| `tmux.reset.conf` | Base keybindings, rebuilt from tmux's regular defaults (meant to follow an `unbind-key -a`, now commented out) plus a few personal rebinds (vi-style pane navigation on `h`/`j`/`k`/`l`, `H`/`L` for prev/next window, etc.). |

## How

Copy `tmux.conf` to `~/.config/tmux/tmux.conf` (symlinked by the root `README.md`'s install steps to
`~/.tmux.conf`) and keep `tmux.reset.conf` alongside it at `~/.config/tmux/tmux.reset.conf`, since
`tmux.conf` sources it by that absolute path. Requires [tpm](https://github.com/tmux-plugins/tpm) installed
and plugins fetched with its `prefix + I`.

## When

Active for the lifetime of any tmux server started with this config, from session attach to detach.

## Shortcuts

Prefix key is tmux's default, `Ctrl-b` (not changed here; a `^A` remap is present but commented out).

### Custom bindings — `tmux.reset.conf` (after prefix, unless noted)

| Shortcut | Action |
| --- | --- |
| `Ctrl-x` | Lock the server. |
| `Ctrl-c` | New window, starting in `$HOME`. |
| `Ctrl-d` | Detach from the session. |
| `*` | List clients. |
| `H` / `L` | Previous / next window. |
| `r` | Prompt to rename the current window. |
| `R` | Reload config (`source-file tmux.conf`). |
| `Ctrl-a` | Switch to the last active window. |
| `Ctrl-w` / `w` | List windows. |
| `z` | Toggle zoom on the current pane. |
| `Ctrl-l` / `l` | Refresh the client. |
| `\|` | Split window. |
| `s` | Split window vertically (new pane below), keeping the current path. |
| `v` | Split window horizontally (new pane to the side), keeping the current path. |
| `"` | Choose a window from a list. |
| `h` / `j` / `k` / `l` | Select pane left / down / up / right. |
| `,` / `.` (repeatable) | Resize pane left / right by 20 cells. |
| `-` / `=` (repeatable) | Resize pane down / up by 7 cells. |
| `:` | Open the command prompt. |
| `*` | Toggle synchronize-panes. |
| `P` | Toggle pane border status. |
| `c` | Kill the current pane. |
| `x` | Swap the current pane down. |
| `S` | Choose a session from a list. |
| `K` | Clear the screen. |
| `v` (in copy mode, vi-style) | Begin visual selection. |

### Plugin bindings — `tmux.conf`

| Shortcut | Action |
| --- | --- |
| `prefix + o` | Open [tmux-sessionx](https://github.com/omerxx/tmux-sessionx) session switcher. |
| `Ctrl-y` (inside sessionx) | Open the selection in a new window. |
| `prefix + p` | Open a [tmux-floax](https://github.com/omerxx/tmux-floax) floating pane. |
| `prefix + Ctrl-f` (tmux-fzf default) | Fuzzy-find tmux objects (sessions/windows/panes/commands). |
| tmux-fzf-url default | Open a URL visible on screen via fzf. |
| tmux-thumbs default (`prefix + Space`) | Highlight and copy on-screen text (paths, hashes, URLs, etc.). |
