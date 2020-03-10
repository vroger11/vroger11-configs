# vroger11 shell configurations
My configuration files for multiple shell programs.

## bash

### Installation

```bash
cp ~/.bashrc ~/.bashrc_bak  # create a backup of your previous config
cp bash/bashrc ~/.bashrc
```

### Explanation
[Look here.](http://website.vincent-roger.fr/tips/dev/2020/01/29/improve-bash-terminal-experience.html)

## Tmux

### Installation

Utilities for memory checks + default config:

```bash
cp -r tmux/tmux_scripts ~/.tmux_scripts
cp tmux/tmux.conf ~/.tmux.conf
```

### Explanation
[Look here.](http://website.vincent-roger.fr/tips/dev/2019/09/23/terminal-multiplexers.html)

## Neovim

### Installation

```bash
mkdir -p ~/.config/nvim
cp neovim/init.vim ~/.config/nvim/init.vim
```
