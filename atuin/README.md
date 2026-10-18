# Atuin

Configuration for [Atuin](https://atuin.sh/), a replacement for the default shell history.

## What

`config.toml` controls how Atuin stores and searches shell history: search mode, UI style, sync, stats
and keymap behavior. Most options are left at their documented defaults (commented out); only a handful
are set explicitly: `style = "compact"`, `enter_accept = true`, `sync.records = true`, `ai.enabled = true`.

## How

Copy (or symlink) this file to `~/.config/atuin/config.toml`. Atuin itself is wired into the shell from
`zsh/zshrc`, which calls `eval "$(atuin init zsh --disable-up-arrow)"` — this disables Atuin's up-arrow
binding so the native shell history search is used instead, leaving Atuin's own TUI for its default key.

## When

Active any time a command is run in an Atuin-enabled shell: every command is recorded to history, and the
TUI opens on the trigger key to search it.

## Shortcuts

These are Atuin's own default keybindings (not customized in `config.toml`), available while its search
TUI is open:

| Shortcut | Action |
| --- | --- |
| `Ctrl-R` | Open the Atuin history search TUI. |
| `Up` / `Down` | Move the selection; scrolls past the first/last entry exits the TUI. |
| `Enter` | Execute the selected command immediately (`enter_accept = true`). |
| `Tab` | Place the selected command on the prompt for editing instead of running it. |
| `Esc` | Close the TUI and return the original query (`exit_mode = "return-original"`). |
| `Alt-0`..`Alt-9` | Jump directly to one of the first 10 results (numeric shortcuts). |
