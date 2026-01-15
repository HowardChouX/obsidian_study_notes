" 启用系统剪贴板
set clipboard=unnamedplus

" 映射 jj 为 Esc
inoremap jj <Esc>

" 连按间隔时间
set timeoutlen=250

" 映射 Ctrl+C 复制 / Ctrl+V 粘贴
vnoremap <C-c> "+y
nnoremap <C-v> "+p

" 显示行号与模式状态
set number
set showmode
set showcmd

