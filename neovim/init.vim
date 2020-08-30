" Copyright 2020 Vincent ROGER

" Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ''Software'''), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

" The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

" THE SOFTWARE IS PROVIDED ''AS IS''', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

call plug#begin('~/.local/share/nvim/plugged')

" fast auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" python help
Plug 'zchee/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'
" pylint
Plug 'neomake/neomake'
" double quote, parenthesis ...
Plug 'jiangmiao/auto-pairs'
" Ctrl+n for tree
Plug 'scrooloose/nerdTree'
" improved bar at bottom
Plug 'bling/vim-airline'

" snippets and auto completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" latex
Plug 'lervag/vimtex'

" Language tool integration
" Plug 'vigoux/LanguageTool.nvim'

call plug#end()

" To be compatible with anaconda for python3
let g:python3_host_prog = 'python'

" Auto completion
" disable auto completion, because we use deoplete for completion
" let g:jedi#completions_enabled = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
" Bind Ctrl-Space to force autocomplete
inoremap <expr> <C-Space>  deoplete#manual_complete()
" doc of deoplete is shown bollow instead of top
set splitbelow

" use tab to forward cycle among windows
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle among windows
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


nmap <C-n> :NERDTreeToggle<CR>

" pylint checking
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)
" line number ro the left
set number
" remove trailing whitespace on saving
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e
autocmd BufWritePre *.tex :%s/\s\+$//e
autocmd BufWritePre *.sh :%s/\s\+$//e

" swithing windows with Tab
map <Tab> <C-W>w
map <S-Tab> <C-W>p

" Snippet config: Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Make vimtex use deoplete
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

let g:vimtex_complete_enabled = 1
" configure latex compilation, mainly add shell-escape to be able to use svg
" files as graphics
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
\}

let g:tex_flavor = 'latex'

" spell languages
set spelllang=en
nnoremap <silent> <C-s> :set spell!<cr>
inoremap <silent> <C-s> <C-O>:set spell!<cr>

" grammar checking (I replaced it with antidote)
" autocmd Filetype markdown LanguageToolSetUp
" autocmd Filetype tex LanguageToolSetUp
" let g:languagetool_server_jar='/usr/local/LanguageTool/languagetool-server.jar'
" nnoremap <silent> <C-g> :LanguageToolCheck<cr>

" copy to clipboard when using Ctrl+c
vmap <C-c> "+y<cr>
" select all document
nmap <C-a> ggVG

set mouse=a

" Replace tab with spaces when pressing Tab key; press Ctlr+V+Tab for a real tabulation
:set expandtab
:set tabstop=4
:set shiftwidth=4

" Turn off backups
set nobackup
set noswapfile
set nowritebackup

" search configuration
set smartcase

