"-------------------------------------------------------------------------
"                           vim plugin manager
"-------------------------------------------------------------------------
call plug#begin(stdpath('config') . '/plugged')
"Plug 'yamatsum/nvim-cursorline'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-commentary'
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
"Plug 'fatih/vim-go'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-textobjects' " require 'nvim-treesitter/nvim-treesitter'
" Plug 'RRethy/nvim-treesitter-textsubjects' " require 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' " require 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip' " require 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip' " require 'hrsh7th/friendly-snippets'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'
Plug 'lukas-reineke/cmp-under-comparator' " require 'hrsh7th/nvim-cmp'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua' " require 'kyazdani42/nvim-web-devicons'
" Plug 'famiu/bufdelete.nvim'
" Plug 'akinsho/bufferline.nvim' " require 'famiu/bufdelete'
" Plug 'romgrk/barbar.nvim'
Plug 'nanozuki/tabby.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' " require 'nvim-lua/plenary.nvim'
Plug 'ellisonleao/glow.nvim' " require https://github.com/charmbracelet/glow
Plug 'beauwilliams/focus.nvim'
Plug 'folke/which-key.nvim'
" Plug 'mfussenegger/nvim-ts-hint-textobject'
Plug 'ntpeters/vim-better-whitespace'

" color scheme
Plug 'fatih/molokai'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'navarasu/onedark.nvim'
call plug#end()

filetype plugin indent on     " required!
"-------------------------------------------------------------------------
"                           basic setting
"-------------------------------------------------------------------------

set nocompatible                    " Use Vim defaults (much better!)
set autoread                        " read open files again when changed outside Vim
set autowrite                       " write a modified buffer on each :next , ...
" auto reload vimrc when editing it
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
set bs=2		                    " allow backspacing over everything in insert mode
set history=50		                " keep 50 lines of command line history
set number                          " show line number
"set relativenumber                  " 以游標所在行號為原點，顯示上、下方行的行號
"set cursorcolumn                   " 強化顯示游標所在列

" indent setting{
set smartindent
set autoindent                      " always set autoindenting on
set copyindent                      " copy the previous indentation on autoindenting
"}

" TAB setting {
set shiftwidth=4                    " let a tab look like (n) spaces for indent
set tabstop=4                       " let a tab act as (n) spaces
set softtabstop=4                   " use a tab and some spaces for indent when editing
set smarttab
set expandtab                       " when tapstop is set, expand a tab to (n) spaces
au FileType Makefile set noexpandtab
"}
"
" disable error sound {
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"}
" status line
"{
"set laststatus=2
"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
"set statusline+=\ \ \ [%{&ff}/%Y]
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

"function! CurDir()
"    let curdir = substitute(getcwd(), $HOME, "~", "")
"    return curdir
"endfunction

"function! HasPaste()
"    if &paste
"        return '[PASTE]'
"    else
"        return ''
"    endif
"endfunction
"}

set pastetoggle=<MiddleMouse>
"set complete+=k                     " <ctrl-p> or <ctrl-n> complete a word . ref: help complete
                                    " detfault complete  is .,w,b,u,t,i,
"set complete=.,w,b,u,t,k             " Better complete options to speed it up, ref: help cpt
set completeopt=menu,menuone,noselect
set incsearch                       " do incremental searching
set ruler                           " show the cursor position all the time
" 顯示游標所在行的強化顯示，須配合設定 color schema
set cursorline
set nowrap                          " do not wrap lines
set showcmd                         " display incomplete commands
set showmode                        " show current mode
set showmatch                       " Cursor shows matching ) and }
set matchtime=5                     " How many tenths of a second to blink

set wildignore+=*.orig,*.org,*.bak,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.bmp,*.jpg,*.jpeg
set wildmenu                        " command-line completion in an enhanced mode
set wildchar=<TAB>                  " start wild expansion in the command line using <TAB>
set backspace=indent,eol,start      " backspacing over everything in insert mode
set mouse=a
set popt=left:8pc,right:3pc         " print options
"set whichwrap=<,>                  " 設定當在每行最前或最後時, 允許那一個鍵可以前一行移動
"set list
"set listchars=tab:,eol:            "用特殊符號表示tab與換行
set signcolumn=auto                  "開啟錯誤處理標示，在行號前方標示
set updatetime=300

filetype on                         " Enable filetype detection
filetype indent on                  " Enable filetype-specific indenting
filetype plugin on                  " Enable filetype-specific plugins

"-------------------------------------------------------------------------
"                           color setting
"-------------------------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has("syntax") && &t_Co > 2 || has("gui_running")
    if (has("termguicolors"))
        set termguicolors
    endif
    syntax on
    set hlsearch

    " " 'mhartington/oceanic-next'
    " colorscheme OceanicNext
    " let g:airline_theme='oceanicnext'

    " 'sainnhe/sonokai' support nvim-cmp
    " let g:sonokai_disable_italic_comment = 1
    " let g:sonokai_diagnostic_text_highlight = 1
    " let g:sonokai_diagnostic_line_highlight = 1
    " let g:sonokai_diagnostic_virtual_text = "colored"
    " " let g:sonokai_style = 'shusia' "andromeda, shusia , maia, espresso
    " colorscheme sonokai
    " let g:airline_theme = 'sonokai'

    " 'dracula/vim'
    " colorscheme dracula
    " let g:airline_theme = 'dracula'
    " " 'arcticicestudio/nord-vim'
    " colorscheme nord
    " let g:airline_theme = 'nord'

    " 'navarasu/onedark.nvim''
    lua require('plugins/onedark')
    colorscheme onedark
    let g:airline_theme = 'onedark'

    " example to add color scheme support for plugins
    " " gray
    " highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
    " " blue
    " highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
    " highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
    " " light blue
    " highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
    " highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
    " highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
    " " pink
    " highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
    " highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
    " " front
    " highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    " highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
    " highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

    " " 'sainnhe/gruvbox-material' support nvim-cmp
    " set background=dark
    " let g:gruvbox_material_background = 'hard'
    " let g:gruvbox_material_disable_italic_comment = 1
    " let g:gruvbox_material_sign_column_background = 'none'
    " let g:gruvbox_material_diagnostic_text_highlight = 1
    " let g:gruvbox_material_diagnostic_line_highlight = 1
    " let g:gruvbox_material_diagnostic_virtual_text = "colored"
    " colorscheme gruvbox-material
    " let g:airline_theme = 'gruvbox_material'

    "set t_Co=256
    " let g:rehash256 = 1
    " let g:molokai_original = 1
    " colorscheme molokai
    " let g:airline_theme='molokai'

endif

"-------------------------------------------------------------------------
"                          encoding setting
"-------------------------------------------------------------------------
" 'encoding'      Encoding 代表的是 vim 內部使用的編碼。
"                 一般而言 Unicode 的環境請用 utf-8 。
"
" 'fileencoding'  這個與 encoding 不一樣，只有在讀寫檔案的時候影響。
"                 setglobal fileencoding 應該會變成預設值，set fileencoding
"                 也可以，要全部使用 big5 就設成
"                     set fileencoding=big5
"                 否則可以不設，會以 encoding 為預設值。
"
" 'fileencodings' 所有可能的 encodings，開檔時候會一一測試使用，如果沒有錯誤便
"                 使 fileencoding 等於該 encoding。他會自動偵測字碼。免手動轉換。

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
    set encoding=utf-8
    set termencoding=big5
endfun

fun! UTF8()
    set encoding=utf-8
    set termencoding=big5
    set fileencoding=utf-8
    set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
    set encoding=big5
    set fileencoding=big5
endfunction

"--------------------------------------------------------------------------
"                    function and keymap
"-------------------------------------------------------------------------
" set leader to ,
let mapleader=" "
let g:mapleader=" "

"" --- move around splits {
"" Window Movement
"" move to and maximize the left split
"nmap <c-h> <c-w>h<c-w><bar>
"" move to and maximize the right split
"nmap <c-l> <c-w>l<c-w><bar>
"" move to and maximize the below split
"nmap <c-j> <c-w>j<c-w>_
"" move to and maximize the above split
"nmap <c-k> <c-w>k<c-w>_
"" Previous Window
"nmap <silent> <leader>wp :wincmd p<CR>
"" Equal Size Windows
"nmap <silent> <leader>w= :wincmd =<CR>
"" Window Splitting
"nmap <silent> <c-w>h :split<CR>
""nmap <silent> <leader>wv :vsplit<CR>
""nmap <silent> <leader>wc :close<CR>
"set wmw=10 " set the min width of a window to 0 so we can maximize others
"set wh=10
"set wmh=5 " set the min height of a window to 0 so we can maximize others
"" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
"{
" go to prev tab
" nmap <silent> <leader>tp gT
" " go to next tab
" nmap <silent> <leader>tn gt
" " new tab
" nmap <silent> <leader>tn :tabnew<CR>
" " close tab
" nmap <silent> <leader>tc :tabclose<CR>
"}

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
"{
" go to prev buffer
nmap <silent> <leader>bp :bn<CR>
" go to next buffer
nmap <silent> <leader>bn :bp<CR>
"}

" These mappings will reselect the block after shifting,
" so you'll just have to select a block, press < or > as many times as you like
vnoremap < <gv
vnoremap > >gv

" Transposing lines 整行上下移動
nmap <c-a><down> :<c-u>move .+1<cr>
nmap <c-a><up> :<c-u>move .-2<cr>

imap <c-a><down> <c-o>:<C-u>move .+1<cr>
imap <c-a><up> <c-o>:<C-u>move .-2<cr>

vmap <c-a><down> :move '>+1<CR>gv
vmap <c-a><up> :move '<-2<CR>gv

" Don't use Ex mode, use Q for formatting
map Q gq

" ,p toggles paste mode
" nmap <leader>p :set paste!<BAR>set paste?<CR>

"--------------------------------------------------------------------------
"                    Plugin Settings
"-------------------------------------------------------------------------
" easymotion
" let g:EasyMotion_do_mapping = 0
" nmap <leader>s <Plug>(easymotion-s2)

" tagbar
nnoremap <F2> :TagbarToggle<cr>
let g:tagbar_autofocus = 1

" vim-go
"{
" let g:go_fmt_command = 'goimports'
" let g:go_autodetect_gopath = 1
" " let g:go_bin_path = '$GOBIN'

" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_generate_tags = 1

" " Open :GoDeclsDir with ctrl-g
" nmap <C-g> :GoDeclsDir<cr>
" imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END
"}
" coc.vim
"{
" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gm <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction
"}

" nvim-cursorline
"{
" 無法生效暫時移除
let g:cursorword_highlight = 0
"}

" airline
" {
" use vim command to show airline_section_z
" :echo g:airline_section_z
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 0

" 'nvim-lualine/lualine.nvim'
lua require("plugins/lualine")

" neovim-cmp
" {
lua require('plugins/nvim-cmp')
" }

" nvim-treesitter
lua require('plugins/nvim-treesitter')

" lspconfig
lua require('plugins/lspconfig')
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

" 'williamboman/nvim-lsp-installer'
lua require('plugins/lspconfig-installer')

" 'ray-x/lsp_signature.nvim'
lua require('plugins/lsp-signature')

" nvim-tree
" {
lua require('plugins/nvim-tree')
" for one dark theme
hi NvimTreeNormal guifg=#a0a8b7 guibg=#1f2329
hi NvimTreeEndOfBuffer guifg=#1f2329 guibg=#1f2329
hi NvimTreeVertSplit guifg=#1f2329 guibg=#1f2329
"let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
"let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
"let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
"let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
"let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
"let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
"let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
"let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
"let g:nvim_tree_create_in_closed_folder = 1 "0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
"let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
"    \ 'git': 1,
"    \ 'folders': 0,
"    \ 'files': 0,
"    \ 'folder_arrows': 0,
"    \ }
""If 0, do not show the icons for one of 'git' 'folder' and 'files'
""1 by default, notice that if 'files' is 1, it will only display
""if nvim-web-devicons is installed and on your runtimepath.
""if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
""but this will not work when you set indent_markers (because of UI conflict)
"
"" default will show icon by default if no icon is provided
"" default shows no icon by default
"let g:nvim_tree_icons = {
"    \ 'default': '',
"    \ 'symlink': '',
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★",
"    \   'deleted': "",
"    \   'ignored': "◌"
"    \   },
"    \ 'folder': {
"    \   'arrow_open': "",
"    \   'arrow_closed': "",
"    \   'default': "",
"    \   'open': "",
"    \   'empty': "",
"    \   'empty_open': "",
"    \   'symlink': "",
"    \   'symlink_open': "",
"    \   }
"    \ }

nnoremap <silent> <F1> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>g :NvimTreeFindFile<CR>

" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" a list of groups can be found at `:help nvim_tree_highlight`
"highlight NvimTreeFolderIcon guibg=blue
" }

" nvim-autopairs
" {
lua require('plugins/nvim-autopairs')
" }

" bufferline
" {
" lua require('plugins/bufferline')
" " 關閉 airline 內建 tabline
" let g:airline#extensions#tabline#enabled = 0
" nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>
" nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
" nnoremap <silent> <A->> :BufferLineMoveNext<CR>
" nnoremap <silent> <A-<> :BufferLineMovePrev<CR>
" nnoremap <silent> <leader>1 :BufferLineGoToBuffer 1<CR>
" nnoremap <silent> <leader>2 :BufferLineGoToBuffer 2<CR>
" nnoremap <silent> <leader>3 :BufferLineGoToBuffer 3<CR>
" nnoremap <silent> <leader>4 :BufferLineGoToBuffer 4<CR>
" nnoremap <silent> <leader>5 :BufferLineGoToBuffer 5<CR>
" nnoremap <silent> <leader>6 :BufferLineGoToBuffer 6<CR>
" nnoremap <silent> <leader>7 :BufferLineGoToBuffer 7<CR>
" nnoremap <silent> <leader>8 :BufferLineGoToBuffer 8<CR>
" nnoremap <silent> <leader>9 :BufferLineGoToBuffer 9<CR>
" " 快速選擇 Tab
" nnoremap <silent> <A-/> :BufferLinePick<CR>
" " 快速移除 Tab
" nnoremap <silent> <A-x> :BufferLinePickClose<CR>
" }

" barbar
" {
" lua require('plugins/barbar')
" " Move to previous/next
" nnoremap <silent>    <A-,> :BufferPrevious<CR>
" nnoremap <silent>    <A-.> :BufferNext<CR>
" " Re-order to previous/next
" nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
" nnoremap <silent>    <A->> :BufferMoveNext<CR>
" " Goto buffer in position...
" nnoremap <silent>    <A-1> :BufferGoto 1<CR>
" nnoremap <silent>    <A-2> :BufferGoto 2<CR>
" nnoremap <silent>    <A-3> :BufferGoto 3<CR>
" nnoremap <silent>    <A-4> :BufferGoto 4<CR>
" nnoremap <silent>    <A-5> :BufferGoto 5<CR>
" nnoremap <silent>    <A-6> :BufferGoto 6<CR>
" nnoremap <silent>    <A-7> :BufferGoto 7<CR>
" nnoremap <silent>    <A-8> :BufferGoto 8<CR>
" nnoremap <silent>    <A-9> :BufferLast<CR>
" " Pin/unpin buffer
" nnoremap <silent>    <A-p> :BufferPin<CR>
" " Close buffer
" nnoremap <silent>    <A-c> :BufferClose<CR>
" " Wipeout buffer
" "                          :BufferWipeout<CR>
" " Close commands
" "                          :BufferCloseAllButCurrent<CR>
" "                          :BufferCloseAllButPinned<CR>
" "                          :BufferCloseBuffersLeft<CR>
" "                          :BufferCloseBuffersRight<CR>
" " Magic buffer-picking mode
" nnoremap <silent> <C-s>    :BufferPick<CR>
" " Sort automatically by...
" nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
" }

" tabby.nvim
" {
" for one dark theme
hi TabLineSel cterm=bold guifg=#a0a8b7 guibg=#314620
let g:airline#extensions#tabline#enabled = 0
lua require('plugins/tabby')
" }

" nvim-treesitter-textobjects
" {
" lua require('plugins/nvim-treesitter-textobjects')
" }

" nvim-treesitter-textsubjects
" {
" lua require('plugins/nvim-treesitter-textsubjects')
" }

" nvim-telescope
" {
lua require('plugins/nvim-telescope')
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }

" glow
" {
noremap <leader>mp :Glow<CR>
" }

" 'beauwilliams/focus.nvim'
" {
lua require("plugins/focus")
nmap <silent> <c-w>c :FocusSplitNicely<CR>
nmap <silent> <c-w>= :FocusMaxOrEqual<CR>
" nmap <silent> <c-w><left> :wincmd h<CR>
" nmap <silent> <c-w><right> :wincmd l<CR>
" nmap <silent> <c-w><up> :wincmd k<CR>
" nmap <silent> <c-w><down> :wincmd j<CR>
nmap <silent> <c-w><left> :FocusSplitLeft<CR>
nmap <silent> <c-w><right> :FocusSplitRight<CR>
nmap <silent> <c-w><up> :FocusSplitUp<CR>
nmap <silent> <c-w><down> :FocusSplitDown<CR>
" }

" which-key
" {
lua require("plugins/whichkey")
" }

" nvim-ts-hint-textobject
" {
" omap <silent> m :lua require('tsht').nodes()<CR>
" vnoremap <silent> m :lua require('tsht').nodes()<CR>
" }

" vim-better-whitespace
" {
let g:better_whitespace_enabled=1
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>
" }
