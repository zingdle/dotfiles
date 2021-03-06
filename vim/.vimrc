" sudo apt install clang-format python-autopep8

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" terminal enhancement
Plug 'wincent/terminus'

" color scheme
Plug 'chriskempson/base16-vim'

" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" welcome page
Plug 'mhinz/vim-startify'

" indent line
Plug 'Yggdroot/indentLine'

" underline all the word under the cursor
Plug 'itchyny/vim-cursorword'

" <leader>ci toggle comment
Plug 'scrooloose/nerdcommenter'

" fast moves
" <leader><leader>w/b find following/previous word
" <leader><leader>j/k find following/previous line
" <leader><leader>h/l find within this line
" <leader><leader>s find with search
Plug 'easymotion/vim-easymotion'

" pair brackets
Plug 'Raimondi/delimitMate'

" surround
" cs"' change surround from " to '
" ds" delete surround "
" ysiw" add current word by surround "
Plug 'tpope/vim-surround'

" git support
Plug 'airblade/vim-gitgutter'

" formatter
Plug 'Chiel92/vim-autoformat'

" syntax highlight for cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" show doc
Plug 'Shougo/echodoc.vim'

" nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree'

" ycm
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

call plug#end()

" map leader
let mapleader = " "

" color scheme
set termguicolors
color base16-onedark

" syntax highlight
syntax on

" line number
set number
set relativenumber

" leave space
set scrolloff=5

" highlight current line
set cursorline

" tab
set tabstop=4
set shiftwidth=4
set expandtab

" search
set incsearch
set ignorecase
set smartcase

" split
set splitbelow
set splitright

" clipboard
set clipboard=unnamedplus

" wildmenu
set wildmenu

" windows resize
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

"map jj to esc..
inoremap jj <c-[>
cnoremap <expr> j getcmdline()[getcmdpos()-2] ==# 'j' ? "\<BS>\<C-c>" : 'j'
inoremap j<Space> j
cnoremap j<Space> j

" vim-gitgutter
set updatetime=100

" nerdcommenter
let g:NERDSpaceDelims=1

" vim-autoformat
let g:formatters_python = ['autopep8']
let b:formatdef_custom_cpp = '"clang-format -style=LLVM"'
let g:formatters_cpp = ['custom_cpp']
" au BufWrite * :Autoformat

" echodoc
let g:echodoc#enable_at_startup=1
set noshowmode

" NERDTree
map <leader>t :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

" ycm
set completeopt=menu,menuone
" let g:ycm_goto_buffer_command = 'vertical-split'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python': ['re!\w{2}'],
            \ }
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "sh":1,
            \ }

nnoremap <leader>ld :YcmCompleter GoToDefinitionElseDeclaration<CR>

function SetYCMShortcuts()
    " nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
    " nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
    " nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
    " nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
    " nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
    " nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
    " nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
    " nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    " nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
    " nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup YCM
    autocmd!
    autocmd FileType cpp,c call SetYCMShortcuts()
augroup END
