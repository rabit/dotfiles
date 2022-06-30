### 安裝
```bash
$ sudo add-apt-repository ppa:neovim-ppa/unstable
$ sudo apt update
$ sudo apt install neovim ripgrep
$ git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1 ; nvim
$ git clone https://github.com/rabit/dotfiles.git $HOME/projects
$ rm -rf $HOME/.config/nvim/lua/custom
$ ln -sf $HOME/projects/dotfiles/neovim/nvchad/custom $HOME/.config/nvim/lua/custom
$ nvim +PlugInstall +qall
```

### 移除
```bash
$ rm -rf ~/.config/nvim
$ rm -rf ~/.local/share/nvim
$ rm -rf ~/.cache/nvim
```
