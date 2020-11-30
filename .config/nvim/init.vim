" vin-plug plugins
call plug#begin(stdpath('data') . '/plugged')

" fuzzy file finder
Plug 'cloudhead/neovim-fuzzy'

" display vertical lines to better visulize code blocks
Plug 'Yggdroot/indentLine'

" async linting engine
Plug 'w0rp/ale'

" see ANSI colors
Plug 'vim-scripts/AnsiEsc.vim'

" nerdtree file viewer
Plug 'scrooloose/nerdtree'

" fugitive for enhanced git integration
Plug 'tpope/vim-fugitive'

" yaml intentation
Plug 'avakhov/vim-yaml'

" CSV support
Plug 'chrisbra/csv.vim'

call plug#end()

" fuzzy file finder
nnoremap <C-F> :FuzzyOpen<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" basic
set tabstop=4               " number of spaces for TAB
set softtabstop=4           " number of spaces of tab when editing
set shiftwidth=4            " number of spaces to use for autoindent
set expandtab               " converts tabs to spaces
set number                  " show line numbers
set noswapfile              " don't create swap files

" yank to clipboard
set clipboard+=unnamedplus

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ale (linter)
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_linters = {'python': ['flake8']}

" Python
" run execute python file with ctrl + b
autocmd FileType python nnoremap <buffer> <C-B> :w<Return>:!python %<Return>
" see pydoc
autocmd FileType python nnoremap <C-I> :<C-u>execute "!pydoc " . expand("<cword>")<CR>
" run tests
autocmd FileType python nnoremap <buffer> <C-T> :w<Return>:!nosetests -v --nocapture<Return>

" C
" compile and run file with ctrl + b
autocmd FileType c nnoremap <buffer> <C-B> :w<Return>:!exe=$(echo % | sed "s/\.c//g") && cc -o $exe % && ./$exe<Return>
