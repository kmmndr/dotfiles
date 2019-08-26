" Try to load minpac.
packadd minpac

if !exists('*minpac#init')
  echo '***'
  echo 'Install minpac:'
  echo 'git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
  echo '***'
else
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('prabirshrestha/async.vim')

  " git wrapper
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('junegunn/gv.vim')
  " git diff
  call minpac#add('airblade/vim-gitgutter')

  "call minpac#add('tpope/vim-bundler')
  call minpac#add('vim-ruby/vim-ruby')
  call minpac#add('tpope/vim-rails')
  call minpac#add('tpope/vim-markdown')
  " quick increment dates Ctrl+A/X
  call minpac#add('tpope/vim-speeddating')
  " hangle taskjuggler files
  "call minpac#add('maxmeyer/vim-taskjuggler')
  " slim templating
  call minpac#add('slim-template/vim-slim')
  "call minpac#add('stefanoverna/vim-i18n')

  " quick find using ag
  call minpac#add('mileszs/ack.vim')
  " less
  call minpac#add('groenewege/vim-less')
  " run syntax checker (rubocop)
  call minpac#add('w0rp/ale')
  " quickly change ' " ( ...
  call minpac#add('tpope/vim-surround')
  " repeat more things
  call minpac#add('tpope/vim-repeat')
  " add 'end' automagically
  call minpac#add('tpope/vim-endwise')
  " vim modelines secured
  call minpac#add('ciaranm/securemodelines')
  " ctrlp for quickly opening files
  call minpac#add('kien/ctrlp.vim')
  " status bar
  call minpac#add('bling/vim-airline')
  " modern vim nocompatible
  call minpac#add('tpope/vim-sensible')
  " )q (q quick switch
  call minpac#add('tpope/vim-unimpaired')
  " gaip*, auto align
  call minpac#add('junegunn/vim-easy-align')
  " better autocomplete
  call minpac#add('ervandew/supertab')
  call minpac#add('mbbill/undotree')

  " vim for golang
  call minpac#add('fatih/vim-go')
  " call minpac#add('nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' })
  if has('nvim')
    call minpac#add('jodosha/vim-godebug', {'type': 'opt'})
  else
    " required for vim-delve
    call minpac#add('Shougo/vimshell')
  endif
  call minpac#add('sebdah/vim-delve')

  " vim for fish shell
  call minpac#add('dag/vim-fish')

  " file explorer menu
  call minpac#add('tpope/vim-vinegar')

  " TaskJuggler
  call minpac#add('kalafut/vim-taskjuggler')

  " visual colorscheme
  call minpac#add('vim-scripts/bw.vim')
  call minpac#add('robertmeta/nofrils')
  call minpac#add('pbrisbin/vim-colors-off')
  call minpac#add('andreasvc/vim-256noir')
  call minpac#add('https://bitbucket.org/kisom/eink.vim.git')
  call minpac#add('jonathanfilip/vim-lucius')
  call minpac#add('junegunn/seoul256.vim')
  call minpac#add('atelierbram/Base2Tone-vim')
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('junegunn/goyo.vim')

  " Define user commands for updating/cleaning the plugins.
  " Each of them loads minpac, reloads .vimrc to register the
  " information of plugins, then performs the task.
  command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
  command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
  command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

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

" Compare buffer against last saved version
"nmap <Leader>d :w !diff --color=always -u % - \| tail -n+5<CR>
nmap <Leader>d :w !diff -u % -<CR>

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
"  Terminal (neovim)
" ---------------------------------------------------------------------------

nmap <Leader><space> :belowright split <bar> terminal<CR>

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

" set Vim-specific sequences for RGB colors
if ! has('nvim')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
end

set bg=dark
set termguicolors
colorscheme solarized8

if has('gui_running')
   set guifont=FreeMono\ 14

   " no ugly ballon
   set noballooneval
   set balloonexpr=

   " stop cursor from blinking
   set guicursor+=a:blinkon0
endif
