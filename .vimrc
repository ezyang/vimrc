" This just turns on per-filetype plugins.  Vim ships with file
" indentation/plugin/syntax rules for highlighting. The highlighting
" is nice. Sometimes the indentation is a bit annoying though because
" it REINDENTS my stupid code when I didn't want it to.  It's annoying
" to track down why it's doing that...
filetype indent on
filetype on
filetype plugin on
" This MUST be before highlight comment, see
" https://github.com/Valloric/YouCompleteMe/issues/2664
syntax on
" ...I hade a reason for this one. Maybe.
highlight SpecialKey guifg=#bbbbbb
" This might be useful if you are in dark mode
"highlight comment ctermfg=lightblue
" So, if you see <leader>, this is the key that you press to get it. I
" honestly never use this...
let mapleader="\\"
" Ditto here, but it's for a local leader.  I also never use this.
let localmapleader=","
" I like pressing space to tab down
nnoremap <silent> <space> <C-f>
set autoindent              " When I type return, I want the same tabbing
set background=light
set backspace=indent,eol,start " Delete past current line
set clipboard=unnamed       " This makes vim's clipboard coincide with the system clipboard.  I like it but some people might find it annoying. FUTURE: Should make use of vim's registers
set directory=~/.vim-tmp    " Where to put swap files.
set backupdir=~/.vim-tmp    " Where... to put backup files? I don't know what makes this different from a swapfile.
set expandtab               " When you press tab, get spaces. If you're a no-tabs shop, gotta have this on.
set encoding=utf-8          " Uhh... someone gave me these two and I put them in
set fenc=utf-8              " but whatever.  UTF-8 is basically what you want.
set formatoptions-=t " autowrap
set formatoptions+=q " gq
set formatoptions+=r " insert comment leader after <ENTER>
set formatoptions+=o " insert comment leader after 'o'/'O'
set formatoptions+=c " autowrap comments
set formatoptions+=b " autowrap only if inserted blank
set history=1000            " If you type colon and then press arrow up, you can get a previous command (actually you can type any prefix and see matching prefixes). Useful.
set hlsearch                " Highlight search results as you search. SUPER USEFUL. To clear the highlighting search for a random string.
set incsearch               " Automatically search as you are typing query. SUPER USEFUL.
set modeline                " Uhhh... not actually that useful. Makes vim interpret modelines. No one uses modelines lol.
set laststatus=2            " I like always having statusline, makes split windows visually clearer.
set list                            " This setting is great and the next are great
set listchars=tab:>-,trail:·        " I can see trailing space and tabs explicitly. Helps kill tabs and trailing space.
set ruler                   " Tells me where I'm on, on bottom right. Mostly useful for telling if you've gone to far width-wise
" set scrolloff=3           " Not good for quickfix
set shortmess=atI           " This helps sometimes. I guess.
set showcmd                 " Uhhhh... I don't think I actually use this.
set ignorecase              " I think this is redundant with the next, actually.
set smartcase               " Search is case-insensitive unless you have a capital letter. USEFUL.
set smarttab                " I'll be honest, I have no idea what this does
set shiftwidth=2            " This and the next control how many spaces are
set softtabstop=2           " a tab.  Can never remember which is which.
" This is the status line you see at the bottom.  Maybe not all of it is
" useful but whatever.
set statusline=%F%m%r%h%w\ [%{&ff},\ %{&fenc}]\ [ln:%l\ col:%v]
"\ %{SyntasticStatuslineFlag()} <-- hate this flag, don't put it in menu
set title                   " Set console title so window shows some useful info
set textwidth=72            " Wrap at 72 cols. Maybe. (This is affected by formatoptions and your syntax file. Ugh.  Check out http://blog.ezyang.com/2010/03/vim-textwidth/)
set whichwrap+=<,>,h,l      " If I type h at end of line, go to next line
set wildmenu                " Show me possible matches
set wildmode=list:longest   " This makes completion more like Bash, default is annoying
set visualbell              " Don't beep, do a visual bell...
set t_vb=""                 " BUT disable it (so net effect: no bell)
set undofile                " Save your undos even if you close your editor
set undodir=~/.vim-undo     " Hate having random undo files, so centralize them
set undolevels=1000         " Maximum number of changes that can be undone

" If your file is bigger than this number of lines, than if you do a
" full-buffer operation like :e!, Vim won't let you undo past this.
set undoreload=10000


set tags=tags;
map ]t :tn<CR>
map [t :tp<CR>

map m :w<CR>:silent make<CR>:redraw!<CR>

execute pathogen#infect()

let g:ycm_extra_conf_globlist = ['~/Dev/autograd/*', '~/Dev/pytorch/*', '~/Dev/cpp-ast/*']
