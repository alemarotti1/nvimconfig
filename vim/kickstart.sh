cp base .vimrc

printf "set runtimepath=${PWD}\n" >> .vimrc
printf "set packpath=${PWD}\n" >> .vimrc
printf "let g:_plug_path = \"${PWD}/plugged\"\n" >> .vimrc

