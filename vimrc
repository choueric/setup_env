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
Plugin 'AnsiEsc.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'Konfekt/vim-alias'
Plugin 'airblade/vim-gitgutter'
call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"


""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0


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

let g:tagbar_type_vimwiki = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }
let g:tagbar_left = 1
let g:tagbar_width = 30
autocmd FileType markdown nested :TagbarOpen


""""""""""""""""""""""""""""""""""""""""""""""
" vim-alias
""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * nested :Alias t tabnew

""""""""""""""""""""""""""""""""""""""""""""""
" status bar & Powerline
""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'


""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki 
""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_use_mouse = 1
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
" formatoptions
" see more `:help fo-table` and `:help fo`
" use 'gq' to format select texts in visual mode
""""""""""""""""""""""""""""""""""""""""""""""
set fo+=mM  " for multi_byte charactors such as Chinese
set fo+=j   " when join comments, delete the // charactors


""""""""""""""""""""""""""""""""""""""""""""""
" color, hightlight, things about appearance
""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme koehler
set nu
"set showcmd
"set ruler
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
" use spaces to insert <tab>
"set expandtab
" number of spaces to insert tab
set tabstop=4
" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=4

set colorcolumn=80
set modeline
set modelines=5

""""""""""""""""""""""""""""""""""""""""""""""
" tabline
""""""""""""""""""""""""""""""""""""""""""""""
hi TabLineSel ctermfg=Red ctermbg=Yellow
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

""""""""""""""""""""""""""""""""""""""""""""""
" search
""""""""""""""""""""""""""""""""""""""""""""""
" ingnor case when search
set ic
" highlight search
highlight Search ctermfg=White ctermbg=Blue
highlight Search guifg=White guibg=Orange
set hls


""""""""""""""""""""""""""""""""""""""""""""""
" indent
""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on
set autoindent
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""
" auto complete
""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu


""""""""""""""""""""""""""""""""""""""""""""""
" clipboard
""""""""""""""""""""""""""""""""""""""""""""""
if has("mac")
	"set clipboard=unnamed
else
	set clipboard=unnamed
endif


""""""""""""""""""""""""""""""""""""""""""""""
" misc
""""""""""""""""""""""""""""""""""""""""""""""
" enable backspace (0, 1 disable)
set backspace=2
set directory=~/tmp//,/var/tmp//,/tmp//,.


""""""""""""""""""""""""""""""""""""""""""""""
" encoding
""""""""""""""""""""""""""""""""""""""""""""""
" file encode
set fenc=utf-8
set fencs=utf-8,gb2312,ucs-bom,gb18030,gbk,cp936,big5
set encoding=utf8


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

map <F5> :cn<CR>
imap <F5> <esc>:cn<CR>
map <F6> :cp<CR>
imap <F6> <esc>:cp<CR>

" 快捷键入当前时间
map <F7> a<C-R>=strftime("%Y-%m-%d %T")<CR><esc>
imap <F7> <C-R>=strftime("%Y-%m-%d %T")<CR><esc>
" 该键在一行的最后空出四个空白然后添加"//"，并保持输入状态，作用是可以添加注释方便
map <F8> A<space><space><space><space>//
imap <F8> <esc>A<space><space><space><space>//

" 定义在一行的前面添加"//"符号，即在程序编写中使该行成为注释
map <F9> I// <esc>
imap <F9> <esc>I// <esc>

" remove comment.
map <F10> ^xxx
imap <F10> <esc>^xxx

map <F12> Vgq
imap <F12> <esc>Vgq

map _ *N

" move window
map <C-up> <C-W>+
map <C-down> <C-W>-
map <C-left> <C-W><
map <C-right> <C-W>>

" move between tabs
map <C-l> <esc>gt
map <C-h> <esc>gT

:command! Make silent make | unsilent redraw! | cwindow
