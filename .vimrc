"""""""""""""""""""""""""""""""""""""""""""""""""
" 基本設定
"""""""""""""""""""""""""""""""""""""""""""""""""
" vim のデフォルト設定にする
set nocompatible
" ＜TAB>入力時、空白を挿入にする
set expandtab
" タブ表示幅を設定
set tabstop=4
" <TAB>入力時、挿入する文字数を設定
set softtabstop=4
" 自動インデントを行った際、設定する空白数
set shiftwidth=4
" インデント自動的
set autoindent
" 行番号を表示
set number
" 非表示文字を表示
set list
" 非表示文字の表示文字を設定
set listchars=tab:>-,trail:_
" ステータスラインの設定
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" ステータスラインを常に表示
set laststatus=2
" 検索結果をハイライト表示する
set hlsearch
" インクリメンタルサーチを有効にする
set incsearch


"""""""""""""""""""""""""""""""""""""""""""""""""
" カラースキーマを設定
"""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""
" キーマップを設定
"""""""""""""""""""""""""""""""""""""""""""""""""
"nmap h <Insert>
"nmap i <Up>
"nmap j <Left>
"nmap k <Down>
"nmap l <Right>

"""""""""""""""""""""""""""""""""""""""""""""""""
" タブラインを設定
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
