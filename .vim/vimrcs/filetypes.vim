""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <C-t> $log();<esc>hi
au FileType javascript imap <C-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


""""""""""""""""""""""""""""""
" => Twig section
""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html


""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""""""
" => Rmarkdown
""""""""""""""""""""""""""""""
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>


""""""""""""""""""""""""""""""
" => LaTeX
""""""""""""""""""""""""""""""
"autocmd Filetype tex map <F5> :!latexmk %<cr>
"autocmd Filetype tex map <F6> :LLPStartPreview<cr>
"let g:livepreview_engine = 'platex'
autocmd Filetype tex :VimtexCompile
autocmd Filetype tex map <F5> :w<space>\|VimtexCompile<cr>

" append '$' to surround
if !exists('g:AutoPairs')
  autocmd FileType tex let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`", "$":"$"}
end

" add snippets to UltiSnips from vim-snippets/tes.snippets
autocmd Filetype tex :UltiSnipsAddFiletypes tex


""""""""""""""""""""""""""""""
" => OCaml
""""""""""""""""""""""""""""""
autocmd Filetype ocaml map <F5> :w<space>\|!ocaml<space><<space><c-r>%<cr>
" exclude "'"
autocmd FileType ocaml let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"}
" comment out
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)


""""""""""""""""""""""""""""""
" => make
""""""""""""""""""""""""""""""
" exclude "$"
autocmd FileType make let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '```':'```', '"""':'"""', "'''":"'''", "`":"`"}

""""""""""""""""""""""""""""""
" => C
""""""""""""""""""""""""""""""
autocmd FileType c setlocal commentstring=//%s
autocmd BufWritePost c call system("ctags -R")
