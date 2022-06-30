# neovim
- 相關資料路徑
  - 設定檔："${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
  - 資源檔： "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim

## 安裝
- neovim
    ```bash
    $ sudo add-apt-repository ppa:neovim-ppa/stable
    $ sudo apt-get update
    $ sudo apt-get install neovim
    $ curl -fLo "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
- 字型
  下載 [Fira Code 含 nerd, powerline](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
  若希望包含VSCode codicon，參考[给nerdfont 打字体补丁（macos）并且给nvim-cmp添加vscode-icon](https://blog.csdn.net/Leiyi_Ann/article/details/123029132)

## 設定


### color scheme
中文手動安裝色彩檔路徑："${XDG_CONFIG_HOME:-$HOME/.config}"/nvim/colors

#### 通用主題
- [catppuccin: 😸 Soothing pastel theme for the high-spirited!](https://github.com/catppuccin/catppuccin)
- [Nord](https://www.nordtheme.com/)

#### 傳統 vim 主題

#### 支援treesitter主題
- one dark
    - [onedarkpro.nvim: 🎨 OneDarkPro theme for Neovim. Completely customisable colors, styles and highlights.](https://github.com/olimorris/onedarkpro.nvim)
    - [onenord.nvim: 🏔️ A Neovim theme that combines the Nord and Atom One Dark color](https://github.com/rmehri01/onenord.nvim)
    - [onedark.vim: A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.](https://github.com/joshdick/onedark.vim)
    - [onedark.nvim: One dark and light colorscheme for neovim based on Atom's One Dark and Light theme.](https://github.com/navarasu/onedark.nvim)
- toyo dark
    - [tokyonight.nvim: 🏙 A clean, dark Neovim theme with support for lsp, treesitter and lots of plugins](https://github.com/folke/tokyonight.nvim)
    - [tokyodark.nvim: A clean dark theme written in lua for neovim 0.5.](https://github.com/tiagovla/tokyodark.nvim)
- [sonokai: High Contrast & Vivid Color Scheme based on Monokai Pro](https://github.com/sainnhe/sonokai)
- [oceanic-next: Oceanic Next theme for neovim](https://github.com/mhartington/oceanic-next)
- [gruvbox.nvim: Lua port of the most famous vim colorscheme](https://github.com/ellisonleao/gruvbox.nvim)

#### 相關工具
- [vim-colortemplate: The Toolkit for Vim Color Scheme Designers!](https://github.com/lifepillar/vim-colortemplate)
- [nvim-colorizer.lua: The fastest Neovim colorizer.](https://github.com/norcalli/nvim-colorizer.lua)

## Plugin
安裝路徑："${XDG_CONFIG_HOME:-$HOME/.config}"/nvim/plugged

### vim-go

### coc
事先須安裝 nodejs，版本至少為 nodejs 12，使用 nvm 來安裝不同版本的 nodejs，nvm 安裝的 nodejs 放在 $HOME/.nvm

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# 讓 nvm 相關設定生效
$ source ~/.bashrc
# 若發生 N/A 代表curl出錯，可能是憑證有問題，考虑修改~/.nvm/nvm.sh，加上 --insecure
$ nvm list-remote
$ nvm list
# 安裝 v.16 lts 版本
$ nvm install lts/gallium
# 切換版本
$ nvm use v16.14.0
```

### nvim-cursorline
修改 .config/nvim/plugged/nvim-cursorline/lua/nvim-cursorline.lua 將 g.cursorword_highlight ~= false 改為 g.cursorword_highlight ~= 0

### vim-airline
    在 init.vim 加入 let g:airline_powerline_fonts = 1，可啟用 powerline 字符

### nvim-treesitter
- 部分 Parser 需要依賴 treesitter，需先安裝 [tree-sitter/tree-sitter: An incremental parsing system for programming tools](https://github.com/tree-sitter/tree-sitter)
- BUG: [File opened with Telescope: find_files can't be folded (E490: No fold found) · Issue #699 · nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim/issues/699)

### nvim-telescope
需安裝
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd#installation)

### 已安裝需詳細設定
- [telescope.nvim: Find, Filter, Preview, Pick. All lua, all the time.](https://github.com/nvim-telescope/telescope.nvim#customization)

### 待測Plugins

#### LSP 相關
- [nvim-lspconfig Wiki](https://github.com/neovim/nvim-lspconfig/wiki/Linting)
- [null-ls.nvim: Use Neovim as a language server to inject LSP diagnostics, code actions](https://github.com/jose-elias-alvarez/null-ls.nvim)

#### Others
- [mkdnflow.nvim: Tools for markdown notebook navigation and management](https://github.com/jakewvincent/mkdnflow.nvim)
- [neoformat: A (Neo)vim plugin for formatting code.](https://github.com/sbdchd/neoformat)
- [todo-comments.nvim: ✅ Highlight, list and search todo comments in your projects](https://github.com/folke/todo-comments.nvim)
- [vim-matchup: even better % navigate and highlight matching words modern matchit and matchparen](https://github.com/andymass/vim-matchup)
- [wilder.nvim: A more adventurous wildmenu](https://github.com/gelguy/wilder.nvim)
- [tabout.nvim: tabout plugin for neovim](https://github.com/abecodes/tabout.nvim)
- [lsp-colors.nvim: 🌈 Plugin that creates missing LSP diagnostics highlight groups](https://github.com/folke/lsp-colors.nvim)
- [goto-preview: A small Neovim plugin for previewing definitions using floating windows.](https://github.com/rmagatti/goto-preview)
- [mapx.nvim: 🗺 A better way to create key mappings in Neovim.](https://github.com/b0o/mapx.nvim)
- [tidy.nvim: A small Neovim plugin to remove trailing whitespace on every save](https://github.com/mcauley-penney/tidy.nvim)
- [nvim-peekup: 👀 dynamically show content of vim registers](https://github.com/gennaro-tedesco/nvim-peekup)
- [registers.nvim: 📑 Neovim plugin to preview the contents of the registers](https://github.com/tversteeg/registers.nvim)
- [marks.nvim: A better user experience for viewing and interacting with Vim marks.](https://github.com/chentau/marks.nvim)
- [nvim-lsputils: Better defaults for nvim-lsp actions](https://github.com/RishabhRD/nvim-lsputils)
- [nvim-hlslens: Hlsearch Lens for Neovim](https://github.com/kevinhwang91/nvim-hlslens)
- [cheatsheet.nvim: A cheatsheet plugin for neovim with bundled cheatsheets for the editor](https://github.com/sudormrfbin/cheatsheet.nvim)
- [nvim-code-action-menu: Pop-up menu for code actions to show meta-information and diff preview](https://github.com/weilbith/nvim-code-action-menu)
- [pretty-fold.nvim: Foldtext customization and folded region preview in Neovim](https://github.com/anuvyklack/pretty-fold.nvim)
- [nvim-gomove: A complete plugin for moving and duplicating blocks and lines.](https://github.com/booperlv/nvim-gomove)

## TIPS
- [Vim Cheat Sheet](https://vim.rtorr.com/lang/zh_tw)
- [聊聊你在 vim 常用的移動方式 - amikai's blog](https://amikai.github.io/2020/10/03/vim-commonly-used-motion/)
- [你應該擴充的 text object - amikai's blog](https://amikai.github.io/2020/09/22/vim-text-object/)
- [VIM学习笔记 在文本对象间移动(motion-object) - 知乎](https://zhuanlan.zhihu.com/p/176961929)
- [vim-surround使用指南，vim-surround如何使用](https://gist.github.com/wilon/ac1fc66f4a79e7b0c161c80877c75c94)

## BUG
- [window terminal 輸入法選字區背景透明，選字行為也有問題](https://github.com/microsoft/terminal/issues/6192)
- tabby terminal
  - [無法使用滑鼠](https://github.com/Eugeny/tabby/issues/290)
  - 須關閉GPU加速字型顯示才沒有鬼影

## 參考文獻
1. [Nvim documentation: usr_05](https://neovim.io/doc/user/usr_05.html)
2. [Neovim - ArchWiki](https://wiki.archlinux.org/title/Neovim)
3. [Setting Up Neovim on WSL2. Setting up Neovim on WSL2](https://evancalz.medium.com/setting-up-neovim-on-wsl2-bf634cac435f)
4. [learn-neovim-lua: 📜 学习 Neovim 全配置， 逃离 VSCode。](https://github.com/nshen/learn-neovim-lua)
5. [NeoVim 打造 Golang 开发环境 | 一蓑烟雨](https://www.amistyrain.com/post/2020/07/25/neovim/)
6. [vim使用coc配置GoLang开发环境 – 李无知](http://liwuzhi.art/?p=599)
7. [Jetbrains到期？试试 coc.nvim 征服 vim/neovim 补全[视频] - 知乎](https://zhuanlan.zhihu.com/p/102306124)
8. [NVIM 配置打造 - SR丶 - 博客园](https://www.cnblogs.com/SR-Program/p/15773546.html)
9. [Programming Go in Neovim | Terminal, command line, code](https://www.getman.io/posts/programming-go-in-neovim/)
10. [Use Neovim features, such as LSP and tree-sitter, and develop Go code](https://golangexample.com/use-neovim-features-such-as-built-in-lsp-and-tree-sitter-and-develop-go-code/)
11. VSCode-like LSP Completion
  - https://code.visualstudio.com/docs/editor/intellisense
  - https://www.nerdfonts.com/cheat-sheet
  - https://github.com/onsails/lspkind-nvim/blob/master/lua/lspkind/init.lua
  - https://www.youtube.com/watch?v=WM7juLKcbV8
  - http://shukra.cedt.iisc.ernet.in/edwiki/EmSys:LSP_Completion_Symbols_in_CoC
  - https://www.jianshu.com/p/4302f7bb0b14
  - https://www.reddit.com/r/neovim/comments/m1tmfh/lsp_kind_symbols_in_coc/
  - codicon font
    - https://microsoft.github.io/vscode-codicons/dist/codicon.html
    - https://github.com/mortepau/codicons.nvim
    - https://raw.githubusercontent.com/microsoft/vscode-codicons/main/dist/codicon.csv
12. neovim kickstart configuration
  - https://github.com/nshen/learn-neovim-lua
  - https://github.com/nvim-lua/kickstart.nvim
  - https://github.com/googollee/my_sys/tree/master/nvim
  - https://github.com/AGou-ops/dotfiles/tree/master/neovim-with-lua
13. [Using buffers, windows, and tabs efficiently in Vim - DEV Community](https://dev.to/iggredible/using-buffers-windows-and-tabs-efficiently-in-vim-56jc)
