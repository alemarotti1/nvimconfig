if v:progname =~? "evim"
  finish
endif


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
"  if has('persistent_undo')
"    set undofile	" keep an undo file (undo changes after closing)
"  endif
endif


if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif


" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!


  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif



""""""""""""""""""""""""""""""""" PLUGINS """""""""""""""""""""""""""""""""""
" call plug#begin()
" 
" " List your plugins here
" Plug 'tpope/vim-sensible'
" 
" " Fuzzy finder - 
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" 
" call plug#end()

"comentado pois estamos usando o packer com nvim



""""""""""""""""""""""""""""Configurações alê """"""""""""""""""""""""""""""
set ts=2
set sts=2
set shiftwidth=2
set noexpandtab


syntax on
set relativenumber "Adiciona numero de linhas relativas no lado esquerdo
set cursorline "Adiciona marcação da linha atual
set mouse=a "Adiciona a possibilidade de clicar onde você quer editar
set nocompatible "Ativa o modo de não-compatibilidade - no geral não é necessário
let mapleader = ' ' 

vnoremap  <leader>y  "+y
vnoremap  <leader>p  "+p


set noundofile " Evita a criação de um arquivo de undo que persiste após fechar
"Caso você queira utilizar o arquivo de undo, mas não poluir o diretório atual
"Você pode usa os seguintes comandos:
"set undodir=~/.vim/undo-dir
"set undofile

set nobackup " Impede a criação de um arquivo permanente de backup
set writebackup " Permite a criação de um arquivo temporário de backup

"faz com que a seta de "baixo" e "cima" vá para baixo/cima e centralize a tela
nmap <Down> gjzz 
nmap <Up> gkzz 

" cria remapings para "q" ser equivalente a "aspas"
nnoremap viq vi" 
nnoremap vaq va"

nnoremap <leader><C-e> :Explore<CR>
nnoremap <leader>9y "9y
nnoremap <leader>9p "9p

"Criação de mapping que façam a inserção de abas de fechamento junto à tag de abertura
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ` ``<Left>
inoremap < < ><Left>
inoremap ' ''<Left>



"adição de guias de indentação
set list
set listchars+=tab:┊\ 
