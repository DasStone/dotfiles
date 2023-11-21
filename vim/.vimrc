unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
"source /etc/vim/vimrc

set shell=/bin/bash

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
"UTF-8 Encoding
set encoding=UTF-8

" Turn syntax highlighting on.
syntax on
" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=3
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
" set default foldmethod to syntax. other cases handled by vimscript (below).
setlocal foldmethod=syntax "alternatively: foldmethod=marker


" If Uncommented:Set shift width to 4 spaces.
set shiftwidth=4
" If Uncommented:Set tab width to 4 columns.
set tabstop=4
" If Uncommented:Use space characters instead of tabs.
" set expandtab
" If Uncommented: Do not save backup files.
" set nobackup

" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" disable mouse mode
" set mouse-=a
" set encoding to utf-8
set encoding=utf-8

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
" set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"set timeoutlength for leaders such as \ to higher value
"defaults to 1 second, set to 3 seconds here
"mapped keys don't time out as much
"but also affects timeout of <ESC> and similar
"see :help ttimeout for more
set timeoutlen=3000

"print to pdf
nmap <leader>ppdf :hardcopy<Space>><Space>%.ps<Space><Bar><Space>!ps2pdf<Space>%.ps<Space>&&<Space>rm<Space>%.ps<Enter>
nmap <leader>pps :hardcopy<Space>><Space>%.ps<Enter>
"make
nmap <leader>m<Enter> :!make<Enter>
nmap <leader>mc<Enter> :!make<Space>check<Enter>
nmap <leader>mcl<Enter> :!make<Space>clean<Enter>
nmap <leader>mdb<Enter> :!make<Space>debug<Enter>



" PLUGINS ---------------------------------------------------------------- {{{

" Plugins are managed using VUNDLE
set nocompatible             "be iMproved, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Plugin code goes here.

" YCM Pluging for code completion in vim
"Plugin 'ycm-core/YouCompleteMe'
"Use global installation instead
set rtp+=/usr/share/vim-youcompleteme/
source /usr/share/vim-youcompleteme/autoload/youcompleteme.vim
source /usr/share/vim-youcompleteme/plugin/youcompleteme.vim
call youcompleteme#Enable()


" Include defaut config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" Enable YCM Plugin to collect completion information from tag files - not
" just visited files
let g:ycm_collect_identifiers_from_tags_files = 1
"enable semantic highlighting (experimental)
let g:ycm_enable_semantic_highlighting=1

"Fix Rust stuff for YouCompleteMe
if file_readable($HOME . "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer")
	let g:ycm_rust_toolchain_root = $HOME . "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/"
elseif file_readable($HOME . "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer")
	let g:ycm_rust_toolchain_root = $HOME . "/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/"
endif

"enable symbol search for document (\yfd) and workspace (\yfw)
nmap <leader>ysw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>ysd <Plug>(YCMFindSymbolInDocument)
"some ycm shortcuts
nmap <leader>yg<Enter> :YcmCompleter<Space>GoTo<Enter>
nmap <leader>ygo :YcmCompleter<Space>GoTo
nmap <leader>ygi :YcmCompleter<Space>GoToInclude<Enter>
"nmap <leader>ygin :YcmCompleter<Space>GoToInclude<Enter>
"nmap <leader>ygim :YcmCompleter<Space>GoToInclude<Enter>
nmap <leader>ygc :YcmCompleter<Space>GoToCallers<Enter>
"nmap <leader>ygcr :YcmCompleter<Space>GoToCallers<Enter>
"nmap <leader>ygce :YcmCompleter<Space>GoToCallees<Enter>
nmap <leader>ygd :YcmCompleter<Space>GoToDefinition<Enter>
"nmap <leader>ygdf :YcmCompleter<Space>GoToDefinition<Enter>
"nmap <leader>ygdc :YcmCompleter<Space>GoToDeclaration<Enter>
nmap <leader>yr :YcmCompleter<Space>RefactorRename<Space>
nmap <leader>ydoc :YcmCompleter<Space>GetDoc<Enter>
nmap <leader>yfi :YcmCompleter<Space>FixIt<Enter>
nmap <leader>yfo :YcmCompleter<Space>Format<Home>
vmap <leader>yfo :YcmCompleter<Space>Format<Enter>
nmap <leader>yc :YcmCompleter<Space>
vmap <leader>yc :YcmCompleter<Space>

nmap <leader>md :set mouse-=a<Enter>:set nonu<Enter>
vmap <leader>md :set mouse-=a<Enter>:set nonu<Enter>
nmap <leader>me :set mouse+=a<Enter>:set nu<Enter>
vmap <leader>me :set mouse+=a<Enter>:set nu<Enter>


"Autocompletion Plugin for brackets
Plugin 'Raimondi/delimitMate'

"Plugin NERDTree to visualize project hierarchy
Plugin 'preservim/nerdtree'
nmap <leader>nt :NERDTreeToggle<Enter>
vmap <leader>nt :NERDTreeToggle<Enter>
"NERDTree git status
Plugin 'Xuyuanp/nerdtree-git-plugin'
"NERDTree file type icon pack
"Plugin 'ryanoasis/vim-devicons'
"Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plugin to open/close/delete/move visually selected files
Plugin 'PhilRunninger/nerdtree-visual-selection'

"Plugin GitGutter to display git changes in file in vim
Plugin 'airblade/vim-gitgutter'
nmap <leader>gb :GitGutterBufferToggle<Enter>
vmap <leader>gb :GitGutterBufferToggle<Enter>
nmap <leader>gs :GitGutterSignsToggle<Enter>
vmap <leader>gs :GitGutterSignsToggle<Enter>
nmap <leader>gl :GitGutterLineHighlightsToggle<Enter>
vmap <leader>gl :GitGutterLineHighlightsToggle<Enter>

"Plugin to manage comments in vim
Plugin 'tpope/vim-commentary'

"Plugin for fzf in vim
"Plugin 'junegunn/fzf.vim'

"Git Commands for vim
Plugin 'tpope/vim-fugitive'

"ALE Lint Enginge for vim
"Plugin 'dmerejkowsky/vim-ale'

"Plugin surround.vim to wrap stuff in parantheses
Plugin 'tpope/vim-surround'
"Also add option to repeat with .
Plugin 'tpope/vim-repeat'

"Plugin Supertab for enhanced completion with tab...
"Plugin 'ervandew/supertab'

"UltiSnips Snippet engine (for code completion)
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Get snippets from https://github.com/honza/vim-snippets.
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<S-t>"
let g:UltiSnipsJumpForwardTrigger="<S-f>"
let g:UltiSnipsJumpBackwardTrigger="<S-b>"

"Complete Function Parameters
"Plugin 'tenfyzhong/CompleteParameter.vim'
"TODO: figure out how to combine with ycm and ultisnips


"Color Schemes
Plugin 'tomasiser/vim-code-dark'                                            
Plugin 'sjl/badwolf'
Plugin 'rafi/awesome-vim-colorschemes' 
"Plugin 'cocopon/iceberg.vim'  "is also contained in awesome-vim-colorschemes


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" Mappings code goes here.

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker "foldmethod=syntax "alternatively: foldmethod=marker
augroup END

" More Vimscripts code goes here.


"" autosave and autoload the last vim session:
"" It will only restore the session if you run vim without arguments,
"" so if you do vim somefile.txt to do the quick edit, it will not touch the last session.
"let s:session_loaded = 1
"
"augroup autosession
"  " load last session on start
"  " Note: without 'nested' filetypes are not restored.
"  autocmd VimEnter * nested call s:session_vim_enter()
"  autocmd VimLeavePre * call s:session_vim_leave()
"augroup END
"
"function! s:session_vim_enter()
"    if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
"        execute 'silent source ~/.vim/lastsession.vim'
"    else
"      let s:session_loaded = 0
"    endif
"endfunction
"
"function! s:session_vim_leave()
"  if s:session_loaded == 1
"    let sessionoptions = &sessionoptions
"    try
"        set sessionoptions-=options
"        set sessionoptions+=tabpages
"        execute 'mksession! ~/.vim/lastsession.vim'
"    finally
"        let &sessionoptions = sessionoptions
"    endtry
"  endif
"endfunction

" [disabled due to error on load]:
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event
" handler.
"autocmd MyAutoCmd BufReadPost *
"    \ if line("'\"") > 0 |
"    \   if line("'\"") <= line("$") |
"    \     exe("norm '\"") |
"    \   else |
"    \     exe "norm $" |
"    \   endif|
"    \ endif


" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}


"set typed letters to be shown at bottom. not onlyif ':' command. doesn't work above for some reason...
set showcmd

"set default color scheme - doesn't work above for some reason
"colorscheme gruvbox 
"colorscheme molokai
"colorscheme gruvbox
"colorscheme codedark
colorscheme iceberg
set termguicolors
colorscheme iceberg
 
