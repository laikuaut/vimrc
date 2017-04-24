# vimrc
vim設定ファイル

## ノーマルvimrc

プラグインなしで、純粋なvim環境で動作可能

```
.vimrc_normal
```

## Neo vimrc

NeoBundle導入版のvim環境

```
.vimrc_neo
```

### neoBuldleの導入

インストール用のスクリプトを実行する

```
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
./install.sh
```

以下のような標準出力が出るので、vimrcに転記

```Vim
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
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

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
```

### luaを有効化

```Bash
# lua-develインストール
yum install -y lua-devel perl-ExtUtils-Embed
# luajitインストール
wget http://luajit.org/download/LuaJIT-2.0.3.tar.gz
tar zxvf LuaJIT-2.0.3.tar.gz
cd LuaJIT-2.0.3/
make
sudo make install
echo 'export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"' >> ~/.bash_profile
# vim7.4インストール
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar xvf vim-7.4.tar.bz2
cd vim74/
./configure \
 --prefix=/usr/local \
 --enable-multibyte \
 --enable-xim \
 --enable-fontset \
 --enable-perlinterp \
 --with-features=huge \
 --disable-selinux \
 --enable-luainterp=yes \
 --enable-rubyinterp \
 --enable-python3interp \
 --with-python3-config-dir=~/.pyenv/versions/3.5.2/lib/python3.5/config-3.5m/ \
 --with-luajit \
 --with-ruby-command=~/.rbenv/shims/ruby \
 --enable-fail-if-missing
make
make install
```

### プラグイン一覧

* [Shougo/neobundle.vim](https://github.com/Shougo/neobundle.vim)
* [Shougo/neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim)
* [Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
* [Shougo/neosnippet.vim](https://github.com/Shougo/neosnippet.vim)
* [Shougo/neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [Shougo/unite.vim](https://github.com/Shougo/unite.vim)
* [Shougo/neomru.vim](https://github.com/Shougo/neomru.vim)
* [vim-scripts/python_fold](https://github.com/vim-scripts/python_fold)

#### Shougo/neocomplcache.vim

入力補完機能を提供する Vim のプラグイン。  

#### Shougo/neocomplete.vim

入力補完機能を提供する Vim のプラグイン。  
これを利用するにはluaを有効化する必要がある。  
luaの有効か方法は、[luaを有効化](https://github.com/laikuaut/vimrc#lua%E3%82%92%E6%9C%89%E5%8A%B9%E5%8C%96)を参照  

#### Shougo/neosnippet.vim

Vimでスニペット機能が使えるようになるプラグイン。  
入力補完である、「Shougo/neocomplcache.vim」もしくは、「Shougo/neocomplete.vim」と合わせて使うと使いやすい。  

#### Shougo/neosnippet-snippets

拡張子毎に基本的なスニペットは利用するための導入プラグイン。  

* Ctrl+n : 次の候補
* Ctrl+p : 前の候補
* Ctrl+k : スぺニット展開

#### tpope/vim-fugitive

vim用のgitラッパープラグイン。  

早見表(参考 : [http://blog.yuku-t.com/entry/20110427/1303868482](http://blog.yuku-t.com/entry/20110427/1303868482))  
これらのコマンドは全てgitリポジトリ内でのみ操作可能。  

* Gstatus
    + 新しい窓を作ってgit statusを表示
* Gwrite
    + 現在開いているソースをgit add
* Gread
    + 現在開いているソースの直前のコミット時のソースを表示
* Gmove destination/path
    + 現在開いているソースをgit mvする
* Gremove
    + 現在開いているソースをgit rmする
* Gcommit
    + git commit
* Gblame
    + 現在のソースをgit blame。vimが色づけしてくれる
* Gdiff
    + 現在のソースの変更点をvimdiffで表示 

#### ctrlpvim/ctrlp.vim

ファイルの検索やバッファの検索などの機能などを提供するプラグイン。  
(参考 : [http://qiita.com/oahiroaki/items/d71337fb9d28303a54a8](http://qiita.com/oahiroaki/items/d71337fb9d28303a54a8)

MRUを一番使うため、Ctrl+Pに設定する。
```Vim
let g:ctrlp_map = '<Nop>'
nnoremap <C-p> :<C-u>CtrlPMRUFiles<CR>
```

##### CtrlP起動、終了

* Ctrl+p
    + CtrlP起動
* Ctrl+c, ESC
    + CtrlP終了

##### CtrlPモード切替

* Ctrl+d
    + フルパス検索モード(path)とファイル名のみの検索モード(file)を切り替え
* Ctrl+r
    + 正規表現検索モードと通常の検索モードを切り替え
* Ctrl+f, Ctrl+b
    + 検索対象を切り替え
        - files : カレントディレクトのファイル一覧
        - buffers : 開いているバッファー一覧
        - mru_files : 開いた履歴からファイル一覧

##### コマンドライン操作

* Ctrl+j
    + 下を選択
* Ctrl+k
    + 上を選択
* Ctrl+a
    + カーソルを先頭に
* Ctrl+e
    + カーソルを最後尾に
* Ctrl+u
    + コマンドラインをクリア
* Ctrl+n,Ctrl+p
    + コマンド入力履歴を辿る

##### ファイル操作

* CR(Enter)
    + 現在のウインドウで開く
* Ctrl+t
    + 新しいタブで開く
* Ctrl+v
    + 垂直分割して開く
* Ctrl+s,Ctrl+CR
    + 水平分割して開く

#### Shougo/unite.vim

vim 用の統合ユーザインターフェースを提供するプラグイン。  

#### Shougo/neomru.vim

unite.vimでfile_mruを使うためのプラグイン。  

[補足]  
* mru(Most Recently Used) : 開いたファイルの履歴を管理して、最近開いたファイルに簡単にアクセスできるようにする

#### vim-scripts/python_fold

pythonコードの折り畳みプラグイン  
pythonファイルの場合だけ処理してほしいため、以下で記述  

```Vim
NeoBundleLazy 'vim-scripts/python_fold' , {
\    "autoload" : {"filetypes" : ["python"]}
\}
```

ただし、これでは初回しか適用されない(中身がsetlocalになっているためグローバル設定にはならない)。  
autocmdを使って、pythonファイルが開いたときにのみ適用されるように修正する。  
コードの詳細は、.vimrc_neoの「vim-scripts/python_fold設定」を参照  

