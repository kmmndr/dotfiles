" ---------------------------------------------------------------------------
"  Pathogen (must be set up before filetype detection)
" ---------------------------------------------------------------------------

" system's .vimrc calls filetype; turn it off here to force reload
filetype on " turn on to avoid non-zero exit code on OSX
filetype off

" ---------------------------------------------------------------------------
"  Vundle
" ---------------------------------------------------------------------------

if (1 == 1) || filereadable(expand("$HOME/.vim/bundle/Vundle.vim/README.md"))
  filetype off

  call plug#begin('~/.vim/plugged')

  " let Vundle manage Vundle, required!
  Plug 'VundleVim/Vundle.vim'

  " My Bundles here:
  "
  " git wrapper
  Plug 'tpope/vim-fugitive'
  " git diff
  Plug 'airblade/vim-gitgutter'
  "Add %{fugitive#statusline()} to 'statusline' to get an indicator with the current branch in (surprise!) your statusline.

  " create parent directories
  "Plug 'duggiefresh/vim-easydir'

  "Plug 'Lokaltog/vim-easymotion'
  "Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
  "Plug 'tpope/vim-session'
  Plug 'tpope/vim-bundler'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-markdown'
  " quick comment (gcc, gc)
  "Plug 'tpope/vim-commentary'
  " quick increment dates Ctrl+A/X
  Plug 'tpope/vim-speeddating'
  " autoclose () {} []
  "Plug 'Townk/vim-autoclose'
  " hangle taskjuggler files
  "Plug 'maxmeyer/vim-taskjuggler'
  " slim templating
  Plug 'slim-template/vim-slim'
  " coffee-script
  "Plug 'kchmck/vim-coffee-script'
  "Plug 'stefanoverna/vim-i18n'
  "Plug 'danchoi/ri.vim'

  " split code from/to multiline (gS/gJ)
  "Plug 'AndrewRadev/splitjoin.vim'
  " quick find using ag
  Plug 'vim-scripts/ag.vim'
  " less
  Plug 'groenewege/vim-less'
  " run syntax checker (rubocop)
  Plug 'scrooloose/syntastic'
  " quickly change ' " ( ...
  Plug 'tpope/vim-surround'
  " repeat more things
  Plug 'tpope/vim-repeat'
  " add 'end' automagically
  Plug 'tpope/vim-endwise'
  " :Remove, :Move, :Mkdir ... commands
  "Plug 'tpope/vim-eunuch'
  "" " change fct argument
  "" Plug 'vim-scripts/argtextobj.vim'
  "" " indentation
  "" Plug 'michaeljsmith/vim-indent-object'
  " vim modelines secured
  Plug 'ciaranm/securemodelines'
  " ctrlp for quickly opening files
  Plug 'kien/ctrlp.vim'
  " status bar
  Plug 'bling/vim-airline'
  " modern vim nocompatible
  Plug 'tpope/vim-sensible'
  " )q (q quick switch
  Plug 'tpope/vim-unimpaired'

  " gaip*, auto align
  Plug 'junegunn/vim-easy-align'

  "" " for[tab] ... autocomplete
  "" Plug "garbas/vim-snipmate"
  "" " snipMate dependencies
  "" Plug "MarcWeber/vim-addon-mw-utils"
  "" Plug "tomtom/tlib_vim"

  " better autocomplete
  Plug 'ervandew/supertab'

  " vim for golang
  Plug 'fatih/vim-go'

  " vim for fish shell
  Plug 'dag/vim-fish'

  "Plug 'scrooloose:nerdtree'
  "" " vim utilities
  "" Plug 'L9'
  " file explorer menu
  Plug 'The-NERD-tree'
  "Plug 'The-NERD-Commenter'

  " colorsheme
  Plug 'vim-scripts/bw.vim'
  Plug 'robertmeta/nofrils'
  Plug 'pbrisbin/vim-colors-off'
  Plug 'andreasvc/vim-256noir'
  Plug 'https://bitbucket.org/kisom/eink.vim.git'
  Plug 'jonathanfilip/vim-lucius'

  " Add plugins to &runtimepath
  call plug#end()
endif

" ---------------------------------------------------------------------------
"  General
" ---------------------------------------------------------------------------

set nocompatible           " we're running Vim, not Vi!
set modelines=0            " prevent security exploits
set tabpagemax=50          " open 50 tabs max
filetype plugin indent on  " load filetype plugin
set history=1000           " lots of command line history

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------

set nobackup               " do not keep backups after close
"set nowritebackup          " do not keep a backup while working
set noswapfile             " don't keep swp files either
"set backupdir=~/.vim/backup " store backups under ~/.vim/backup
"set backupcopy=yes         " keep attributes of original file
"set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
"set directory=~/.vim/swap,~/tmp,. " keep swp files under ~/.vim/swap

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------

set number                 " show line numbers
set ruler                  " show the cursor position all the time
set scrolloff=3            " start scrolling before cursor at end
set noshowcmd              " don't display incomplete commands
"set nolazyredraw           " turn off lazy redraw
set wildmenu               " turn on wild menu (better filename completion)
set wildmode=list:longest,full
set backspace=indent,eol,start
"set backspace=2         " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=atI          " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
set linebreak              " wrap long lines between words
set nowrap
set mouse=a                " enable full mouse support in the console
set complete=.,b,u,w,]     " completion search in current buffer (.), all
                           " loaded buffers (b), all unloaded buffers (u), tag
                           " files (]) and open windows (w)

" ----------------------------------------------------------------------------
"  Visual Cues
" ----------------------------------------------------------------------------

syntax on                  " enable syntax highlighting
let loaded_matchparen=1    " don't hightlight matching brackets/braces
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%c,%l]
set statusline=%f\ %m\ [%{&ff}]\ [%Y]\ [%{&fileencoding}]%=[%04l,\ %04v]\ [len=%04L]
set laststatus=2           " always show the status line
set hlsearch               " highlight all search terms
set incsearch              " highlight search text as entered
set ignorecase             " ignore case when searching
set smartcase              " case sensitive only if capitals in search term
"set colorcolumn=80        " not available until Vim 7.3
set novisualbell           " disable visual bell / blank screen

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------


set smartindent
set expandtab            " expand tabs to spaces
set softtabstop=2
set shiftwidth=2           " distance to shift lines with < and >
set ts=2                   " tab character display size
set fileformat=unix        " Use unix style line endings.
" set tw=80    tw to specify a default text width
set fo=tcrq   " fo to specify default formatoptions
      " t auto-wraps text using textwidth
      " c auto-wraps comments using textwidth
      " r auto-inserts the current comment leader
      " q allows formatting of comments
set colorcolumn=80

" ----------------------------------------------------------------------------
"  Autocommands
" ----------------------------------------------------------------------------

" chmod +x on the file if it starts with a shebang
function! ModeChange()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction
au BufWritePost * call ModeChange()

" Every spaces/tabs at the end of line will be highlighted.
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\s\+$', -1)

" Every spaces/tabs at the end of line will be REMOVED.
" autocmd BufWrite * silent! %s/[\r \t]\+$//

" ---------------------------------------------------------------------------
"  Variables
" ---------------------------------------------------------------------------

let mapleader = ";"
let maplocalleader = ","

let g:ackprg="ack-grep\\ -H\\ --nocolor\\ --nogroup\\ --column" " for Ack plugin

" NERDTree options
let g:NERDTreeWinSize=33
"let g:NERDTreeWinPos = "right"

" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------


" toggle NERDTree
map <F12> :NERDTreeToggle<CR>
map <Leader>m :NERDTreeToggle<CR>
map <Leader>M :NERDTreeFind<CR>

" next/previous tab
map <F11> :tabnext<CR>
map <F10> :tabprevious<CR>

" toggle highlight search
map <F9> :set hlsearch!<CR>

" toggle line numering
map <F8> :set number!<CR>

" Git diff
map <F7> :GitGutterToggle<CR>

" F6 for gui

" toggle line numering
map <F5> :set list!<CR>

" Rot13
"map <F4> ggVGg?
" toggle wrap for long lines
map <F4> :set wrap!<CR>

" Increase/decrease 'achordeon'
"map <F2> zr
"map <F3> zm
" Call Syntastic
map <F2> :SyntasticCheck<CR>
"map <F3> :SyntasticToggleMode<CR>
map <F3> :<C-u>call ToggleErrors()<CR>
"nnoremap <silent> <F3> :<C-u>call ToggleErrors()<CR>

map <F1> :b#<cr>

" ,; opens ~/.vimrc
map <Leader>v :tabnew ~/.vimrc<CR>

" ,: reloads .vimrc
map <Leader>V :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

" easy ack
nnoremap <Leader>a :Ag!

" delete into the black hole register
nnoremap <Leader>d "_d

vmap <Leader>z :call I18nTranslateString()<CR>

" save file quickly
nnoremap <Leader>w :w<CR>
" enter visual mode
"nmap <Leader><Leader> V
" quickly select text you just pasted
noremap gV `[v`]

" goto column 80
noremap <Leader>i 80\|
noremap <Leader>I 80\|B

nmap <q <Plug>unimpairedQPrevious
nmap >Q <Plug>unimpairedQNext
nmap <<Space> <Plug>unimpairedBlankUp
nmap ><Space> <Plug>unimpairedBlankDown

nmap ( [
nmap ) ]
omap ( [
omap ) ]
xmap ( [
xmap ) ]

" )q is :cnext
" (q is :cprevious
"
" )a is :next
"
" (b is :bprevious

" quick open new tab
map <Leader>t :tabnew<CR>
map <Leader>q :tabclose<CR>
" change tabs quickly
nmap <Leader><Right> :tabnext<CR>
nmap <Leader><Left> :tabprevious<CR>


" C-TAB and C-SHIFT-TAB cycle tabs forward and backward
nmap <C-tab> :tabnext<CR>
imap <C-tab> <C-o>:tabnext<CR>
vmap <C-tab> <C-o>:tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>
imap <C-S-tab> <C-o>:tabprevious<CR>
vmap <C-S-tab> <C-o>:tabprevious<CR>

" ------------------------------------------------------------------------------------------------


" ---------------------------------------------------------------------------
"  Buffers
" ---------------------------------------------------------------------------

function! DeleteHiddenBuffers()
  let tpbl=[]
  let closed = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers"
endfunction

" Remove hidden buffers
nmap <leader>B :call DeleteHiddenBuffers()<cr>
" quickly switch to last buffer
nmap <localleader><space> :b#<cr>
" quickly switch to tabs
nmap <localleader>n :tabnext<cr>
nmap <localleader>p :tabprevious<cr>

" Shared bindings from Solution #1 from earlier
"nmap <leader>T :enew<cr>
"nmap <leader>bq :bp <BAR> bd #<cr>

" ---------------------------------------------------------------------------
"  Syntastic
" ---------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_slim_checkers = ['slimrb']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1

function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

" ---------------------------------------------------------------------------
" CtrlP
" ---------------------------------------------------------------------------

let g:ctrlp_map = '<Leader>g'
let g:ctrlp_cmd = 'CtrlP'

map <Leader>b :CtrlPBuffer<CR>
map <Leader>p :CtrlP<CR>

" SuperTab options
let g:SuperTabDefaultCompletionType = "context"
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=10

" ---------------------------------------------------------------------------
" Easy Align
" ---------------------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ---------------------------------------------------------------------------
"  Split Navigation
" ---------------------------------------------------------------------------

" go left, right, up, down
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

nnoremap <C-W>z <C-W>\| <C-W>_

" ---------------------------------------------------------------------------
"  Spell Checking
" ---------------------------------------------------------------------------

" ;ss toggles spell checking
map <LocalLeader>ss :setlocal spell!<cr>

" spell checking shortcuts (next, prev, add, suggest)
map <LocalLeader>sn ]s
map <LocalLeader>sp [s
map <LocalLeader>sa zg
map <LocalLeader>s? z=

" ---------------------------------------------------------------------------
"  vim-go
" ---------------------------------------------------------------------------

let g:go_fmt_command = "goimports"
let g:go_metalinter_command = ""
let g:go_metalinter_enabled = ['vet', 'golint']
let g:go_metalinter_path = "./..."

" ---------------------------------------------------------------------------
"  Copy/Paste Shortcuts
" ---------------------------------------------------------------------------

" unnamed      <-- allow mouse to get vim register (*)
" unnamedplus  <-- allow CTRL+V to get vim register (+)
set clipboard^=unnamed,unnamedplus

" --------------------------------------------------------------------------
"  Highlight Trailing Whitespace
" --------------------------------------------------------------------------

" note that this inhibits the linebreak option so lines will wrap mid-word
set listchars=eol:¬,tab:→\ ,nbsp:•,trail:·,extends:>,precedes:<
set list
highlight SpecialKey ctermfg=DarkGray ctermbg=Black


" ----------------------------------------------------------------------------
"  Custom filetypes
" ----------------------------------------------------------------------------
" capistrano
au BufRead,BufNewFile *.cap  set filetype=ruby
au BufRead,BufNewFile *.opal set filetype=ruby

" ----------------------------------------------------------------------------
"  Graphical
" ----------------------------------------------------------------------------

set bg=dark
colorscheme torte

if has('gui_running')

  if system("uname") == "Darwin\n" " on OSX
    set guifont=Monaco:h12
    set lines=55
    set columns=94
  else                         " on Ubuntu
    set guifont=FreeMono\ 14
    "winpos 1100 0              " put window at right edge of left monitor
    "set lines=85
    "set columns=120
  endif

  " no ugly ballon
  set noballooneval
  set balloonexpr=

  "set guioptions=gemc          " show menu, tabs, console dialogs

  " --------------------------------------------------------------------------
  "  Tab Navigation
  " --------------------------------------------------------------------------

  set guitablabel=%N\ %t\ %M\ %r

  " menu toggler
  function! ToggleGUICruft()
    if &guioptions=='ai'
      exec('set guioptions=aegimrLtT')
    else
      exec('set guioptions=ai')
    endif
  endfunction
  " keyboard shortcut to toggle menu
  map <F6> <Esc>:call ToggleGUICruft()<cr>
  " by default, hide gui menus
  set guioptions=ai

  " stop cursor from blinking
  set guicursor+=a:blinkon0
endif
