"===================================================================
" Basic settings
"===================================================================
"vim extended mode
set nocompatible
"enable line numbers
set number
"enable mouse compatibity
set mouse=a
"no beep or flash for errors
set noerrorbells
"command history length
set history=1000
"autoindent
set autoindent
"number of spaces for autoindentation
set shiftwidth=4
"number of spaces for tab
set tabstop=4
"make backspace work normally
set backspace=indent,eol,start
"max tab number
set tabpagemax=15
set guifont=Terminus\ 10
"statusline
set laststatus=2
"statusline: filepath, filetype, mod, rw, help, preview,   
set statusline=%f\ %y\ %m%r%h%w
"statusline: separation between lef and right aligned items
set statusline+=%=
"statusline: lines number, column number, percent
set statusline+=[L:\ %l/%L]\ [C:\ %v]\ [%p%%]
"set all but toolbar
set guioptions=aegimrLt 
"nice colortheme
"colorscheme oceanblack
"enable filetype detection
filetype on
"enable syntax highlight
syntax on

"===================================================================
" Autocommands
"===================================================================
"filetype list extension
autocmd BufRead *.as set filetype=actionscript
autocmd BufRead *.hx set filetype=actionscript
autocmd BufRead *.mxml set filetype=actionscript
autocmd BufRead *.rb set filetype=ruby

"===================================================================
" Mappings 
"===================================================================
"save
map <C-s> :wa<CR>
imap <C-s> <ESC>:wa<CR>li

"open new tab
map <A-o> :browse tabnew<CR>
imap <A-o> <ESC>:browse tabnew<CR>i

"close
map <C-q> :q<CR>
imap <C-q> <ESC>:q<CR>

"tab navigation 
map  <C-Tab> :tabnext <CR>
imap <C-Tab> <ESC> :tabnext <CR>

map  <C-S-Tab> :tabprevious <CR>
imap <C-S-Tab> <ESC> :tabprevious <CR>

"better ESC
map <C-l> <ESC>
imap <C-l> <ESC>
"===================================================================
" Abbreviations
"===================================================================
"xml
ab xmlver <?xml version="1.0" encoding="utf-8"?>
ab xmlnsp xmlns:mx="http://www.adobe.com/2006/mxml"
ab xmlcmt <!-- --><ESC>3hi
ab cdata  <![CDATA[ ]]><ESC>3hi
"ruby
ab rubsub <%= %><ESC>2hi
ab rubins <% %><ESC>2hi
ab rubli  <%= link_to "", :action => "" %><ESC>3F"
"php
ab phpins <?php ?><ESC>2hi
ab clspan <span style="clear:both; display:block"><!--  --></span>
"bash
ab shabang #!/bin/bash
