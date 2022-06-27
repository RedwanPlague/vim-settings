call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

" Plug 'crusoexia/vim-monokai'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'tpope/vim-fugitive'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'yggdroot/indentline'
Plug 'vim-scripts/matchit.zip'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'chrisbra/csv.vim'

" Plug 'vim-python/python-syntax'
" Plug 'sheerun/vim-polyglot'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'luochen1990/rainbow', { 'on': 'RainbowToggle' }

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'mattn/emmet-vim'
" Plug 'othree/html5.vim'
" Plug 'vim-scripts/bash-support.vim'
" Plug 'storyn26383/vim-vue'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' " this must be last plugin in the list
call plug#end()

" vim-plug above automatically calls the lines below, no need to call again
" filetype plugin indent on
" syntax enable

set termguicolors

" BEGIN gruvbox
autocmd vimenter * colorscheme gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_italicize_comments = 0
let g:gruvbox_contrast_dark = 'hard'

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
" END

" BEGIN monokai
" colorscheme monokai
" let g:monokai_term_italic = 1
" END

" let g:python_highlight_all = 1

" BEGIN airline
autocmd vimenter * AirlineTheme gruvbox
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = '' " default is 'ln', didn't need it

let g:airline#extensions#tabline#enabled = 1
" END

" BEGIN indentline
let g:indentLine_char = '┊'
" END

" BEGIN coc
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" always show signcolumn
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
nmap <leader>fa :call CocAction('format')<CR>

" Add ':Prettier' command to format current buffer using Prettier.
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" END

" BEGIN
" let g:user_emmet_install_global = 0
" autocmd FileType html,vue EmmetInstall
" END

let g:python3_host_prog = "/usr/bin/python3"

" BEGIN NERDTree

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" END NERDTree

map Y y$
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
" nnoremap <silent> <F10> :silent !gnome-terminal -- /bin/bash -c "make; exec bash"<CR>
" nnoremap <silent> <F10> :silent !gnome-terminal -- /bin/bash -c "make; echo; read -rsn1 -p 'Press any key to continue'"<CR>
nnoremap <silent> <F9> :w<CR>:silent !gnome-terminal -- /bin/bash -c "~/.config/nvim/debug.sh %"<CR>
nnoremap <silent> <F10> :w<CR>:silent !gnome-terminal -- /bin/bash -c "~/.config/nvim/run.sh %; echo; read -rs -p 'Press Enter to continue'"<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

noremap <silent> <C-Left> :vertical resize -1<CR>
noremap <silent> <C-Right> :vertical resize +1<CR>
noremap <silent> <C-Up> :resize +1<CR>
noremap <silent> <C-Down> :resize +1<CR>

" nnoremap <silent> <C-N> :noh<CR>
nnoremap <silent> <C-N> :call gruvbox#hls_toggle()<CR>
tmap <ESC> <C-\><C-N>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" command Vt vs term:///bin/bash
" command St sp term:///bin/bash

nnoremap <F3> :CSVTabularize<CR> <C-W>o
nnoremap Z :bd!<CR>

set exrc
set secure
set nu rnu
set hls is
" noh " to stop it from highlighting previous search at every 'so %'
set wildmenu
" set showcmd
set noshowmode
set nowrap
set hidden
set pumheight=15 " completion menu height to only 15 items
" set mouse=a

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set cindent
" autocmd BufRead,BufNewFile *.htm,*.html,*.css,*.js,*.json setlocal tabstop=2 shiftwidth=2
" autocmd Filetype htm,html let g:AutoPairs['<']='>'
" autocmd Filetype htm,html,vue let g:AutoPairs['{{']='}}'
" autocmd Filetype htm,html let g:AutoPairs['{%']='%}'
