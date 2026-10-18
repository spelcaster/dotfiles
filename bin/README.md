# bin

Small personal utility scripts, invoked directly rather than through a program's own config directory.

## What

| Script | Purpose |
| --- | --- |
| `check_terminal_colors.py` | Prints the 256-color palette grid to the terminal, so a terminal/theme's color support can be eyeballed. |
| `see_you_space_cowboy.sh` | Prints a cosmic-colored ASCII farewell message. |

## How

Run directly with an interpreter (`python bin/check_terminal_colors.py`, `sh bin/see_you_space_cowboy.sh`), or
place/symlink them on `PATH` (e.g. under `~/.local/bin`, which `zsh/profile` already adds to `PATH`) to run
them by name.

## When

- `check_terminal_colors.py`: run manually after changing a terminal emulator's theme/palette to verify true
  256-color rendering.
- `see_you_space_cowboy.sh`: wired into `zsh/profile`'s `poweroff`/`reboot` aliases, so it runs automatically
  right before the machine powers off or reboots.

No keybindings or shortcuts are defined by these scripts.
