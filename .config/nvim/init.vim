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

" yaml intentation
Plug 'avakhov/vim-yaml'

" CSV support
Plug 'chrisbra/csv.vim'

Plug 'eandrju/cellular-automaton.nvim'

call plug#end()

" basic
let mapleader=" "


set tabstop=4               " number of spaces for TAB
set softtabstop=4           " number of spaces of tab when editing
set shiftwidth=4            " number of spaces to use for autoindent
set expandtab               " converts tabs to spaces
set number                  " show line numbers
set noswapfile              " don't create swap files

" yank to clipboard
set clipboard+=unnamedplus

" split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" fuzzy file finder
nnoremap <leader>f :FuzzyOpen<cr>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

nnoremap <leader>w :w<cr>   " quickly save

" ale (linter)
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_linters = {'python': ['flake8']}

" Python
" run execute python file 
autocmd FileType python nnoremap <buffer> <leader>b :w<Return>:!python %<Return>
" see pydoc
autocmd FileType python nnoremap <buffer> <leader>i :<C-u>execute "!pydoc " . expand("<cword>")<CR>
" run tests 
autocmd FileType python nnoremap <buffer> <leader>t :w<Return>:!python -m pytest<Return>

" C
" compile and run file
autocmd FileType c nnoremap <buffer> <leader>b :w<Return>:!exe=$(echo % | sed "s/\.c//g") && cc -o $exe % && ./$exe<Return>
