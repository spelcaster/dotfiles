# zsh

Configuration for [zsh](https://www.zsh.org/), the default login shell.

## What

| File | Purpose |
| --- | --- |
| `profile` | Login-shell profile (sourced by both `~/.profile` and `zshrc`): a few aliases, `PATH`/`KUBE_EDITOR` exports, nvm loading, and auto-attaching tmux on interactive graphical login. |
| `zshrc` | Interactive zsh config: completion, `zsh-autosuggestions`/`zsh-syntax-highlighting`, Starship prompt wiring (switches config on TTY vs. terminal emulator), custom keybindings, a large set of aliases (git, docker, kubectl, eza, navigation), FZF setup, and `zoxide`/`atuin`/`direnv` shell integration. |

## How

Symlink `zshrc` to `~/.zshrc` and `profile` to `~/.profile` (per the root `README.md`'s install steps).
`zshrc` sources `~/.profile`, so both need to be in place. Requires the dependencies listed in the root
`README.md` (atuin, starship, direnv, zoxide, `zsh-autosuggestions`, `zsh-syntax-highlighting`) to already
be installed and on `PATH`.

## When

`profile` runs once per login shell; `zshrc` runs on every new interactive zsh shell (every new terminal
tab/window/pane).

## Shortcuts

### Keybindings — `zshrc`

| Shortcut | Action |
| --- | --- |
| `Ctrl-u` | Toggle autosuggestions on/off. |
| `Ctrl-L` (shift) | Move forward one word (vi-style). |
| `Ctrl-k` | Move up through history matching what's typed so far. |
| `Ctrl-j` | Move down through history matching what's typed so far. |
| `Ctrl-l` | Clear the screen. |
| `Ctrl-e` | Move to end of line. |
| `Ctrl-Left` / `Ctrl-Right` | Move backward/forward one word. |
| `jj` (insert mode) | Enter vi command mode. |

### Aliases — `zshrc`

| Alias | Expands to |
| --- | --- |
| `la` | `tree` |
| `cat` | `bat` |
| `gc` / `gca` | `git commit -m` / `git commit -a -m` |
| `gp` / `gpu` | `git push origin HEAD` / `git pull origin` |
| `gst` | `git status` |
| `glog` | formatted `git log --graph` |
| `gdiff` / `gco` / `gb` / `gba` | `git diff` / `checkout` / `branch` / `branch -a` |
| `gadd` / `ga` | `git add` / `git add -p` |
| `gcoall` | `git checkout -- .` |
| `gr` / `gre` | `git remote` / `git reset` |
| `dco` / `dps` / `dpa` / `dl` / `dx` | `docker compose` / `ps` / `ps -a` / `ps -l -q` / `exec -it` |
| `..` … `......` | `cd` up 1–5 parent directories |
| `v` / `vfzf` | `nvim` / open an fzf-picked file in nvim |
| `nm` | `nmap -sC -sV -oN nmap` |
| `cl` | `clear` |
| `k` / `ka` / `kg` / `kd` / `kdel` / `kl` / `kgpo` / `kgd` / `kc` / `kns` / `ke` / `kcns` | `kubectl` shortcuts (apply/get/describe/delete/logs/exec/context/namespace) |
| `http` | `xh` |
| `l` / `lt` / `ltree` | `eza` listing variants |
| `server` / `tunnel` | `python -m http.server 4445` / `ngrok http 4445` |

Shell functions: `cx` (cd + list), `fcd` (fuzzy-cd into a subdirectory), `f` (fuzzy-pick a file path to the
clipboard), `fv` (fuzzy-pick a file and open it in nvim).

### Aliases — `profile`

| Alias | Expands to |
| --- | --- |
| `ls` | `ls --color=auto` |
| `tailf` | `tail -f` |
| `gcj` | `git commit -m` with a timestamped "annotations" message |
| `vj` | open today's journal note (`vim YYYYMMDD.md`) |
| `poweroff` / `reboot` | run `bin/see_you_space_cowboy.sh` first, then the real command |
