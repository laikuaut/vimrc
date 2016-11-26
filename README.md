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

#### Shougo/neocomplcache.vim

#### Shougo/neocomplete.vim

#### Shougo/neosnippet.vim

#### Shougo/neosnippet-snippets

#### tpope/vim-fugitive

これらのコマンドは全てgitリポジトリ内でのみ操作可能だ。

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

#### Shougo/unite.vim

#### Shougo/neomru.vim



