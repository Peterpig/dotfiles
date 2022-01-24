filetype on

"基本信息
syntax on
set nocompatible
set number
set softtabstop=4
set tabstop=4
set shiftwidth=4
"set term=xterm
"set autoindent
set smartindent
set cindent
set hlsearch
set incsearch
set expandtab
set laststatus=2      " 总是显示状态栏
set wildmenu          " 在命令模式下使用 Tab 自动补全的时候
set nocursorline    " 去掉当前行的下划线
" set wildmode=longest:full,full
set ic
set showcmd
set lazyredraw
set noswapfile      " 禁止生成临时文件
set term=xterm
let mapleader=";"

" 插件
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 插件列表
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Vimjas/vim-python-pep8-indent'
" Plugin 'davidhalter/jedi-vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'joshdick/onedark.vim'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()
" filetype plugin indent on
filetype on


" 键位映射
map ,s :%s/ \+$//g<cr>
map ,e :e ~/.vimrc<CR>
map <Tab> :bn<CR>zz
map <S-Tab> :bp<CR>zz
if !exists('noalwayscenter')
    " Calculate proper scrolloff
    autocmd VimEnter,WinEnter,VimResized,InsertLeave * :let &scrolloff = float2nr(floor(winheight(0)/2)+1)
    autocmd InsertEnter * :let &scrolloff = float2nr(floor(winheight(0)/2))
    " Use <Enter> to keep center in insert mode, need proper scrolloff
    inoremap <CR> <CR><C-o>zz
endif


" solarized主题 安装
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set magic
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set t_Co=25et t_Co=256
set term=screen-256color
set t_ut=
