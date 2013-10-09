" ---------------------------------------------------------------------------
"  Pathogen (must be set up before filetype detection)
" ---------------------------------------------------------------------------

" system's .vimrc calls filetype; turn it off here to force reload
filetype on " turn on to avoid non-zero exit code on OSX
filetype off

" ---------------------------------------------------------------------------
"  Vundle
" ---------------------------------------------------------------------------

if filereadable(expand("$HOME/.vim/bundle/vundle/README.md"))
  filetype off

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  " required!
  Bundle 'gmarik/vundle'

  " My Bundles here:
  "
  " original repos on github
  " vim + git
  Bundle 'tpope/vim-fugitive'
  "Add %{fugitive#statusline()} to 'statusline' to get an indicator with the current branch in (surprise!) your statusline.

  "Bundle 'Lokaltog/vim-easymotion'
  "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  "Bundle 'tpope/vim-session'
  Bundle 'tpope/vim-rails'
  Bundle 'tpope/vim-markdown'
  Bundle 'Townk/vim-autoclose'
  Bundle 'astashov/vim-ruby-debugger'
  Bundle 'maxmeyer/vim-taskjuggler'

  Bundle "garbas/vim-snipmate"
  " snipMate dependencies
  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle "honza/snipmate-snippets"

  "Bundle 'scrooloose:nerdtree'
  " vim-scripts repos
  Bundle 'L9'
  Bundle 'FuzzyFinder'
  Bundle 'The-NERD-tree'
  Bundle 'The-NERD-Commenter'
  " non github repos
  "Bundle 'git://git.wincent.com/command-t.git'
  " ...

  filetype plugin indent on     " required!

  "
  " Brief help
  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  "
  " see :h vundle for more details or wiki for FAQ
  " NOTE: comments after Bundle command are not allowed..
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
set visualbell             " shut the fuck up

" ----------------------------------------------------------------------------
"  Text Formatting
" ----------------------------------------------------------------------------

set autoindent
set expandtab              " expand tabs to spaces
set softtabstop=2
set shiftwidth=2           " distance to shift lines with < and >
set ts=4                   " tab character display size
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

" next/previous tab
map <F11> :tabnext<CR>
map <F10> :tabprevious<CR>

" toggle highlight search
map <F9> :set hlsearch!<CR>

" toggle line numering
map <F8> :set number!<CR>

" toggle paste mode
map <F7> :set paste!<CR>

" F6 for gui

" toggle line numering
map <F5> :set list!<CR>

" Rot13
map <F4> ggVGg?

" Increase/decrease 'achordeon'
map <F2> zr
map <F3> zm

" Ctrl-x to close current buffer
map <C-x> :q<CR>

" ,; opens ~/.vimrc
map ,; :tabe ~/.vimrc<CR><C-W>_
map ;v <esc>:tabnew ~/.vimrc<CR>

" ,: reloads .vimrc
map <silent> ,: :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map ;V <esc>:set guioptions-=L<CR>:so ~/.vimrc<CR>

" easy ack
nnoremap <LocalLeader>a :Ack

" change directory to that of current file
cmap cdc cd %:p:h

" ---------------------------------------------------------------------------
"  Ruby Mappings
" ---------------------------------------------------------------------------

" syntax check Ruby script
map <LocalLeader>cr :!ruby -c %<cr>

" syntax check Bash script
map <LocalLeader>cb :!bash -n %<cr>

" insert Ruby hash pointer (" => ")
imap <S-A-l> <Space>=><Space>

" insert code block with arguments
imap {<Tab> { \|\|  }<Esc>3hi

" ---------------------------------------------------------------------------
"  Split Navigation
" ---------------------------------------------------------------------------

" go left, right, up, down
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l

" ---------------------------------------------------------------------------
"  Spell Checking
" ---------------------------------------------------------------------------

" ,ss toggles spell checking
map <LocalLeader>ss :setlocal spell!<cr>

" spell checking shortcuts (next, prev, add, suggest)
map <LocalLeader>sn ]s
map <LocalLeader>sp [s
map <LocalLeader>sa zg
map <LocalLeader>s? z=

" ---------------------------------------------------------------------------
"  Handling Whitespace
" ---------------------------------------------------------------------------

"  strip trailing whitespace
map <LocalLeader>ks :%s/\s\+$//g<CR>

"  convert tabs to spaces
map <LocalLeader>kt :%s/\t/  /g<CR>

"  kill DOS line breaks
map <LocalLeader>kd :%s///g<CR>

" ---------------------------------------------------------------------------
"  Handling Comments
" ---------------------------------------------------------------------------

:map ;k :s/^/\/\/--??-- /<CR>
:map ;K :s/^[ ]*\/\/--??-- //<CR>
:map ;l :s/^[ ]*\/\/--??-- [^\r]*//g<CR>
:map ;L :g/^[ ]*\/\/--??-- [^\r]*/s///g<CR>
:map ;m <esc>bi/*<esc>ea*/<esc>

" ---------------------------------------------------------------------------
"  Copy/Paste Shortcuts
" ---------------------------------------------------------------------------

" copy to system clipboard
vmap <C-c> "+y

" paste in NORMAL mode from system clipboard (at or after cursor)
nmap <LocalLeader>V "+gP
nmap <LocalLeader>v "+gp

" paste in INSERT mode from Vim's clipboard (unnamed register)
imap vp <ESC>pa

" paste in INSERT mode from system clipboard
imap vv <ESC>"+gpa

" paste in COMMAND mode from Vim's clipboard (unnamed register)
cmap vp <C-r>"

" paste in COMMAND mode from system clipboard
cmap vv <C-r>+

" --------------------------------------------------------------------------
"  Highlight Trailing Whitespace
" --------------------------------------------------------------------------

" note that this inhibits the linebreak option so lines will wrap mid-word
set listchars=nbsp:_,tab:>-,extends:>,precedes:<
set list
highlight SpecialKey ctermfg=DarkGray ctermbg=Black



" ----------------------------------------------------------------------------
"  Graphical
" ----------------------------------------------------------------------------

if has('gui_running')

  if system("uname") == "Darwin\n" " on OSX
    set guifont=Monaco:h12
    set lines=55
    set columns=94
  else                         " on Ubuntu
    set guifont=Monospace\ 9
    winpos 1100 0              " put window at right edge of left monitor
    set lines=85
    set columns=120
  endif

  colorscheme torte
  "set guioptions=gemc          " show menu, tabs, console dialogs


  " --------------------------------------------------------------------------
  "  Tab Navigation
  " --------------------------------------------------------------------------

  set guitablabel=%N\ %t\ %M\ %r

  " quick open new tab
  map <LocalLeader>t :tabnew<CR>

  " C-TAB and C-SHIFT-TAB cycle tabs forward and backward
  nmap <C-tab> :tabnext<CR>
  imap <C-tab> <C-o>:tabnext<CR>
  vmap <C-tab> <C-o>:tabnext<CR>
  nmap <C-S-tab> :tabprevious<CR>
  imap <C-S-tab> <C-o>:tabprevious<CR>
  vmap <C-S-tab> <C-o>:tabprevious<CR>

  " jump directly to tab
  let i=1
  while i<=9
    execute "map <LocalLeader>".i." ".i."gt<CR>"
    let i+=1
  endwhile

  " menu toggler
  function! ToggleGUICruft()
    if &guioptions=='i'
      exec('set guioptions=aegimrLtT')
    else
      exec('set guioptions=i')
    endif
  endfunction
  " keyboard shortcut to toggle menu
  map <F6> <Esc>:call ToggleGUICruft()<cr>
  " by default, hide gui menus
  "set guioptions=i

else
  set bg=dark
endif
