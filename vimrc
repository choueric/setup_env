set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""
" plug.vim
""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'lrvick/Conque-Shell'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'geoffharcourt/vim-matchit'
Plug 'Konfekt/vim-alias'
Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'Shougo/echodoc.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'cespare/vim-toml'
Plug 'mileszs/ack.vim'
Plug 'vivien/vim-linux-coding-style'
Plug 'xavierchow/vim-sequence-diagram'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""
" vim-sequence-diagram
""""""""""""""""""""""""""""""""""""""""""""""
nmap <unique> <leader>s <Plug>GenerateDiagram

""""""""""""""""""""""""""""""""""""""""""""""
" vim-linux-coding-style
""""""""""""""""""""""""""""""""""""""""""""""
let g:linuxsty_patterns = [ "/fw-kernel", "/g7apc-linux-2.6-imx" ]

""""""""""""""""""""""""""""""""""""""""""""""
" ack
""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <silent> ? :Ack!<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" dart-vim-plugin
""""""""""""""""""""""""""""""""""""""""""""""
" Enable HTML syntax highlighting inside Dart strings
let dart_html_in_string=v:true

" Enable Dart style guide syntax (like 2-space indentation)
let dart_style_guide = 2

" Enable DartFmt execution on buffer save
let dart_format_on_save = 1

""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting of class scope is disabled by default. To enable set
let g:cpp_class_scope_highlight = 1
" Highlighting of member variables is disabled by default. To enable set
let g:cpp_member_variable_highlight = 1
" Highlighting of class names in declarations is disabled by default. To enable set
let g:cpp_class_decl_highlight = 1
" There are two ways to highlight template functions. Either
let g:cpp_experimental_simple_template_highlight = 1
" which works in most cases, but can be a little slow on large files. Alternatively set
"let g:cpp_experimental_template_highlight = 1
" which is a faster implementation but has some corner cases where it doesn't work.
" Highlighting of library concepts is enabled by
let g:cpp_concepts_highlight = 1
" Highlighting of user defined functions can be disabled by
let g:cpp_no_function_highlight = 1

""""""""""""""""""""""""""""""""""""""""""""""
" echodoc
""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:echodoc_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""
" signify
""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_realtime = 1

""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun
""""""""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
" open quickfix window automatically, and height set to 6
let g:asyncrun_open = 6

" ring bell when job is done
let g:asyncrun_bell = 1

nnoremap <silent> <F5> :AsyncRun -cwd=<root>/build cmake .. <cr>
nnoremap <silent> <F6> :AsyncRun -cwd=<root>/build make <cr>
" use <F8> to toggle Quickfix
nnoremap <silent> <F8> :call asyncrun#quickfix_toggle(6)<cr>

""""""""""""""""""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""""""""""""""""""
set tags=./.tags;,.tags

""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"

""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
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
autocmd FileType markdown :TagbarOpen
map <F2> :TagbarToggle<CR>
imap <F2> <esc>:TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" vim-alias
""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * nested :Alias t tabnew

""""""""""""""""""""""""""""""""""""""""""""""
" gutentags
""""""""""""""""""""""""""""""""""""""""""""""
"let g:gutentags_trace=1
let g:gutentags_ctags_exclude = ['.toolchain']
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/tmp/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif

""""""""""""""""""""""""""""""""""""""""""""""
" status bar & vim-airline
""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_extensions = []
let g:airline_section_z = '%3p%%/%L (%4l,%3v)'

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
let wiki.nested_syntaxes = {'py': 'python', 'c++': 'cpp', 'c': 'c', 'sh': 'sh', 'go': 'go'}
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
set expandtab
" number of spaces to insert tab
set tabstop=4
" Number of spaces to use for each step of (auto)indent. 
set shiftwidth=4

set colorcolumn=80
set modeline
set modelines=5

highlight Pmenu ctermfg=Black ctermbg=DarkGrey

""""""""""""""""""""""""""""""""""""""""""""""
" tabline
""""""""""""""""""""""""""""""""""""""""""""""
function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'
        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    return s
endfunction

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

set tabline=%!MyTabLine()

hi TabLine      ctermfg=Black  ctermbg=Gray      cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Gray      cterm=NONE
hi TabLineSel   ctermfg=Green  ctermbg=DarkBlue  cterm=NONE

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
set guifont=Ubuntu\ Mono\ 16
"autocmd InsertLeave,WinEnter * set cursorline
"autocmd InsertEnter,WinLeave * set nocursorline

""""""""""""""""""""""""""""""""""""""""""""""
" key binding
""""""""""""""""""""""""""""""""""""""""""""""
"<F1> is help

" copy
map <F3> "+y
imap <F3> <esc>"+y
" paste
map <F4> "+p
imap <F4> <esc>"+p

" 快捷键入当前时间
map <F7> a<C-R>=strftime("%Y-%m-%d %T")<CR><esc>
imap <F7> <C-R>=strftime("%Y-%m-%d %T")<CR><esc>

" add '//' in the head of line to comment it
map <F9> I// <esc>
imap <F9> <esc>I// <esc>
" revert <F9>
map <F10> ^xxx
imap <F10> <esc>^xxx

" make a long line into several lines to become a paragraph.
map <F12> Vgq
imap <F12> <esc>Vgq

" move window
map <C-up> <C-W>+
map <C-down> <C-W>-
map <C-left> <C-W><
map <C-right> <C-W>>

" move between tabs
map <C-l> <esc>gt
map <C-h> <esc>gT

""""""""""""""""""""""""""""""""""""""""""""""
" fzf
" install:
"   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
"   ~/.fzf/install
" upgrade:
"   cd ~/.fzf && git pull && ./install
""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.fzf
" Select file: ctrl+p
nnoremap <silent> <C-p> :FZF<CR>

" Select buffer: <Leader><Enter>
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Jump to Tags: <Leader>t
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v -a ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'down':    '40%',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()
nnoremap <silent> <Leader>t :Tags<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" Highlight word under cursor
""""""""""""""""""""""""""""""""""""""""""""""
function! HiInterestingWord(n) " {{{2
	" Save our location.
	normal! mz
	" Yank the current word into the z register.
	normal! "zyiw
	" Calculate an arbitrary match ID.  Hopefully nothing else is using it.
	let mid = 77750 + a:n
	" Clear existing matches, but don't worry if they don't exist.
	"silent! call matchdelete(mid)
	try
		call matchdelete(mid)
	catch 'E803'
		" Construct a literal pattern that has to match at boundaries.
		let pat = '\V\<' . escape(@z, '\') . '\>'
		" Actually match the words.
		call matchadd("InterestingWord" . a:n, pat, 1, mid)
	endtry
	" Move back to our original location.
	normal! `z
endfunction

function! ClearAllHi()
	for i in range(1,6)
		let mid = 77750 + i
		silent! call matchdelete(mid)
	endfor
endfunction

nnoremap <silent> <leader>0 :call ClearAllHi()<cr>
nnoremap <silent> <leader>1 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
