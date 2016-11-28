"""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" 文字コード
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
" vim のデフォルト設定にする
set nocompatible
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" viminfo
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
set viminfo='20,\"50 " read/write a .viminfo file, don't store more
set history=50 " keep 50 lines of command line history
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" カラースキーマを設定
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
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
""" }}}

""""""""""""""""""""""""""""""""""""""""""""""""
" vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" vimdiffの色設定
" 参考 : http://qiita.com/takaakikasai/items/b46a0b8c94e476e57e31
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
""" }}}

"""""""""""""""""""""""""""""
" インデント設定
"""""""""""""""""""""""""""""
""" {{{
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
""" }}}

"""""""""""""""""""""""""""""
" 画面表示
"""""""""""""""""""""""""""""
""" {{{
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
""" }}}

"""""""""""""""""""""""""""""
" 検索設定
"""""""""""""""""""""""""""""
""" {{{
" 検索結果をハイライト表示する
set hlsearch
" インクリメンタルサーチを有効にする
set incsearch
" 検索時に最後まで移動したら最初に戻る
set wrapscan
""" }}}

"""""""""""""""""""""""""""""
" 移動設定
"""""""""""""""""""""""""""""
""" {{{
" 行頭・行末の左右移動で行を移動する
set whichwrap=b,s,h,l,<,>,[,]
" BSで削除できるものを指定する
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set bs=indent,eol,start
""" }}}

"""""""""""""""""""""""""""""
" コマンドモード
"""""""""""""""""""""""""""""
""" {{{
" コマンド補完を強化
set wildmenu
" リスト表示，最長マッチ
set wildmode=list:full
""" }}}

"""""""""""""""""""""""""""""
" その他
"""""""""""""""""""""""""""""
""" {{{
" 8進数を無効にする。<C-a>,<C-x>に影響する
set nrformats-=octal
" 日本語の行の連結時には空白を入力しない
set formatoptions+=Mm
" 折り畳みを設定「{{{ }}}で囲う」
" za 部分開閉
" zr 全開き
" zm 全閉じ
set foldmethod=marker
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" キーマップを設定
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
"nmap h <Insert>
"nmap i <Up>
"nmap j <Left>
"nmap k <Down>
"nmap l <Right>
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" インデント用関数
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" インデントOFF
function! g:noIndent() " {{{
    setlocal shiftwidth=0
    setlocal softtabstop=0
    setlocal nosmarttab
    setlocal noautoindent
    setlocal nosmartindent
    setlocal formatoptions-=r
    setlocal paste
endfunction " }}}

" インデントON
function! g:indent() " {{{
    setlocal smarttab
    setlocal autoindent
"    setlocal smartindent
    setlocal formatoptions+=r
    setlocal shiftwidth=4
    setlocal softtabstop=4
    setlocal nopaste
endfunction " }}}
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" タブラインを設定
" 参考: http://qiita.com/wadako111/items/755e753677dd72d8036d
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" Anywhere SID.
function! s:SID_PREFIX() " {{{
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction " }}}

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
" タブラインの表示設定
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
" 常にタブラインを表示
set showtabline=2
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" カーソルラインとカラムのハイライト設定
" 参考: http://thinca.hatenablog.com/entry/20090530/1243615055
"       http://qiita.com/koara-local/items/57b5f2847b3506a6485b
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" カーソルラインのグループをONにする
function! g:auto_vimrc_auto_cursorline() " {{{
    augroup vimrc-auto-cursorline
        autocmd!
        autocmd InsertLeave,CursorMovedI * call s:auto_cursorline('off')
        autocmd InsertEnter,VimEnter,CursorHold,CursorHoldI * call s:auto_cursorline('on')
    augroup END
endfunction " }}}
" カーソルラインのグループをOFFにする
function! g:noauto_vimrc_auto_cursorline() " {{{
    augroup vimrc-auto-cursorline
        autocmd!
        call s:auto_cursorline('off')
    augroup END
endfunction " }}}
" カーソルライングループ用関数定義
function! s:auto_cursorline(event) " {{{
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
endfunction " }}}
" 呼び出し
call g:auto_vimrc_auto_cursorline()
""" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""
" コマンドコード：相対的な番号と絶対的な行番号をトグル
" 挿入モード：絶対的な番号
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" 相対行番号のグループをONにする
function! g:auto_vimrc_auto_relativenumber() " {{{
    augroup vimrc-auto-relativenumber
        autocmd!
        autocmd InsertEnter,CursorHold,CursorHoldI,VimEnter * call s:toggleNumberOption('on')
        autocmd InsertLeave,CursorMovedI * call s:toggleNumberOption('off')
    augroup END
endfunction "}}}
" 相対行番号のグループをOFFにする
function! g:noauto_vimrc_auto_relativenumber() " {{{
    augroup vimrc-auto-relativenumber
        autocmd!
        call s:toggleNumberOption('off')
    augroup END
endfunction " }}}
" 行番号グループ用関数定義
function! s:toggleNumberOption(event) "{{{
    if a:event ==# 'on'
        if&number
            setlocal relativenumber
        else
            setlocal number
        endif
    elseif a:event ==# 'off'
        if&number
            setlocal norelativenumber
        else
            setlocal number
        endif
    endif
endfunction "}}}
" 呼び出し
call g:auto_vimrc_auto_relativenumber()
""" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""
"" 貼り付け時、自動でインデント無効化(pasteモード)
"" 参考 : http://qiita.com/ryoff/items/ad34584e41425362453e
""""""""""""""""""""""""""""""""""""""""""""""""""
"""" {{{
"if &term =~ "xterm"
"    let &t_ti .= "\e[?2004h"
"    let &t_te .= "\e[?2004l"
"    let &pastetoggle = "\e[201~"
"
"    function! s:XTermPasteBegin(ret)
"        set paste
"        return a:ret
"    endfunction
"
"    noremap <special> <expr> <Esc>[200~ s:XTermPasteBegin("0i")
"    inoremap <special> <expr> <Esc>[200~ s:XTermPasteBegin("")
"    cnoremap <special> <Esc>[200~ <nop>
"    cnoremap <special> <Esc>[201~ <nop>
"endif
"""" }}}

""""""""""""""""""""""""""""""""""""""""""""""""
" FileType定義
""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
"autocmd BufRead,BufNewFile *.py setfiletype python
""" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle開始
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
"NeoBundle Scripts-----------------------------
if &compatible
      set nocompatible               " Be iMproved
endif

" Required:
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグイン {{{
" Add or remove your Bundles here:
if has('lua') && (( v:version == 703 && has('patch885')) || (v:version >= 704))
    NeoBundle 'Shougo/neocomplete'
else
    NeoBundle 'Shougo/neocomplcache'
endif
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

NeoBundleLazy 'vim-scripts/python_fold' , {
\    "autoload" : {"filetypes" : ["python"]}
\}
""" }}}

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
" Shougo/neosnippte設定
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

"""""""""""""""""""""""""""""""""""""""""""""""""
" Shougo/neocompleteの設定
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""
" vim-scripts/python_fold設定
"""""""""""""""""""""""""""""""""""""""""""""""""
""" {{{
" 相対行番号のグループをONにする
function! g:vimrc_python_fold() " {{{
    augroup vimrc-python-fold
        autocmd!
        autocmd FileType python call s:python_fold('on')
    augroup END
endfunction "}}}
" 相対行番号のグループをOFFにする
function! g:novimrc_python_fold() " {{{
    augroup vimrc-python-fold
        autocmd!
        call s:python_fold('off')
    augroup END
endfunction " }}}
" 行番号グループ用関数定義
function! s:python_fold(event) "{{{
    if a:event ==# 'on'
        setlocal foldmethod=expr
        setlocal foldexpr=GetPythonFold(v:lnum)
        setlocal foldtext=PythonFoldText()
    elseif a:event ==# 'off'
        setlocal foldmethod=marker
        setlocal foldexpr
        setlocal foldtext
    endif
endfunction "}}}
" 呼び出し
call g:vimrc_python_fold()
""" }}}
