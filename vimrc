""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vimwiki/vimwiki'
Plugin 'lrvick/Conque-Shell'
Plugin 'tpope/vim-surround'
Plugin 'AnsiEsc.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'geoffharcourt/vim-matchit'
call vundle#end()            " required
filetype plugin indent on    " required

let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_highlighting = 0

""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""""""""""""""""""
" support markdown
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }
let g:tagbar_left = 1
let g:tagbar_width = 30

""""""""""""""""""""""""""""""""""""""""""""""
" misc
""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype indent on
set autoindent
filetype plugin indent on
set completeopt=longest,menu
colorscheme koehler
highlight Search guibg='Orange' guifg='White' ctermfg='White' ctermbg='Blue'
set nu
"set showcmd
"set ruler
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set directory=~/tmp//,/var/tmp//,/tmp//,.

" use spaces to insert <tab>
"set expandtab
" number of spaces to insert tab
set tabstop=4
" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=4

" 设置到系统粘帖板
if has("mac")
	"set clipboard=unnamed
else
	set clipboard=unnamed
endif

set colorcolumn=80

set modeline
set modelines=5

" highlight the line cursor is
"set cursorline
" highlight the column cursor is
"set cursorcolumn

" enable backspace (0, 1 disable)
set backspace=2

" ingnor case when search
set ic
" highlight search
set hls

" file encode
set fenc=utf-8
set fencs=utf-8,gb2312,ucs-bom,gb18030,gbk,cp936,big5

" show statusbar
"set statusline=%F%m%r%h%w\ [%{&ff}\ %Y]\ [ASCII=\%03.3b\ HEX=\%02.2B]\ [%p%%\ %L]
"set statusline=[%{&ff}]\ [%Y]\ [%l,%v]\ %p%%\ %L
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'
set encoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki 
""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_use_mouse = 1
"let g:vimwiki_list = [{'path':'/', 
			"\'path_html':,
			"\'html_header':,}]
let wiki = {}
let wiki.path = '~/Dropbox/vimwiki/'
let wiki.path_html = '~/vimwiki/html/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let g:vimwiki_list = [wiki]
"let wiki.html_header = '~/Dropbox/vimwiki/html/header.tpl'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c', 'sh': 'sh'}
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


""""""""""""""""""""""""""""""""""""""""""""""
" for gui "
" use :set guifont=* to show the font dialog "
""""""""""""""""""""""""""""""""""""""""""""""
set guifont=Monospace\ 12

""""""""""""""""""""""""""""""""""""""""""""""
" key binding
""""""""""""""""""""""""""""""""""""""""""""""
"<F1> is help

" tagbar
map <F2> :TagbarToggle<CR>
imap <F2> <esc>:TagbarToggle<CR>

" copy
map <F3> "+y
imap <F3> <esc>"+y
" paste
map <F4> "+p
imap <F4> <esc>"+p

map <F5> <esc>:ConqueTermSplit bash<CR>
imap <F5> <esc>:ConqueTermSplit bash<CR>
map <F6> <esc>:ConqueTermVSplit bash<CR>
imap <F6> <esc>:ConqueTermVSplit bash<CR>

" 快捷键入当前时间
map <F7> a<C-R>=strftime("%Y-%m-%d %T")<CR><esc>
imap <F7> <C-R>=strftime("%Y-%m-%d %T")<CR><esc>
" 该键在一行的最后空出四个空白然后添加"//"，并保持输入状态，作用是可以添加注释方便
map <F8> A<space><space><space><space>//
imap <F8> <esc>A<space><space><space><space>//

" 定义在一行的前面添加"//"符号，即在程序编写中使该行成为注释
map <F9> I//<esc>
imap <F9> <esc>I//<esc>

" remove comment.
map <F10> ^xx
imap <F10> <esc>^xx

" 设置文件类型为markdown
map <F12> :set ft=markdown<CR>
imap <F12> <esc>:set ft=markdown<CR>

map _ *N

" move window
map <C-up> <C-W>+
map <C-down> <C-W>-
map <C-left> <C-W><
map <C-right> <C-W>>

" move between tabs
map <C-l> <esc>gt
map <C-h> <esc>gT



" 使用可视模式选中一段文字后，使用/或?来全文搜索该段文字
vnoremap <silent> / y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap <silent> ? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" 定义使用可视选择块注释
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make,python let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
vmap <silent> <F11> :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
vmap <silent> <F12> :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>
