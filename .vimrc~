" Environment
set nocompatible  " must be first line
set background=dark  " Assume a dark background
set expandtab

" ensure that the ~/.vim/bundle/ system works
runtime! autoload/pathogen.vim
silent! call pathogen#infect()
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()





" General
filetype plugin indent on  " Automatically detect file types.
syntax on  " syntax highlighting
set mouse=a  " automatically enable mouse usage
scriptencoding utf-8
set virtualedit=onemore " allow for cursor beyond last character
set history=1000  " Store a ton of history (default is 20)
set spell  " spell checking on

set backup  " backups are nice ...
set undofile  " so is persistent undo
set undolevels=1000  " Store a ton of history (default is 20)
set undoreload=10000  " spell checking on





" Vim UI
color solarized  " load a colorscheme
set tabpagemax=15  " only show 15 tabs
set showmode  " display the current mode

set cursorline  " highlight current line
hi cursorline guibg=#333333  " highlight bg color of current line
hi CursorColumn guibg=#333333  " highlight cursor

if has('cmdline_info')
  set ruler  " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " a ruler on steroids
  set showcmd  " show partial commands in status line and
  " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\    " Filename
  set statusline+=%w%h%m%r " Options
  set statusline+=%{fugitive#statusline()} "  Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start  " backspace for dummys
set linespace=0  " No extra spaces between rows
set nu  " Line numbers on
set showmatch  " show matching brackets/parenthesis
set incsearch  " find as you type search
set hlsearch  " highlight search terms
set winminheight=0  " windows can be 0 line high 
set ignorecase  " case insensitive search
set smartcase  " case sensitive when uc present
set wildmenu  " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]  " backspace and cursor keys wrap to
set scrolljump=5  " lines to scroll when cursor leaves screen
set scrolloff=3   " minimum lines to keep above and below cursor
set foldenable  " auto fold code
set gdefault  " the /g flag on :s substitutions by default
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.  " Highlight problematic whitespace






" Formatting
set nowrap  " wrap long lines
set autoindent  " indent at the same level of the previous line
set shiftwidth=2  " use indents of 4 spaces
set expandtab  " tabs are spaces, not tabs
set tabstop=2  " an indentation every four columns
set softtabstop=2  " let backspace delete indent
"set matchpairs+=<:>  " match, to be used with % 
set pastetoggle=<F12>  " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
