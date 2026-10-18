# Ghostty

Configuration for [Ghostty](https://ghostty.org/), a GPU-accelerated terminal emulator.

## What

`config.ghostty` sets window size, font (IBM Plex Mono with Nerd Font fallbacks), the Gruvbox Dark theme
and a faint background image, tab bar behavior, a large scrollback buffer, and custom keybindings for tabs
and splits. `resources/imgs/ttybg.png` is the background image it references.

## How

Copy (or symlink) `config.ghostty` to `~/.config/ghostty/config.ghostty`, and keep `resources/imgs/ttybg.png`
alongside it at the same relative path, since the config points to it with
`~/.config/ghostty/resources/imgs/ttybg.png`.

## When

Active for the lifetime of any Ghostty window/session, from the moment the terminal is launched.

## Shortcuts

Custom keybindings defined in `config.ghostty` (on top of Ghostty's own defaults):

| Shortcut | Action |
| --- | --- |
| `Ctrl+Shift+T` | Open a new tab. |
| `Ctrl+Shift+W` | Close the current tab. |
| `Ctrl+Tab` | Go to the next tab. |
| `Ctrl+Shift+Tab` | Go to the previous tab. |
| `Ctrl+Shift+'` | New split to the right. |
| `Ctrl+Shift+5` | New split downward. |
| `Alt+Left` / `Alt+Right` / `Alt+Up` / `Alt+Down` | Move focus to the split in that direction. |
| `Shift+Page Up` / `Shift+Page Down` | Scroll the current pane up/down a page. |
| `Shift+Enter` | Send a literal newline (`ESC [ 13 ; 2 u`) instead of submitting, for multi-line input in some programs. |
