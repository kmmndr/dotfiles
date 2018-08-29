call plug#begin('~/.vim/plugged')

" git wrapper
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" git diff
Plug 'airblade/vim-gitgutter'

"Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
" quick increment dates Ctrl+A/X
Plug 'tpope/vim-speeddating'
" hangle taskjuggler files
"Plug 'maxmeyer/vim-taskjuggler'
" slim templating
Plug 'slim-template/vim-slim'
"Plug 'stefanoverna/vim-i18n'

" quick find using ag
Plug 'mileszs/ack.vim'
" less
Plug 'groenewege/vim-less'
" run syntax checker (rubocop)
Plug 'w0rp/ale'
" quickly change ' " ( ...
Plug 'tpope/vim-surround'
" repeat more things
Plug 'tpope/vim-repeat'
" add 'end' automagically
Plug 'tpope/vim-endwise'
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
" better autocomplete
Plug 'ervandew/supertab'
Plug 'mbbill/undotree'

" vim for golang
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
if has('nvim')
  Plug 'jodosha/vim-godebug'
else
  " required for vim-delve
  Plug 'Shougo/vimshell'
endif
Plug 'sebdah/vim-delve'

" vim for fish shell
Plug 'dag/vim-fish'

" file explorer menu
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'

" visual colorscheme
Plug 'vim-scripts/bw.vim'
Plug 'robertmeta/nofrils'
Plug 'pbrisbin/vim-colors-off'
Plug 'andreasvc/vim-256noir'
Plug 'https://bitbucket.org/kisom/eink.vim.git'
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/goyo.vim'

call plug#end()

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
" set complete=.,b,u,w,]     " completion search in current buffer (.), all
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

" Netrw
let g:netrw_banner = 1
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------

" toggle file explorer
map <Leader>m :Explore<CR>

" toggle highlight search
map <F9> :set hlsearch!<CR>

" toggle line numering
map <F8> :set number!<CR>

" F6 for zen mode
map <F6> :Goyo<CR>

" toggle line numering
map <F5> :set list!<CR>

" Rot13
"map <F4> ggVGg?
" toggle wrap for long lines
map <F4> :set wrap!<CR>

map <F2> :ALEFix<CR>

" ,; opens ~/.vimrc
map <Leader>v :tabnew ~/.vimrc<CR>

" ,: reloads .vimrc
map <Leader>V :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

" easy ack
nnoremap <Leader>a :Ack!

" delete into the black hole register
nnoremap <Leader>d "_d

vmap <Leader>z :call I18nTranslateString()<CR>

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
map <Leader>T :tabnew %<CR>
map <Leader>w :tabclose<CR>
" change tabs quickly
nmap <Leader><Right> :tabnext<CR>
nmap <Leader><Left> :tabprevious<CR>
nnoremap H gT
nnoremap L gt

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
nmap <Leader>q :bd<CR>
" quickly switch to last buffer
nmap <localleader><space> :b#<cr>
" quickly switch to tabs
nmap <localleader>n :tabnext<cr>
nmap <localleader>p :tabprevious<cr>

" ---------------------------------------------------------------------------
"  Neomake
" ---------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%*

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

let g:ale_fixers = {
\   'ruby': ['be-rubocop'],
\}

" ---------------------------------------------------------------------------
" ack / ag
" ---------------------------------------------------------------------------

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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
colorscheme solarized8
set termguicolors

if has('gui_running')
   set guifont=FreeMono\ 14

   " no ugly ballon
   set noballooneval
   set balloonexpr=

   " stop cursor from blinking
   set guicursor+=a:blinkon0
endif
