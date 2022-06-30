### 安裝
```bash
$ sudo apt install zsh
$ chsh -s $(which zsh)
$ wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
$ echo "zmodule romkatv/powerlevel10k" >> $HOME/.zimrc
$ zimfw install
$ p10k configure
$ git clone https://github.com/rabit/dotfiles.git $HOME/projects/dotfiles
$ ln -sfn $HOME/projects/dotfiles/zsh/zshenv $HOME/.zshenv
```
### 參考
- [zimfw/zimfw: Zim: Modular, customizable, and blazing fast Zsh framework](https://github.com/zimfw/zimfw#installation)
- [用 zsh + zim + powerlevel10k 讓你的 Terminal 潮又快 · dw's 小站](https://dwye.dev/post/zsh-zim-powerlevel10k/)
- [打造順眼的 Terminal — zsh + zim. 身為一個使用 mac 的開發者，原生的 Terminal… | by Sean Chou | Recording everything | Medium](https://medium.com/%E6%8A%80%E8%A1%93%E7%AD%86%E8%A8%98/%E6%89%93%E9%80%A0%E9%A0%86%E7%9C%BC%E7%9A%84-terminal-zsh-zim-f8a9c504ffd)

