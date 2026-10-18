# Starship

Configuration for [Starship](https://starship.rs/), a cross-shell prompt.

## What

| File | Purpose |
| --- | --- |
| `starship.toml` | Full prompt for regular terminal emulators: Gruvbox-themed segmented prompt showing OS, username, directory, git branch/status, per-language version (C/C++, Rust, Go, Node, Bun, PHP, Java, Kotlin, Haskell, Python), Docker/Conda/Pixi context and the time. |
| `tty.toml` | Minimal fallback prompt for a plain Linux virtual console (TTY): username, hostname, directory, git branch/status, no icons, no colors beyond bold/basic ANSI. |

## How

Copy (or symlink) both files to `~/.config/starship/`. Which one is active is decided by `zsh/zshrc`: it
sets `STARSHIP_CONFIG` to `tty.toml` when `$TERM == "linux"` (a bare TTY, where Nerd Font icons wouldn't
render) and to `starship.toml` otherwise, then runs `eval "$(starship init zsh)"`.

## When

Rendered on every new prompt line, in every interactive shell.

No keybindings or shortcuts are configured here; Starship only renders the prompt text, it does not bind
keys.
