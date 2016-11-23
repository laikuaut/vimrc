"""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
"""""""""""""""""""""""""""""""""""""""""""""""""
" 文字コード
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
" vim のデフォルト設定にする
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""
" viminfo
"""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
set history=50 " keep 50 lines of command line history

"""""""""""""""""""""""""""""""""""""""""""""""""
" カラースキーマを設定
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
"colorscheme delek
"colorscheme koehler
"colorscheme peachpuff
"colorscheme torte
"colorscheme blue
colorscheme desert
"colorscheme morning
"colorscheme ron
"colorscheme zellner
"colorscheme darkblue
"colorscheme elflord
"colorscheme murphy
"colorscheme shine
"colorscheme default
"colorscheme evening
"colorscheme pablo
"colorscheme slate

""""""""""""""""""""""""""""""""""""""""""""""""
" vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""
" vimdiffの色設定
" 参考 : http://qiita.com/takaakikasai/items/b46a0b8c94e476e57e31
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"""""""""""""""""""""""""""""
" インデント設定
"""""""""""""""""""""""""""""
" ＜TAB>入力時、空白を挿入にする
set expandtab
" タブ表示幅を設定
set tabstop=4
" <TAB>入力時、挿入する文字数を設定
set softtabstop=4
" 自動インデントを行った際、設定する空白数
set shiftwidth=4
" コンテキストに応じたタブの処理を行なう
set smarttab
" 改行時に前の行の行末を見て自動でインデント
"set smartindent
" インデント自動的
set autoindent

"""""""""""""""""""""""""""""
" 画面表示
"""""""""""""""""""""""""""""
" 行番号を表示
set number
" 相対行番号で表示
"set relativenumber
" 不可視文字を表示
set list
" 不可視文字の表示文字を設定
set listchars=tab:>-,trail:_
" ステータスラインの設定
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" ステータスラインを常に表示
set laststatus=2
" 行を折り返す
set wrap
" 強調表示する列を設定する
"set colorcolumn=80
" 編集中のファイル名を表示しない
set notitle
" 括弧の対応をハイライト
set showmatch
" 現在のモードを表示
set showmode
" 入力中のコマンドを表示する(例えば yy を実行する際に yだけ入力すると「y」が右下に表示される。)
set showcmd
" カーソルラインを有効化
"set cursorline
" 列を強調表示
"set cursorcolumn
" カーソルラインを色なしに設定(行番号のみをハイライト)
"autocmd ColorScheme * highlight clear CursorLine
" ルーラー表示
"set ruler

"""""""""""""""""""""""""""""
" 検索設定
"""""""""""""""""""""""""""""
" 検索結果をハイライト表示する
set hlsearch
" インクリメンタルサーチを有効にする
set incsearch
" 検索時に最後まで移動したら最初に戻る
set wrapscan


"""""""""""""""""""""""""""""
" 移動設定
"""""""""""""""""""""""""""""
" 行頭・行末の左右移動で行を移動する
set whichwrap=b,s,h,l,<,>,[,]
" BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set bs=indent,eol,start

"""""""""""""""""""""""""""""
" コマンドモード
"""""""""""""""""""""""""""""
" コマンド補完を強化
set wildmenu
" リスト表示，最長マッチ
set wildmode=list:full

"""""""""""""""""""""""""""""
" その他
"""""""""""""""""""""""""""""
" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
" 日本語の行の連結時には空白を入力しない
set formatoptions+=Mm

"""""""""""""""""""""""""""""""""""""""""""""""""
" キーマップを設定
"""""""""""""""""""""""""""""""""""""""""""""""""
"nmap h <Insert>
"nmap i <Up>
"nmap j <Left>
"nmap k <Down>
"nmap l <Right>

"""""""""""""""""""""""""""""""""""""""""""""""""
" インデントOFF
"""""""""""""""""""""""""""""""""""""""""""""""""
function! g:noIndent()
    setlocal nosmarttab
    setlocal noautoindent
    setlocal nosmartindent
    setlocal formatoptions-=r
    set shiftwidth=0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" インデントON
"""""""""""""""""""""""""""""""""""""""""""""""""
function! g:indent()
    setlocal smarttab
    setlocal autoindent
"    setlocal smartindent
    setlocal formatoptions+=r
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" タブラインを設定
" 参考: http://qiita.com/wadako111/items/755e753677dd72d8036d
"""""""""""""""""""""""""""""""""""""""""""""""""
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
" 常にタブラインを表示
set showtabline=2

"""""""""""""""""""""""""""""""""""""""""""""""""
" カーソルラインとカラムのハイライト設定
" 参考: http://thinca.hatenablog.com/entry/20090530/1243615055
"       http://qiita.com/koara-local/items/57b5f2847b3506a6485b
"""""""""""""""""""""""""""""""""""""""""""""""""
" カーソルラインのグループをONにする
function! g:auto_vimrc_auto_cursorline()
    augroup vimrc-auto-cursorline
        autocmd!
        autocmd InsertLeave,CursorMovedI * call s:auto_cursorline('off')
        autocmd InsertEnter,VimEnter,CursorHold,CursorHoldI * call s:auto_cursorline('on')
    augroup END
endfunction
" カーソルラインのグループをOFFにする
function! g:noauto_vimrc_auto_cursorline()
    augroup vimrc-auto-cursorline
        autocmd!
        call s:auto_cursorline('off')
    augroup END
endfunction
" カーソルライングループ用関数定義
function! s:auto_cursorline(event)
    if a:event ==# 'off'
        hi clear CursorLine
        setlocal nocursorcolumn
        setlocal colorcolumn=0
    elseif a:event ==# 'on'
        setlocal cursorcolumn
        setlocal cursorline
        hi CursorLine term=underline cterm=underline guibg=Grey90
        setlocal colorcolumn=80
    endif
endfunction
" 呼び出し
call g:auto_vimrc_auto_cursorline()

"""""""""""""""""""""""""""""""""""""""""""""""""
" コマンドコード：相対的な番号と絶対的な行番号をトグル
" 挿入モード：絶対的な番号
"""""""""""""""""""""""""""""""""""""""""""""""""
" 相対行番号のグループをONにする
function! g:auto_vimrc_auto_relativenumber()
    augroup vimrc-auto-relativenumber
        autocmd!
        autocmd InsertEnter,CursorHold,CursorHoldI * call s:toggleNumberOption('on')
        autocmd InsertLeave,CursorMovedI,VimEnter * call s:toggleNumberOption('off')
    augroup END
endfunction
" 相対行番号のグループをOFFにする
function! g:noauto_vimrc_auto_relativenumber()
    augroup vimrc-auto-relativenumber
        autocmd!
        call s:toggleNumberOption('off')
    augroup END
endfunction
" 行番号グループ用関数定義
function! s:toggleNumberOption(event)
    if a:event ==# 'on'
        if&number
            set relativenumber
        else
            set number
        endif
    elseif a:event ==# 'off'
        if&number
            set norelativenumber
        else
            set number
        endif
    endif
endfunction
" 呼び出し
call g:auto_vimrc_auto_relativenumber()

"""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle開始
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
"NeoBundle Scripts-----------------------------
if &compatible
      set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
if has('lua') && (( v:version == 703 && has('patch885')) || (v:version >= 704))
    NeoBundle 'Shougo/neocomplete'
else
    NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
""" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippte設定
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
""" }}}

