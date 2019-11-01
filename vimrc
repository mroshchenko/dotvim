"====================General=====================

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable syntax highlighting.
syntax on

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" number of spaces in tab when editing
set softtabstop=4

augroup XML
    autocmd!
    autocmd FileType xml,xsd,html setlocal foldmethod=indent foldlevelstart=1 foldminlines=0
augroup END

augroup THRIFT
    autocmd!
    autocmd FileType thrift setlocal foldmethod=indent foldlevelstart=1 foldminlines=0 syntax=cpp
augroup END

" Minimal number of screen lines to keep above and below the cursor.
" set scrolloff=25

" You can always use Ctrl-o to do a single normal mode command.
" Eg if you start a sentence, and decide you want to deleting it and start again,
" you could enter Ctrl-o d( while in insert mode."

" Influences the working of `<BS>`, `<Del>`, `CTRL-W` and `CTRL-U` in Insert
" mode.  This is a list of items, separated by commas.  Each item allows
" a way to backspace over something:
" 
" value     effect
" indent    allow backspacing over autoindent
" eol       allow backspacing over line breaks (join lines)
" start     allow backspacing over the start of insert; CTRL-W and CTRL-U
"           stop once at the start of insert.
set backspace=2 " make backspace work like in most other programs

" Use UTF-8.
set encoding=utf-8

" Set color scheme.
" colorscheme desert

" Status line
set laststatus=2
set statusline=

" buffer number
set statusline+=%-3.3n\

" filename
set statusline+=%f\

" status flags
set statusline+=%h%m%r%w

" file type
set statusline+=\[%{strlen(&ft)?&ft:'none'}]

" right align remainder
set statusline+=%=

" character value
set statusline+=0x%-8B

" line, character
set statusline+=%-14(%l,%c%V%)

" file position
set statusline+=%<%P

" Show line number, cursor position.
"set ruler

" Display incomplete commands.
set showcmd 

" highlight matches and search as you type.
set hlsearch "incsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

" Show line numbers
set number
nnoremap <silent> <Leader>n :set number<CR>

" Highlight current line
set cursorline          

" Set line numbering to red background:
highlight CursorLineNR ctermbg=green

" Highlight matching [{()}]
set showmatch           

" If you want to make Vim wrap long lines to fit in the window,
" you first have to enable :set wrap. By default Vim will break lines
" at exactly the width of the window, which causes some words to be split across two lines.
" To prevent this from happening, you can enable :set linebreak.
set wrap linebreak
let &showbreak='↪ '

" Отключаем создание бэкапов
"set nobackup

"Reload files changed outside vim
set autoread

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
"set hidden

" Отключаем создание swap файлов
set noswapfile

" отключает перерисовку экрана на время выполнения макроса (существенно ускоряет работу)
set lazyredraw

" The 'winminwidht' ('wmw') option is the absolute minimum 
" width of a window that's not the current window.
silent! set winminwidth=70

"-----------------------Tags-----------------------------

" it will pop up on the right side of the vim window
" and show the tags picked up by ctags for the current file
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" To force a linear search, use this command:
set notagbsearch

" It tells Vim to look for a tags file in the directory of the current file,
" in the current directory and up and up until your $HOME
set tags=./tags,tags,~/prj/*/tags ";$HOME

" Build the global tag file, should be ran from /prjroot/
nmap <F10> :!ctags -R<CR><CR>

" Build a tag file. This can be easily done for the whole hierarchy by using shell scripts dirtags & nodestagging
nmap <F12> :!nodestagging<CR><CR>

" Is quite useful to rebuild the tag file in the directory of the current source file
nmap ,t :!(cd %:p:h;ctags --extras=+q *.[ch]*)&<CR><CR>

"-----------------------sgaT-----------------------------

"-----------------------Term-----------------------------

" Make another variant to manipulate with vim-term window
tnoremap <C-I> <C-W>

" Open vertical terminal window left from current window
nmap tl :vert ter<CR>

" Open terminal window in current window
nmap tc :ter ++curwin<CR>

" Open vertical terminal window right from current window
nmap tr :botright vs\|:ter ++curwin<CR>

"-----------------------Term-----------------------------

" To insert timestamp, press F3.
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" To save, press F2.
nmap <F2> :w<CR>
vmap <F2> <Esc>:w!<CR>
imap <F2> <Esc>:w!<CR>a

" To quit from editor with double Esc
nmap <Esc><Esc> :execute 'silent! q'<CR>

" Copy the relative path of the current file to the clipboard
"nmap <Leader>cf :silent !echo -n % \| pbcopy<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" In normal mode, press Space to toggle the current fold open/closed.
" However, if the cursor is not in a fold, move to the right (the default behavior).
" In addition, with the manual fold method, you can create a fold by visually selecting
" some lines, then pressing Space.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" You can use :mkview to save folds and such when you close a file -
" but you have to use :loadview next time you use the file.
" (be carefull, it should be used only with foldmethod=manual)
"autocmd BufWinLeave,VimLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

" Makes vim code folding colors more readable
highlight Folded ctermbg=NONE ctermfg=Grey

" a little cheat to make open/close folds more comfortable
"nmap <C-Space> za

" creates a fold from "{" to ecvivalent "}"
"nmap <S-F> zf%

" use Alt-Left and Alt-Right to move current tab to left or right
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" CTRL-F6 is :tabclose
nnoremap <F6> :tabclose<CR>

" turn off hl elements after Search
nnoremap <C-f> :nohlsearch<CR>

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape for QWERTY layout
inoremap jk <esc>

" make navigation between win more comfortable
nnoremap <Tab> <C-W>
nnoremap <Tab><Tab> <C-W><C-W>

" search for visually highlighted text
vmap // y/<C-R>"<CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Change cursor shape in different modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange * silent execute '!echo -ne "\e[5 q"' | redraw!
endif

" Show trailing whitespaces and tabs by specific charachters
if has('multi_byte')
     if version >= 700
       " set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
       set listchars=tab:▸\ ,trail:·,eol:$ " TextMate
     endif
endif
nmap <leader>l :set list!<CR>

" if you close a window by mistake and want it be recoveried
nmap <leader>t :vs \| bp<CR>

" ---------------- Persistent Undo --------------
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

"====================lareneG=====================

"====================NERDTree====================

" This option needs for correctly working nerdtree-git-plugin
" (uncomment it only if you have problems with this plugin)
"set shell=sh

" Open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
 
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open a NERDTree automatically when vim starts up on opening a directory executing vim ~/some-directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window left open is a NERDTree
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Directly open NerdTree on the file you’re editing to quickly perform operations on it with NERDTreeFind
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" This option is used to change the size of the NERD tree when it is loaded.
let NERDTreeWinSize=44

" Automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Looks nice and disable that old “Press ? for help”
let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 0"works only with old version of plugin
let NERDTreeDirArrowExpandable="+"
let NERDTreeDirArrowCollapsible="-"

" Tells the NERD tree whether to display the bookmarks table on startup.
let NERDTreeShowBookmarks = 1

"====================eerTDREN====================

"=========Setting from KONISHCHEV_DMITRY=========

" Ускоренное передвижение по тексту
nmap <C-H> 5h
nmap <C-J> 5j
nmap <C-K> 5k
nmap <C-L> 5l

" Переключение между заголовочными файлами и
" файлами с исходным кодом.
" -->
    "   Соответственно:
    "   ,s - переключение на исходный код
    "   ,S - тоже самое, только открыть в новом окне
    "   ,h - переключение на заголовочный файл
    "   ,H - тоже самое, только открыть в новом окне

    nmap ,h :call MySwitchToHeader()<CR>
    nmap ,H :call MySwitchToHeaderInNewWindow()<CR>
    nmap ,s :call MySwitchToSource()<CR>
    nmap ,S :call MySwitchToSourceInNewWindow()<CR>

    function! MySwitchToHeader()
        if &filetype == "c"
            silent! find %:t:r.h || silent! find %:t:r.hpp
            return
        end

        if &filetype == "cpp"
            silent! find %:t:r.h || silent! find %:t:r.hpp
            return           
        end
    endfunction

    function! MySwitchToHeaderInNewWindow()
        if &filetype == "c"
            silent! sf %:t:r.h || silent! sf %:t:r.hpp
            return
        end

        if &filetype == "cpp"
            silent! sf %:t:r.h || silent! sf %:t:r.hpp
            return
        end
    endfunction

    function! MySwitchToSource()
        if &filetype == "c"
            silent! find %:t:r.cpp || silent! find %:t:r.c
            return
        end

        if &filetype == "cpp"
            silent! find %:t:r.cpp || silent! find %:t:r.c
            return
        end
    endfunction

    function! MySwitchToSourceInNewWindow()
        if &filetype == "c"
            silent! sf %:t:r.cpp || silent! sf %:t:r.c
            return
        end

        if &filetype == "cpp"
            silent! sf %:t:r.cpp || silent! sf %:t:r.c
            return
        end
    endfunction
" <--

"=========YRTIMD_VEHCHSINOK morf gnitteS=========

" That function does two (useful) things: saving the “state”(of the cursor) 
" and executing a command to remove the trailing whitespace.
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" If you want to run this command automatically when a file is saved, add this:
autocmd BufWritePre *.py,*.js,*.cpp,*.c++,*.h,*.c,*.hpp,*.xml,*.xsd :call Preserve("%s/\\s\\+$//e")
" If you want to map this function to a key (e.g. F5), add this:
nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<CR>
