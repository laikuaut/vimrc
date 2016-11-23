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
yum install -y lua-devel perl-ExtUtils-Embed
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar xvf vim-7.4.tar.bz2
cd vim74/
./configure \
 --prefix=/usr/local \
 --enable-multibyte \
 --enable-xim \
 --enable-fontset \
 --enable-rubyinterp \
 --enable-perlinterp \
 --enable-pythoninterp \
 --enable-python3interp \
 --with-features=huge \
 --disable-selinux \
 --enable-luainterp=yes \
 --with-ruby-command=/usr/bin/ruby \
 --with-luajit \
 --with-python-config-dir=/usr/lib64/python2.7/config \
 --with-python3-config-dir=~/.pyenv/shims/python3.5-config
make
make install
```

### プラグイン一覧

* [Shougo/neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim)
* [Shougo/neocomplete.vim](https://github.com/Shougo/neocomplete.vim)
* [Shougo/neosnippet.vim](https://github.com/Shougo/neosnippet.vim)
* [Shougo/neosnippet-snippets](https://github.com/Shougo/neosnippet-snippets)

#### Neosnippet


