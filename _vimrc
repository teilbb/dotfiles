"OK
scriptencoding utf-8
if has('vim_starting')
    if &compatible
        set nocompatible "去掉VI一致性
    endif
endif
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine' "对其代码的虚线
Plugin 'tpope/vim-sensible' "每个人都同意的配置
Plugin 'kien/ctrlp.vim'

Plugin 'SpaceVim/SpaceVim'
" -----------------------------------------------
" 加强版状态条
" -----------------------------------------------
Plugin 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
call vundle#end() 
filetype plugin indent on
set shortmess=atI "乌干达


" 不备份
set nobackup
set nowritebackup
set noswapfile

set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb "删除文件的BOM
set backspace=eol,start,indent
set clipboard+=unnamed
"set winaltkeys=no " 设置 alt 键不映射到菜单栏
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
"set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencodings=ucs-bom,utf-8,utf-16,gb2312,gb18030,gbk,big5,gb18030,cp936,latin1
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
set guifont=Consolas:h13:cANSI
"set guifontwide=Consolas:h13:cGB2312
set lines=25 columns=90
syntax on "高亮
"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
"使用内置 tab 样式而不是 gui
set guioptions-=e
"编辑_vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>s :source $MYVIMRC<CR>
"filetype on
"filetype indent on
set background=dark
colorscheme habiLight
set number "行号
set relativenumber
set ruler "显示光标当前位置
set cursorline "高亮当前行
"set showmode "右下角显示当前 vim 模式
set autoread "文件内容改变自动加载


set novisualbell "?
set ignorecase "大小写不敏感
set incsearch "输入字符串就显示匹配点
"""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent "每行缩进与上一行相等
set fileformat=unix
"""""

map <F5> :call TestRun()<CR>
function! TestRun()
    exec "w"
    if &filetype == 'python'
        exec "!python % && echo."
    elseif &filetype == 'cpp'
        "exec "!complete % -o %<"
        exec "!g++ % -o %< && %<.exe"
        "exec "!%<"
    elseif &filetype == 'c'
        exec "!g++ % -o %< && %<.exe"
    elseif &filetype == 'rust'
        exec ":cd %:p:h"
        exec "!cargo run"
    endif
endfunction!

cd $HOME
cd desktop


" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.cpp,*.c exec ":call SetComment()" 

" 加入注释 
func SetComment()
	call setline(1,"#include <iostream>") 
	call append(line("."), "")
	call append(line(".")+1, "int main()") 
	call append(line(".")+2, "{")
	call append(line(".")+3, "    ")
	call append(line(".")+4, "}")
    exec "5"
endfunc

nmap <leader>w :w!<CR>
nmap <leader>q :q!<CR>
nmap <leader>i :PluginInstall<CR>
nmap <leader>c :PluginClean<CR>
"source $VIMRUNTIME\delmenu.vim
"source $VIMRUNTIME\menu.vim

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p' print('')
au FileType python inoremap <buffer> $p" print("")
set pythonthreedll=python36.dll
