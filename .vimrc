"---------------------___定义快捷键前缀，即<leader>_____----------------------------------------------------------
let mapleader=";"
"--------------------文件类型侦测-----------------------------------------------------------
filetype on "开启文件类型侦测
filetype plugin on  "根据侦测到不同类型加载对应的插件


"---------------------___vim常用操作快捷键_____----------------------------------------------------------
nmap LB 0 
nmap LE $
"LB行首LE行尾

vnoremap <Leader>y "+y
"设置快捷键将选中文本块复制到系统剪贴板

nmap <Leader>p "+p
"设置快捷键将系统剪贴板内容粘贴到 vim

nmap <Leader>q :q<CR>
"定义快捷键关闭当前分割窗口

nmap <Leader>w :w<CR>
"定义快捷键保存当前窗口内容

nmap <Leader>WQ :wa<CR>:q<CR>
"定义快捷键保存所有窗口内容并退出 vim

nmap <Leader>Q :qa!<CR>
"不做任何保存，直接退出vim

nnoremap nw <C-W><C-W>
"依次遍历子窗口

nnoremap <Leader>lw <C-W>l
"跳转至右方的窗口

nnoremap <Leader>hw <C-W>h
"跳转至左方的窗口

nnoremap <Leader>kw <C-W>k
"跳转至上方的子窗口

nnoremap <Leader>jw <C-W>j
"跳转至下方的子窗口

nmap <Leader>M %
"在结对符之间跳转
"--------------------------------------------------------------------------------------


"---------------------__让配置变更立即生效______----------------------------------------------------------
autocmd BufWritePost $MYVIMRC source $MYVIMRC


"---------------------________----------------------------------------------------------

"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------
"---------------------________----------------------------------------------------------

"--------------------原有配置----------------------------------------------------
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
set nocompatible 
filetype off
syntax on
syntax enable1:
set number
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on
let mapleader = ","
map <silent> <leader>ee : !vim ~/.vimrc<cr>
autocmd BufNewFile *.c,*.hpp,*.cpp,*.cc exec "call Addreadme()"
function Addreadme()
	call setline(1,"///")
	call append(1,"///@file     ".expand("%:t"))
	call append(2,"///@author     Jason(13933536151@163.com)")
	call append(3,"///@data     ".strftime("%Y-%m-%d %H:%M:%s"))
	call append(4,"///")
	call append(5,"  ")
	call append(6,"#include<iostream>")
	call append(7,"using std::cout;")
        call append(8,"using std::cin;")         
	call append(9,"using std::endl;")      
      "  call append(10,"using std::cout;")	"
	call append(10," ")
	call append(11,"int main()")
	call append(12,"{")
	call append(13," ")
	call append(14,"}")

endf



let g:airline_theme='<theme>'
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#left_alt_sep = '|'
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts =1

set ruler
set cursorline
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set matchtime=1
set smartindent
set scrolloff=3

"//-------------------------YouCompleteME--------------------//
"YouCompleteMe:语法补全插件
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples'
"let g:ycm_server_python_interpreter='/usr/lib/python3.6'
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level = 'debug'

"括号补全
inoremap( ()<ESC>i

inoremap[ []<ESC>i

inoremap{ {}<ESC>i
"//-------------------------语法检错----------------------
let g:syntastics_igonre_files=[".*\.py$"]
let g:syntastics_always_populate_loc_list=1
let g:syntastics_check_on_open=1
let g:syntastics_auto_jump=1
let g:syntastics_cpp_compiler = 'clang++'
let g:syntastics_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

"syntastic
"设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='►'
"总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
let g:syntastic_always_populate_loc_list = 1
"自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
let g:syntastic_auto_loc_list = 1
"修改Locaton List窗口高度
let g:syntastic_loc_list_height = 5
"打开文件时自动进行检查
let g:syntastic_check_on_open = 1
"自动跳转到发现的第一个错误或警告处
let g:syntastic_auto_jump = 1
"进行实时检查，如果觉得卡顿，将下面的选项置为1
let g:syntastic_check_on_wq = 0
"高亮错误
let g:syntastic_enable_highlighting=1
"让syntastic支持C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"设置pyflakes为默认的python语法检查工具
let g:syntastic_python_checkers = ['pyflakes']
"修复syntastic使用:lnext和:lprev出现的跳转问题，同时修改键盘映射使用sn和sp进行跳转
function! <SID>LocationPrevious()                       
  try                                                   
    lprev                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    llast                                               
  endtry                                                
endfunction                                             
function! <SID>LocationNext()                           
  try                                                   
    lnext                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    lfirst                                              
  endtry                                                
endfunction                                             
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> sp    <Plug>LocationPrevious              
nmap <silent> sn    <Plug>LocationNext
"关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

