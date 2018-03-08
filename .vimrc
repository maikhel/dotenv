" leader
let mapleader = " "

" for installing plugins
execute pathogen#infect()

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Set the type for the file type but do NOT override if file type
" already has detected
au BufRead,BufNewFile *.es6 set filetype=javascript

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
  \ 'ruby': ['rubocop']
  \ }

" Run ale linter only on file save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" for fixing files
let b:ale_fixers = ['eslint', 'rubocop']
nmap <C-F> <Plug>(ale_fix)
nmap <C-N> <Plug>(ale_next)

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Make it obvious where 80 characters is
" set textwidth=80
set colorcolumn=+1
colo pablo

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
