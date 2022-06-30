### 安裝
```bash
$ sudo add-apt-repository ppa:neovim-ppa/unstable
$ sudo apt update
$ sudo apt install neovim ripgrep build-essential
$ git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1 ; nvim
$ git clone https://github.com/rabit/dotfiles.git $HOME/projects/dotfiles
$ ln -sf $HOME/projects/dotfiles/neovim/nvchad/custom $HOME/.config/nvim/lua/custom
```

### 移除
```bash
$ rm -rf ~/.config/nvim
$ rm -rf ~/.local/share/nvim
$ rm -rf ~/.cache/nvim
```
