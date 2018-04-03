set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax on
set mouse=a

" -------------------------------------------------
" vundle
" -------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Add more movement commands
Plugin 'tpope/vim-vinegar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
"
" Vim theme
Plugin 'tomasiser/vim-code-dark'

"--------------------------------------------------
"Syntax and colors
"--------------------------------------------------
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'gregsexton/matchtag'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'fleischie/vim-styled-components'
Plugin 'isRuslan/vim-es6'
Plugin 'tomtom/tcomment_vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'

"show tabs and trailing spaces
set list listchars=tab:»·,trail:·
augroup ft_go
    au!

    au Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
    au Filetype go setlocal listchars+=tab:\ \ 
augroup END

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_javascript_prettier_options = '--trailing-comma all --write'
let g:ale_fix_on_save = 1


"--------------------------------------------------
"Text manpilation
"--------------------------------------------------
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'sbdchd/neoformat'

" -------------------------------------------------
" syntax error checking
" -------------------------------------------------
"Plugin 'scrooloose/syntastic'

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" -------------------------------------------------
"  moving around, searching and patterns
" -------------------------------------------------
"ctrlp search mode
let g:ctrlp_working_path_mode = 'r'

"Ignore case in search mode
set ignorecase

"Do not ignore uppercase
set smartcase

"highlight search resules
set hlsearch

"Ctrlp ignore folders
set wildignore+=*/cache/*,*/node_modules/*,*/vendor/*,*/craft/*

" -------------------------------------------------
"  mapping
" -------------------------------------------------
"  NERDTree mapping
map <C-n> :NERDTreeToggle<CR>
colorscheme codedark

map <c-t> :tabnew<CR>
"column to display the limit row
let &colorcolumn=join(range(81,999),",")
" change split directions because it feels better to me that way.
set splitbelow
set splitright

" -------------------------------------------------
"  autocompletion
" -------------------------------------------------
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

autocmd FileType js UltiSnipsAddFiletypes javascript-react
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
