" An example for a vimrc file.
" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2016 Jul 28
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile    " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Add optional packages."
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

set ts=4
set paste
set ruler
set showmode
set ignorecase
set noundofile
syntax on
"colorscheme elflord
colorscheme jellybeans
"hi Normal  guibg=Black
"hi Comment term=bold guifg=#99FFFF
"hi Normal  guibg=Black
"hi Comment term=bold guifg=#99FFFF
set guifont=MesloLGS\ NF:h13
set nobackup
set fencs=utf-8,cp949
set bs=eol,start,indent
set shiftwidth=4 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
set smartcase " 검색시 대소문자 구별
set smarttab
set smartindent
set softtabstop=4
"set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

filetype plugin on
filetype indent on
set number

"Plugin 'https://github.com/vim-scripts/taglist.vim.git'

"let Tlist_Ctags_Cmd='/usr/bin/ctags'
let g:Tlist_Ctags_Cmd='/opt/homebrew/bin/ctags'

if has("gui_running")
    au GUIEnter * winsize 100 70
    au GUIEnter * winpos 0 0

    "Ctrl+e를 누르면 현재 오픈한 파일의 디렉토리에 대한 탐색기를 띄운다
    map <C-e> :silent !explorer %:p:h:gs?\/?\\\\\\?<CR>

endif

set tags=./tags,tags,/Users/mhlee/shared/maps/map7201/tags
set tagbsearch " 태그 검색을 이진검색으로 함

" 맥북 설정
" Leader 키 설정
let mapleader = ","

" cscope 설정
if has("cscope")
    set csprg=/opt/homebrew/bin/cscope
    set csto=1
    set cst
    set nocsverb

    " cscope 데이터베이스 파일을 자동으로 추가한다.
    if filereadable("cscope.out")
        cs add cscope.out .
    endif

    " cscope를 사용하여 vim의 탐색 기능을 설정한다.
    set csverb
	" 맥북 키매핑 설정
" 새로운 키맵핑 설정
    nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	" Gentoo 키매핑 설정
    "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> " 심볼검색
    "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> " 정의로 이동
    "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> " 함수 호출로 이동
    "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> " 텍스트 검색
    "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> " egrep 검색
    "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> " 파일 검색
    "nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR> " 포함파일 검색
    "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> " 함수의 전처리기 명령어로 이
endif
"let Tlist_Auto_Open=1 # 자동으로 taglist표시 (:Tlist 필요없음)
"let Tlist_Use_Right_Window = 1 # 리스트를 왼쪽이 아니라 오른쪽에 표시
"let Tlist_WinWidth = 35 # 리스트 창의 너비를 35로 조정
