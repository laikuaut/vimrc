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

### プラグイン一覧

* [Neosnippet](https://github.com/Shougo/neosnippet.vim)

#### Neosnippet


