scriptencoding utf-8
if has('vim_starting')
    if &compatible
        set nocompatible " 去掉VI一致性
    endif
endif
set shortmess=atI

set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
"set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencodings=ucs-bom,utf-8,utf-16,gb2312,gb18030,gbk,big5,gb18030,cp936,latin1
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine' " 对齐代码的虚线
Plugin 'tpope/vim-sensible' " 每个人都同意的配置
Plugin 'kien/ctrlp.vim'

Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/habiLight'
Plugin 'altercation/vim-colors-solarized'

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

set background=light
colorscheme solarized "habiLight

set nobackup " 不生成备份文件
"set nowritebackup " 保存文件时不备份
set noswapfile " 不生成交换文件

set history=500
set autochdir
set whichwrap=b,s,<,>,[,]
set backspace=eol,start,indent
set clipboard+=unnamed

set guifont=Consolas:h13
set lines=25 columns=90

syntax enable
syntax on

"不显示工具/菜单栏
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
"使用内置 tab 样式而不是 gui
set guioptions-=e

set number
set relativenumber
set cursorline
set ruler
set autoread "文件内容改变自动加载

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

nmap <leader>w :w!<CR>
nmap <leader>q :q!<CR>
nmap <leader>i :PluginInstall<CR>
nmap <leader>c :PluginClean<CR>
nmap <leader>v :e $MYVIMRC<CR>
nmap <leader>s :source $MYVIMRC<CR>
set listchars=tab:~\ ,eol:$
nmap <leader>l :set list!<CR>

set pythonthreedll=python36.dll

" function
" 加入注释 
autocmd BufNewFile *.cpp,*.c exec ":call SetComment()" 
function SetComment()
	call setline(1,"#include <iostream>") 
	call append(line("."), "")
	call append(line(".")+1, "int main()") 
	call append(line(".")+2, "{")
	call append(line(".")+3, "    ")
	call append(line(".")+4, "}")
    exec "5"
endfunction

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

nmap <leader>h :call HEX()<CR>
let g:hex=0
function HEX()
    if g:hex==0
        exec "%!xxd"
        let g:hex=1
    else
        exec "%!xxd -r"
        let g:hex=0
    endif
endfunction

nmap <leader>b :call BOM()<CR>
function BOM()
    if &bomb
        set nobomb
        exec "w"
        echo 'del bom'
    else
        echo 'nobomb'
    endif
endfunction
