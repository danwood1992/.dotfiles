" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Show cursor position in the status line
set ruler

" Enable auto-saving and backup files
set autowrite
set backup
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undo

" Highlight search results as you type
set incsearch
set hlsearch

" Enable spell checking (English by default)
set spell
set spelllang=en_us

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Set your preferred text editor for Git
if exists('$GIT_EDITOR')
  let $GIT_EDITOR = 'vim'
endif
