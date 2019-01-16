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
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'joshdick/onedark.vim'

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

" 其他
let g:solarized_termtrans = 1
set magic
set background=dark
colorscheme solarized
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe "norm '\"zz"|else|exe "norm $zz"|endif|endif
autocmd! BufReadPost *
            \ if line("'\"")>1 && line("'\"")<=line("$")|
            \     execute 'normal! g`"zz'|
            \ endif

" 自动关闭函数提示框
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

nnoremap `gg :YcmCompleter GoToDefinition<CR>

" 全局设置
le g:airlinte#extensions#tabline#enabled = 1
let Grep_Skip_Dirs = '.git CVS SCCS .svn generated pyc'
let python_highlight_all=1

" YcmCompleter
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set completeopt=longest,menu
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
let g:clang_snippets_engine='clang_complete'
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
