"OK
scriptencoding utf-8
if has('vim_starting')
    if &compatible
        set nocompatible "ȥ��VIһ����
    endif
endif
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine' "������������
Plugin 'tpope/vim-sensible' "ÿ���˶�ͬ�������
Plugin 'kien/ctrlp.vim'

Plugin 'SpaceVim/SpaceVim'
" -----------------------------------------------
" ��ǿ��״̬��
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
set shortmess=atI "�ڸɴ�


" ������
set nobackup
set nowritebackup
set noswapfile

set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb "ɾ���ļ���BOM
set backspace=eol,start,indent
set clipboard+=unnamed
"set winaltkeys=no " ���� alt ����ӳ�䵽�˵���
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
"set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencodings=ucs-bom,utf-8,utf-16,gb2312,gb18030,gbk,big5,gb18030,cp936,latin1
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
set guifont=Consolas:h13:cANSI
"set guifontwide=Consolas:h13:cGB2312
set lines=25 columns=90
syntax on "����
"����ʾ����/�˵���
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
"ʹ������ tab ��ʽ������ gui
set guioptions-=e
"�༭_vimrc
map <leader>v :e $MYVIMRC<CR>
map <leader>s :source $MYVIMRC<CR>
"filetype on
"filetype indent on
set background=dark
colorscheme habiLight
set number "�к�
set relativenumber
set ruler "��ʾ��굱ǰλ��
set cursorline "������ǰ��
"set showmode "���½���ʾ��ǰ vim ģʽ
set autoread "�ļ����ݸı��Զ�����


set novisualbell "?
set ignorecase "��Сд������
set incsearch "�����ַ�������ʾƥ���
"""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent "ÿ����������һ�����
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


" ���½� .h .c .hpp .cpp .mk .sh���ļ�ʱ�Զ�����SetTitle ����
autocmd BufNewFile *.cpp,*.c exec ":call SetComment()" 

" ����ע�� 
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
