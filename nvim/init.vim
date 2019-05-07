call plug#begin()

Plug 'mhinz/vim-janah'
Plug 'reedes/vim-colors-pencil'
Plug 'chriskempson/base16-vim'
Plug 'meain/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'

" Making things easier
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTree', 'NERDTreeFind', 'NERDTreeToggle' ] } 

" Autocomplete and Language stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'ervandew/supertab'

call plug#end()

"                           Editor Settings                            "
"                    ==============================                    "

set updatetime=200

" Redraw only when essential
set lazyredraw

" Just sync some lines of a large file
set synmaxcol=400
syntax sync minlines=256

" Line Numbering
set number                     " Show current line number
set relativenumber             " Show relative line numbers

" Allow for Plugin
filetype plugin on
filetype indent on

" Highlight cursor line (slows down)
set nocursorline

" Auto read and write
set autowrite
set autoread

" Confirm before quit without save
set confirm

" Disable wrapping
set nowrap

" Set hidden
set hidden

" Better backup, swap and undos storage
" set backup                        " make backup files
" set undofile                      " persistent undos - undo after you re-open the file
" set directory=~/.vim/dirs/tmp     " directory to place swap files in
" set backupdir=~/.vim/dirs/backups " where to put backup files
" set undodir=~/.vim/dirs/undodir   " undo directory

" Allow mouse
set mouse=a

" Incremental search
set incsearch

" Highlighted search results
set hlsearch

" Smart search
set ignorecase

" show partial commands
set showcmd

" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

" ColorScheme change ( janah )
autocmd ColorScheme janah highlight Normal ctermbg=234 guibg=#1f1f1f
autocmd ColorScheme janah highlight SignColumn ctermbg=234 guibg=#1f1f1f
autocmd ColorScheme janah highlight LineNr ctermbg=234 guibg=#1f1f1f
autocmd ColorScheme janah highlight VertSplit ctermbg=234 guibg=#1f1f1f
autocmd ColorScheme janah highlight StatusLineNC guifg=#878787 ctermfg=102 ctermbg=NONE guibg=NONE gui=NONE cterm=NONE
autocmd ColorScheme janah highlight StatusLine guifg=#878787 ctermfg=102 guibg=#f5f5f5 ctermfg=253 gui=NONE cterm=NONE
autocmd ColorScheme janah highlight SignifySignAdd    cterm=bold gui=bold  ctermfg=119 guifg=#87ff5f guibg=#1f1f1f
autocmd ColorScheme janah highlight SignifySignDelete cterm=bold gui=bold  ctermfg=167 guifg=#d75f5f guibg=#1f1f1f
autocmd ColorScheme janah highlight SignifySignChange cterm=bold gui=bold  ctermfg=227 guifg=#ffff5f guibg=#1f1f1f
autocmd ColorScheme janah highlight ColorColumn ctermbg=154 ctermfg=0 guibg=#474747 guifg=#ffffff
autocmd ColorScheme janah highlight CursorLine ctermbg=154 guibg=#474747
autocmd ColorScheme janah highlight CursorLineNr ctermbg=NONE guibg=NONE guifg=#df005f ctermfg=161
autocmd ColorScheme janah highlight WildMenu guifg=#df005f ctermfg=161 guibg=NONE ctermbg=NONE gui=bold cterm=bold

" Colorscheme
set background=dark

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" autocmd ColorScheme janah highlight Normal ctermbg=235
" autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
" colorscheme base16
highlight Comment gui=italic
highlight Comment cterm=italic

"                           Keys Settings                            "
"                    ==============================                    "

let mapleader=";"

" Quick save an quit
nnoremap <silent><leader><leader> :w<cr>
nnoremap <silent><Leader>q :q<cr>
nnoremap <silent><Leader>w :w<cr>

" Better Split
set splitbelow
set splitright

" Split like a boss
nnoremap <silent><Leader>v :vsplit <cr>
nnoremap <silent><Leader>h :split <cr>

" Clear search highlight
nnoremap <silent><Leader>/ :nohls<CR>

" Quick switch tabs
nnoremap <silent><Leader>k :tabn<cr>
nnoremap <silent><Leader>j :tabp<cr>
nnoremap <silent><s-right> :tabm +1<cr>
nnoremap <silent><s-left> :tabm -1<cr>

"                                Code                                  "
"                    ==============================                    "

" Wrap only for md and txt files
augroup WrapLine
    autocmd!
    autocmd BufRead,BufNewFile *.txt setlocal wrap
    autocmd BufRead,BufNewFile *.md setlocal wrap
augroup end

" Spell checking
augroup custom_spellcheck
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell
  autocmd BufRead,BufNewFile *.org setlocal spell
  autocmd BufRead,BufNewFile *.txt setlocal spell
  autocmd FileType gitcommit setlocal spell
  autocmd FileType help setlocal nospell
augroup end

"                        Plugin Settings
"                        ==============================

" Quick switch tabs
nnoremap <silent><Leader>k :tabn<cr>
nnoremap <silent><Leader>j :tabp<cr>
nnoremap <silent><s-right> :tabm +1<cr>
nnoremap <silent><s-left> :tabm -1<cr>
nnoremap <silent><leader>t :tabnew<cr>

" Easier window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split like a boss
nnoremap <silent><Leader>v :vsplit \| :Startify<cr>
nnoremap <silent><Leader>h :split \| :Startify<cr>

" Quick fold and unfold
nnoremap <silent><Leader><esc> :normal!za<cr>

" Fzf fuzzy search
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
command! -bang History call fzf#vim#history({'options': ['--query', '!.git/ !.vim/ ', '--no-sort', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
\ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang Open call fzf#run({'source': 'rg --files --hidden --follow --glob "!.git/*"', 'sink': 'e', 'down': '40%', 'options': '--preview "cat {}"'})
nnoremap <silent><Enter> :FZF<cr>
nnoremap <silent> <leader><Enter> :History<cr>
command! -bang -nargs=* Find
      \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>),
      \ 1, <bang>0)
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Find<cr>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Identifier', 'Normal', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'WildMenu'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout = { 'down': '~40%' }  " Default fzf layout

" git gutter
let g:gitgutter_async=0

" Nerdtree
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=0
let NERDTreeHijackNetrw=0
let NERDTreeRespectWildIgnore=1
let NERDTreeStatusline = '         File Browser'
nnoremap <silent><Tab> :NERDTreeToggle %<cr>
augroup custom_nerdtree
  autocmd!
  autocmd FileType nerdtree nnoremap <silent><buffer> <Tab> :NERDTreeToggle %<cr>
augroup end
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : '!',
    \ 'Staged'    : '|',
    \ 'Untracked' : '-',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '/',
    \ 'Clean'     : '',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?'
    \ }

" Sneak
map s <Plug>Sneak_s
map S <Plug>Sneak_S
map m <Plug>Sneak_;
map n <Plug>Sneak_,
let g:sneak#label = 1

" Language server protocol
let g:LanguageClient_autoStart = 1
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'javascript.jsx': ['flow-language-server', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'go': ['go-langserver'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'zsh': ['bash-language-server', 'start'],
    \ 'dockerfile': ['docker-langserver', '--stdio']
    \ }


let g:LanguageClient_diagnosticsDisplay = {
      \1: {
        \'name': 'Error',
        \'texthl': 'ALEError',
        \'signText': '✖',
        \'signTexthl': 'ALEErrorSign',
        \'virtualTexthl': 'Special',
      \},
      \2: {
        \'name': 'Warning',
        \'texthl': 'ALEWarning',
        \'signText': '⚠',
        \'signTexthl': 'ALEWarningSign',
        \'virtualTexthl': 'Todo',
      \},
      \3: {
        \'name': 'Information',
        \'texthl': 'ALEInfo',
        \'signText': '∴',
        \'signTexthl': 'ALEInfoSign',
        \'virtualTexthl': 'Todo',
      \},
      \4: {
        \'name': 'Hint',
        \'texthl': 'ALEInfo',
        \'signText': '➤',
        \'signTexthl': 'ALEInfoSign',
        \'virtualTexthl': 'Todo',
      \},
      \}
nnoremap <silent><leader>l :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gx :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_auto_close_preview = 1

let g:SuperTabDefaultCompletionType = '<c-n>'
