"deinの設定
" プラグインが実際にインストールされるディレクトリ
"let s:dein_dir = expand('~/.cache/dein')
"" dein.vim 本体
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"
"" dein.vim がなければ github から落としてくる
"if &runtimepath !~# '/dein.vim'
"  if !isdirectory(s:dein_repo_dir)
"    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
"  endif
"  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
"endif
"
"" 設定開始
"if dein#load_state(s:dein_dir)
"  call dein#begin(s:dein_dir)
"
"  " プラグインリストを収めた TOML ファイル
"  " 予め TOML ファイル（後述）を用意しておく
"  let g:rc_dir    = expand('~/.vim/rc')
"  let s:toml      = g:rc_dir . '/dein.toml'
"  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
"
"  " TOML を読み込み、キャッシュしておく
"  call dein#load_toml(s:toml,      {'lazy': 0})
"  call dein#load_toml(s:lazy_toml, {'lazy': 1})
"
"  " 設定終了
"  call dein#end()
"  call dein#save_state()
"endif

"" もし、未インストールものものがあったらインストール
"if dein#check_install()
"  call dein#install()
"endif



"""""""""""
""" PHP """
"""""""""""

"PHP関数補完
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

"Syntax Check
augroup PHP
  autocmd!
  autocmd FileType php set makeprg=php\ -l\ %
  " php -lの構文チェックでエラーがなければ「No syntax errors」の一行だけ出力される
  autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
augroup END

" なくてもいいけどあった方がより便利
syntax on

" bash のインデント
augroup BASH
  autocmd!
  autocmd BufNewFile *.sh put ='#!/bin/bash'
  autocmd BufNewfile *.sh 1
  autocmd BufNewfile *.sh d 1
  autocmd FileType sh :set tabstop=2
augroup END

"Syntax Check
"autocmd FileType php set makeprg=php\ -l\ %
"autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" tagsジャンプの設定(対象リポジトリ増えたら追加する。「,」区切り？)
" ctags --languages=php --langmap=PHP:.php.inc.tpl -f ~/.vim/tags/ebis_acbatch.tags `pwd`
autocmd FileType php set tags=$HOME/.vim/tags/ebis_acbatch.tags,$HOME/.vim/tags/ebis_refweb.tags

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

""""""""""""""""
""" 各種設定 """
""""""""""""""""

" クリップボードへの貼り付け(正常に動いてないぽい)
"set clipboard&
"set clipboard^=unnamedplus

"文字コードをUFT-8に設定
"set fenc=utf-8

" 行番号を表示
set number

" 色をつける
:syntax on

" コメントの色を青に
:hi Comment ctermfg=blue

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

set visualbell
" 括弧入力時の対応する括弧を表示

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" ソースコードのクラス遷移設定
set tag=/mnt/workspace/ebis_refweb/tags

" 改行での自動コメントアウト無効
au FileType * setlocal formatoptions-=ro

" バックスペースの設定
set backspace=indent,eol,start

autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4


" autocmd FileType php set makeprg=php\ -l\ %
" autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
" 行末空白の自動削除
" autocmd BufWritePre * :%s/\s\+$//ge

" 行末スペースのハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\(　\|\s\+$\)/
augroup END
"au BufRead,BufNew * match JpSpace /　/

" 検索結果をハイライト
set hlsearch

"ステータスラインを常に表示
set laststatus=2
"ファイル名表示
set statusline+=%<%F
"読み込み専用かどうか表示
set statusline+=%r
"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
set statusline+=%y
"ここからツールバー右側
set statusline+=%=
"文字バイト数/カラム番号
set statusline+=[%{col('.')-1}=ASCII=%B,HEX=%c]
"現在文字行/全体行表示
set statusline+=[L=%l/%L]

"行のハイライト
set cursorline

" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=darkgreen
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=lightmagenta
highlight DiffChange cterm=bold ctermfg=10 ctermbg=darkblue
highlight DiffText   cterm=bold ctermfg=10 ctermbg=darkcyan

"ファイルタイプの検索を有効にする
filetype plugin on
"ファイルタイプに合わせたインデントを利用
autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et

"
"改行文字とタブ文字を表示

"set list
"set listchars=tab:>-,eol:<

""改行文字とタブ文字の色設定（NonTextが改行、SpecialKeyがタブ）

hi NonText guibg=NONE guifg=DarkGreen
set t_Co=256

" ビープ音の削除
set vb t_vb=
