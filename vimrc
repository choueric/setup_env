syntax on

"set nobackup
"set backupdir=$HOME/tmp/vimtmp

filetype indent on
set autoindent

" use spaces to insert <tab>
"set expandtab
" number of spaces to insert tab
set tabstop=4

" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=4

set clipboard=unnamed

set colorcolumn=80

set modeline
set modelines=5

set guioptions-=m
set guioptions-=T

" highlight the line cursor is
"set cursorline
" highlight the column cursor is
"set cursorcolumn


" enable backspace (0, 1 disable)
set backspace=2

" show line number
set nu

" show command
set showcmd

" show ruler
set ruler

" ingnor case when search
set ic
" use flag 'g' when substitute
set gdefault
" highlight search
set hls

" file encode
set fenc=utf-8
set fencs=utf-8,gb2312,ucs-bom,gb18030,gbk,cp936,big5

filetype plugin indent on
set completeopt=longest,menu

set cscopequickfix=s-,c-,d-,i-,t-,e-

colorscheme koehler

set laststatus=0
" set ls=2 来显示状态栏
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]


" vimwiki 
""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_use_mouse = 1
"let g:vimwiki_list = [{'path':'/', 
			"\'path_html':,
			"\'html_header':,}]
let wiki = {}
let wiki.path = '~/Dropbox/vimwiki/'
let wiki.path_html = '~/Dropbox/vimwiki/html/'
let wiki.html_header = '~/Dropbox/vimwiki/html/header.tpl'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c', 'sh': 'sh'}
let g:vimwiki_list = [wiki]
" 不使能驼峰英文
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别颜色
let g:vimwiki_hl_cb_checked = 1
" 取消vimwiki菜单项
let g:vimwik_menu = ''
" 关闭语法折叠
let g:vimwik_folding = 0
" 在计算字符串长度时特别考虑中文字符
let g:vimwik_CJK_length = 1
