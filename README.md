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


## zsh

### Installation
Note: this will change your default shell.

```bash
cp ~/.zshrc ~/.zshrc_bak

# clone plugins for my config
mkdir -p ~/git/zsh_plugins/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/git/zsh_plugins/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/git/zsh_plugins/zsh-syntax-highlighting
git clone  https://github.com/zsh-users/zsh-autosuggestions ~/git/zsh_plugins/zsh-autosuggestions

cp zsh/zshrc ~/.zshrc
cp zsh/p10k.zsh ~/.p10k.zsh
```

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
Don't forget to type `:PlugInstall` after first launch of neovim.

### Installation, classic install (such as from deb or from source)

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cp neovim/init.vim ~/.config/nvim/init.vim
```

### Installation, flatpack install

```bash
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.var/app/io.neovim.nvim/config/nvim
cp neovim/init.vim ~/.var/app/io.neovim.nvim/config/nvim/init.vim
```
