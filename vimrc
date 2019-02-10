set nocompatible              " Disabled vi compatibility
filetype off                  " We will turn this back on later

" -----------------------------------------------------------------
"
" Vundle section
"
" -----------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" == Plugins ==

" -- Plugin Management --
Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle, required

" -- General Utility --
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" -- Linters / Formatters --
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'w0rp/ale'

" -- Code Completion --
"Plugin 'davidhalter/jedi-vim'
Plugin 'valloric/youcompleteme'

" -- Language Syntax Highlighters --
" Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'nathanaelkane/vim-indent-guides'

" -- Color Schemes --
Plugin 'altercation/vim-colors-solarized'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'gertjanreynaert/cobalt2-vim-theme'
" Plugin 'liuchengxu/space-vim-dark'
" Plugin 'gosukiwi/vim-atom-dark'
" Plugin 'owickstrom/vim-colors-paramount'
" Plugin 'tomasr/molokai'

" -- Editing Utilities --
Plugin 'tmhedberg/SimpylFold'
Plugin 'raimondi/delimitmate'  " insert mode auto-complete for quotes, parens, brackets
Plugin 'vimoutliner/vimoutliner'
Plugin 'tpope/vim-surround'

" -- Previewers --
Plugin 'JamshedVesuna/vim-markdown-preview'

" -- Snipetts --
Plugin 'sirver/ultisnips'

" -- DVCS Interface --
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-lawrencium'

" -- Tag Management --
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'

" Load this plugin last,
" due to integration with other plugins
Plugin 'ryanoasis/vim-devicons'


" All of your Plugins must be added before the following line
call vundle#end()            " required

" -----------------------------------------------------------------
" End Vundle section
" -----------------------------------------------------------------


" -----------------------------------------------------------------
"
" General options
"
" -----------------------------------------------------------------

" Hate bells
set visualbell

" Love history
set history=1000

" Hightlight search matches
set hlsearch

" Search ahead while typing
set incsearch
set showmatch

" Show line numbers
set number

" Default editing settings
set encoding=utf8
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set autoindent
set smartindent
set smarttab
set foldmethod=indent
set foldlevel=99
set backspace=indent,eol,start
set fileformat=unix
set matchpairs+=<:>

" Format option
set formatoptions+=1    " don't wrap on a single letter
set formatoptions+=l    " don't autowrap if line is already longer than textwidth

" Delete comment character when using 'J' command to join lines
if v:version > 703 || v:version == 703 && has("patch541")
   set formatoptions+=j
endif

" Force window splits to the right and below
set splitbelow
set splitright

" On MacOS, use the system clipboard
set clipboard=unnamed

" Colors
set guifont=Monaco\ for\ Powerline\ Nerd\ Font\ Complete:h14
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set t_Co=256
    set background=dark
    colorscheme solarized
endif


" Ignore these file types
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o

" Don't mark URL-like things as spelling errors
syn match UrlNoSpell '\w\+:\/\/[^[:space:\[]]]\+' contains=@NoSpell

" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
 syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
" -----------------------------------------------------------------
"  End general options
" -----------------------------------------------------------------


" -----------------------------------------------------------------
"
" Plugin options
"
" -----------------------------------------------------------------

" Work around for vim-airline not working
" without window splits
set laststatus=2

" vim-airline theme
let g:airline_inactive_collapse = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
" let g:airline_theme='cobalt2'
" let g:airline_theme='simple'
" let g:airline_theme='powerlineish'

" ale linter
let g:airline#extensions#ale#enabled = 1

" Tell pymode rope to be less search intensive
let g:pymode_rope_lookup_project=0

" On second thought,
" just disable rope and it's silliness
let g:pymode_rope=0

" Automatically close NERDTree on file open
" let NERDTreeQuitOnOpen=1
" Show hidden files by default
let NERDTreeShowHidden=1
" Instruct NERDTree to respect Vim's wildignore setting
let NERDTreeRespectWildIgnore=1

" Tell SimplyFold to leave docstrings visible for folded code
let g:SimpylFold_docstring_preview=1

" Configure key mappings for UltiSnips
" let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsJumpForwardTrigger='<c-b>'
" let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" Recommended beginner settings for Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Tell Syntastic to use shellcheck for sh file
"let g:syntastic_sh_checkers = ['shellcheck']

" -- vim-ansible syntax highlighter --
let g:ansible_unindent_after_newline = 1    " auto reset indent after blank line
let g:ansible_name_highlight = 'b'          " highlight play names
let g:ansible_extra_keywords_highlight = 1  " highlight extra keywords beyong default

" -- jedi-vim options --
let g:jedi#auto_initialization = 1
" -----------------------------------------------------------------
"  End plugin options
" -----------------------------------------------------------------


" -----------------------------------------------------------------
"
" Key mappings
"
" -----------------------------------------------------------------

" For now, I'm leaving the leader as the default \

" Null map Q (enter ex mode)
nnoremap Q <nop>

" Unhighlight found items
nmap  <silent> <Leader>/ :nohlsearch<CR>

" Edit the active vimrc
nmap <silent> <Leader>ev :e $MYVIMRC<CR>

" Reload the active vimrc
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Select all text in current buffer
map <Leader>a ggVG

" Toggle NERDTree on and off
map <Leader>nt :NERDTreeToggle<CR>

" Toggle Tagbar
map <Leader>tb :TagbarToggle<CR>

" Toggle gundo
" (not using gundo currently)
" nnoremap <Leader>gu :GundoToggle<CR>

" Enable folding with the spacebar
nnoremap <space> za

" Shortcut window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" -----------------------------------------------------------------
"
" Auto commands
"
" -----------------------------------------------------------------

if has("autocmd")

    filetype on
    filetype plugin on
    filetype plugin indent on
    let python_highlight_all=1
    syntax on

    " Auto commands by file type
    "

    augroup filetype_autocmds
        autocmd!


        " ---------------------------------------------------------
        " Shell
        " ---------------------------------------------------------

        " Highlight characters past column 80
        autocmd Filetype shell highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd Filetype shell match Excess /\%80v.*/

        " Don't let lines auto wrap
        autocmd Filetype shell set fo-=t
        autocmd Filetype shell set nowrap

        " Translate the word retrun into return
        autocmd Filetype shell abbr retrun return

        " Set folding method based on syntax instead of indent
        autocmd Filetype shell setlocal foldmethod=syntax
        autocmd Filetype shell setlocal foldlevel=5

        " ---------------------------------------------------------
        " Python
        " ---------------------------------------------------------

        " Python source needs to be UTF-8
        autocmd Filetype python set encoding=utf-8

        " Highlight characters past column 80
        autocmd Filetype python highlight Excess ctermbg=DarkGrey guibg=Black
        autocmd Filetype python match Excess /\%80v.*/

        " Don't let lines auto wrap
        autocmd Filetype python set fo-=t
        autocmd Filetype python set nowrap

        " Translate the word retrun into return
        autocmd Filetype python abbr retrun return

        autocmd BufEnter *.patch,*.diff syntax enable
        " ---------------------------------------------------------
        
        " ---------------------------------------------------------
        " Text formats
        " ---------------------------------------------------------

        " Turn on spell check for documentation formats
        autocmd Filetype markdown setlocal spell
        autocmd Filetype asciidoc setlocal spell

        " Add custom spell files for documentation
        autocmd Filetype asciidoc setlocal spellfile+=~/.vim/spell/asciidoc.utf-8.add
        autocmd Filetype asciidoc setlocal spellfile+=~/.vim/spell/devwords.utf-8.add
        autocmd Filetype asciidoc setlocal spellfile+=~/.vim/spell/gers.utf-8.add

        " Set text width (wrap point)
        autocmd Filetype text set fo+=t
        autocmd Filetype markdown set fo+=t
        autocmd Filetype asciidoc set fo+=t

        " Map particular file name extensions to file types
        autocmd BufNewFile,BufReadPost *.md,*.mkd,*.mdown,*.markdown set filetype=markdown
        autocmd BufNewFile,BufReadPost *.adoc,*asciidoc set filetype=asciidoc

        " Set compiler (for make command) for asciidoc files
        autocmd Filetype asciidoc set makeprg=/usr/local/bin/asciidoctor\ %

        " ---------------------------------------------------------

    augroup END


    " NERDTree auto commands
    "

    augroup nerdtree_group
        autocmd!

        " Open NERDTree automatically if vim started with no file
        autocmd vimenter * if !argc() | NERDTree | endif
    augroup END


    " Auto reload vimrc when it changes
    "

    augroup reload_vimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END


endif
