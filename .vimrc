" leader
let mapleader = " "

" for installing plugins
execute pathogen#infect()

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nolist
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set encoding=utf-8

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" For looong files
set synmaxcol=200

syntax enable
set background=dark
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "normal"
colorscheme solarized

" Set the type for the file type but do NOT override if file type
" already has detected
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile Dockerfile.* set filetype=Dockerfile

" use Emmet only for html and css files
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" make indentation easier
filetype indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set shell=bash

" Enable copy to clipboard
set clipboard=unnamed

" use only specified linters
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'python': ['pylint'],
  \ 'ruby': ['rubocop']
  \ }

" Run ale linter only on file save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
" use bundle exec rubocop for invoking rubocop
let g:ale_ruby_rubocop_executable = 'bundle'

" for fixing files
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'python': ['autopep8'],
  \ 'ruby': ['rubocop']
  \ }
nmap <C-F> <Plug>(ale_fix)
nmap <C-N> <Plug>(ale_next)

" Ignore some folders and files for CtrlP indexing
"
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|public$|tmp$|node_modules$',
  \ 'file': '\v\.(exe|so|dat|DS_Store)$'
  \ }

" open NerdTree automatically if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

" NerdTree shortcuts
nnoremap <C-B><C-B> :NERDTreeToggle<CR>
nnoremap <silent> <C-B><C-L> :NERDTreeFind<CR>

" strip white spaces
nnoremap <C-W><C-W> :StripWhitespace<CR>

" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" create a new todo item
nnoremap gt o  _<Space>
" check off a todo item and time stamp it
nnoremap gd ^rx: <Esc>:r! date +" [\%H:\%M]"<ENTER>kJA<Esc>$

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Make it obvious where 80 characters is
" set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" For annoying CAPS LOCK disabling
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
 " for c in range(char2nr('A'), char2nr('Z'))
 "   execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
 "   execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
 " endfor
 " " Kill the capslock when leaving insert mode.
 " autocmd InsertLeave * set iminsert=0

" Use more natural commands for switching windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" For searching selection
vnoremap // y/<C-R>"<CR>
