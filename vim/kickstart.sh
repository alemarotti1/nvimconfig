cp base .vimrc

printf "set runtimepath=${PWD}\n" >> .vimrc
printf "set packpath=${PWD}\n" >> .vimrc
printf "let g:_plug_path = \"${PWD}/plugged\"\n" >> .vimrc


printf "\ncall plug#begin(g:_plug_path)\n Plug 'tpope/vim-sensible'\n Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }\n Plug 'junegunn/fzf.vim'\n Plug 'AmberLehmann/candyland.nvim'\n call plug#end()" >> .vimrc
