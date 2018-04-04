scriptencoding utf-8
set nocompatible
set shortmess=atI

set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"set fileencodings=ucs-bom,utf-8,utf-16,gb2312,gb18030,gbk,big5,gb18030,cp936,latin1

" vundle {{{
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible' " 每个人都同意的配置
Plugin 'kien/ctrlp.vim'

Plugin 'altercation/vim-colors-solarized'

" 加强版状态条 {{{
if has('gui_running')
    Plugin 'itchyny/lightline.vim'
    let g:lightline = {
          \ 'colorscheme': 'solarized',
          \ }
endif
" }}}
call vundle#end()
filetype plugin indent on
syntax on
" }}}
" color {{{
set background=light
if has('gui_running')
    colorscheme solarized
endif
" }}}
" keymap to switch tab in gui {{{
if has('gui_running') 
    set winaltkeys=no
    noremap <silent><c-tab> :tabprev<CR>
    inoremap <silent><c-tab> <ESC>:tabprev<CR>
    noremap <silent><c-o> :tabnew<CR>
    noremap <silent><m-1> :tabn 1<cr>
    noremap <silent><m-2> :tabn 2<cr>
    noremap <silent><m-3> :tabn 3<cr>
    noremap <silent><m-4> :tabn 4<cr>
    noremap <silent><m-5> :tabn 5<cr>
    noremap <silent><m-6> :tabn 6<cr>
    noremap <silent><m-7> :tabn 7<cr>
    noremap <silent><m-8> :tabn 8<cr>
    noremap <silent><m-9> :tabn 9<cr>
    noremap <silent><m-0> :tabn 10<cr>
    inoremap <silent><m-1> <ESC>:tabn 1<cr>
    inoremap <silent><m-2> <ESC>:tabn 2<cr>
    inoremap <silent><m-3> <ESC>:tabn 3<cr>
    inoremap <silent><m-4> <ESC>:tabn 4<cr>
    inoremap <silent><m-5> <ESC>:tabn 5<cr>
    inoremap <silent><m-6> <ESC>:tabn 6<cr>
    inoremap <silent><m-7> <ESC>:tabn 7<cr>
    inoremap <silent><m-8> <ESC>:tabn 8<cr>
    inoremap <silent><m-9> <ESC>:tabn 9<cr>
    inoremap <silent><m-0> <ESC>:tabn 10<cr>
endif
" }}}
" File type {{{
augroup configgroup
    autocmd!
    autocmd FileType python setlocal commentstring=#\ %s
augroup END
" }}}
" 杂项 {{{
set history=500
set autochdir
set whichwrap=b,s,<,>,[,]
set backspace=eol,start,indent
set clipboard+=unnamed
set list
let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.,eol:$'
set pythonthreedll=python36.dll
set mouse=""
let autosave=5
set autoread "文件内容改变自动加载
"set foldmethod=indent
" }}}
" UI {{{
set guifont=Consolas:h12
"set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI
"set gfw=Yahei_Mono:h11:cGB2312
"set lines=25 columns=79
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
"set cursorline
set ruler
" }}}
" Search {{{
set ignorecase "大小写不敏感
set incsearch "输入字符串就显示匹配点
" }}}
" Spaces & Tab {{{
set textwidth=79
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent "根据上一行缩进
set fileformat=unix
" }}}
" leader {{{
nmap <leader>w :w!<CR>
nmap <leader>q :q!<CR>
nmap <leader>v :e $MYVIMRC<CR>
" }}}
" function {{{
" 加入注释 
map <F5> :call TestRun()<CR>
function! TestRun()
    execute "w"
    if &filetype == 'python'
        execute "!C:\\Users\\tielb\\Desktop\\venv\\Scripts\\python.exe % && echo."
    elseif &filetype == 'cpp'
        "execute "!complete % -o %<"
        execute "!g++ % -o %< && %<.exe"
        "execute "!%<"
    elseif &filetype == 'c'
        execute "!g++ % -o %< && %<.exe"
    elseif &filetype == 'rust'
        execute ":cd %:p:h"
        execute "!cargo run"
    endif
endfunction!
" }}}
" Put all temporary files under the same directory. {{{
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo ='100,n$HOME/.vim/files/info/viminfo
" }}}
" vimrc 折叠 {{{
augroup filetype_vimrc
    autocmd!
    autocmd FileType vim set foldmethod=marker
augroup END
" }}}
