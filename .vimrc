syntax on
filetype plugin indent on
set encoding=utf-8

" highlight search
set hlsearch
" underline current line
set cursorline

" make backspace actually work
set backspace=indent,eol,start

" spaces are good for you
set tabstop=4 shiftwidth=4 expandtab

" no more temp files
set noswapfile

" fix split behavior
set splitbelow
set splitright

" markdown syntax
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" show number
set number

" no more auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" :W saves the file
command W w

function ShowSpaces(...)   
    let @/='\v(\s+$)|( +\ze\t)'    
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    end
    return oldhlsearch
endfunction

function TrimSpaces() range
    let oldhlserach=ShowSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

" highlight trailing whitespace
highlight RedundantSpaces ctermbg=green
match RedundantSpaces /\s\+$/

" show leading spaces (this could probably be cleaned up? pulled from reddit)
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey
autocmd BufWinEnter * setl conceallevel=2 concealcursor=nv
autocmd BufWinEnter * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
autocmd BufReadPre * setl conceallevel=2 concealcursor=nv
autocmd BufReadPre * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
