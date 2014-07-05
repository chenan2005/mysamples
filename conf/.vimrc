" filetypes
"filetype plugin off
"filetype indent off
set fileencodings=utf-8,gbk,latin1,ucs2,ucs4
let mapleader = ","
"create ctags and load it
map <silent> <leader>tc :let last_working_dir=getcwd()<cr>:cd ~/<cr>:execute '!ctags -R -f ~/.mytags /usr/include /usr/local/include '.last_working_dir<cr>:set tags=~/.mytags<cr>:execute 'cd '.last_working_dir<cr>:echo "tag file ~/.mytags created and loaded"<cr>
"load ~/mytags
"map <silent> <leader>rt :if findfile(".mytags", "~/") == ".mytags"<cr>set tags=~/.mytags<cr>else<cr>echo "file '~/.mytags' not exist"<cr>endif<cr>
map <silent> <leader>tl :if filereadable(expand("~")."/.mytags")<cr>set tags=~/.mytags<cr>echo "file '~/.mytags' loaded"<cr>else<cr>echo "file '~/.mytags' not exist"<cr>endif<cr>
"reload ~/.vimrc
map <silent> <leader>vr :source ~/.vimrc<cr>:echo "~/.vimrc reloaded"<cr>
map <silent> <leader>h :echo ",tc  :create ctags file ~/.mytags and load it \n,tl  :load ~/.mytags\n,vr  :reload ~/.vimrc\n\<C-_\>h  :cscope key map help info\n\<F7\>h :compile and quickfix help info"<cr>
"set path include common include file
set path=.
set path+=/usr/include/**
set path+=/usr/local/include
"always show current file path
set statusline+=%F
"if exist workspace.vim at current working directory, load it
if findfile("workspace.vim", ".") == "workspace.vim"
	source workspace.vim
endif

if filereadable(expand("~")."/.mytags")
	set  tags=~/.mytags
endif

if has("cscope")
	set csprg=/usr/local/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif
map <silent> <C-_>h :echo "0 or s: Find this C symbol\n1 or g: Find this definition\n2 or d: Find functions called by this function\n3 or c: Find functions calling this function\n4 or t: Find this text string\n6 or e: Find this egrep pattern\n7 or f: Find this file\n8 or i: Find files #including this file"<cr>
map <silent> <C-_>s :cs find s <C-R><C-W><CR>
map <silent> <C-_>g :cs find g <C-R><C-W><CR>
map <silent> <C-_>d :cs find d <C-R><C-W><CR>
map <silent> <C-_>c :cs find c <C-R><C-W><CR>
map <silent> <C-_>t :cs find t <C-R><C-W><CR>
map <silent> <C-_>e :cs find e <C-R><C-W><CR>
map <silent> <C-_>f :cs find f <C-R><C-W><CR>
map <silent> <C-_>i :cs find i <C-R><C-W><CR>

map <silent> <F7>h :echo "c: make currentfile.o at current working directory\nx: goto current file directory and make currentfile.o\nl: list make error list\nn: fix next warning or error\nf :jump to first"<cr>

map <silent> <F7>c :make <C-R>=expand("%:t:r").".o"<cr><cr>
map <silent> <F7>x :let last_working_dir=getcwd()<cr>:execute 'cd '.expand('%:p:h')<cr>:make <C-R>=expand("%:t:r").".o"<cr><cr><cr>:execute 'cd '.last_working_dir<cr>
map <silent> <F7>l :cl<cr>
map <silent> <F7>n :cn<cr>
map <silent> <F7>f :cfir<cr><cr>

set nu
