""""""""""""""""""""""""""""""""""""""""
"
"             pathogen
"
""""""""""""""""""""""""""""""""""""""""
call pathogen#infect() 

""""""""""""""""""""""""""""""""""""""""
"
"             ack
"
""""""""""""""""""""""""""""""""""""""""
map ,k :Ack <cword><ENTER>

set isk+=-
""""""""""""""""""""""""""""""""""""""""
"
"             fuzzfinder
"
""""""""""""""""""""""""""""""""""""""""
map ,,  :FufCoverageFile!<cr>
" exclude is very dangerous, cause once you exclude sth, you can not add it in
" FufAddPath(), 
" for example if I exclude "tmp" here, I can not add anything with "tmp" as
" its path, like "hello.tmp/", "/home/peter/tmp/**/*"
" better to use g:fuf_coveragefile_globPatterns
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|db/migrate)'
let g:fuf_enumeratingLimit = 500
let g:fuf_coveragefile_prompt = '=>'

function! FufAddPath(newpath)
  call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', g:fuf_coveragefile_globPatterns + [a:newpath]])
endfunction
" e.g :call FufAddPath('/home/peter/xxx/ideas/**/*')
  

""""""""""""""""""""""""""""""""""""""""
"
"             for macbook
"
""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ia xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"      Cope
"      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
" can be used with vimgrep or anything in quickfix
map ,cc :botright cope<cr>
map ,cn :cn<cr>
map ,cp :cp<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""
" need ,pp to toggle paste 
" or set it to `nocindent`
imap ,pp :setlocal paste!<cr>

""""""""""""""""""""""""""""""
"
"         Vim grep
"
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = '.git CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          Spell checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map ,ss :setlocal spell!<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
" for i_Ctrl-X_Ctrl-O
filetype plugin on

""""""""""""""""""""""""""""""""""""""""
"
"             indent
"
""""""""""""""""""""""""""""""""""""""""
filetype indent on
set cindent

""""""""""""""""""""""""""""""""""""""""
"
"             note-taking
"
""""""""""""""""""""""""""""""""""""""""
" with Vim helptags and git, store things 
" $VIMRUNTIME/doc
" NOTE: NO ":" in the following line, stange but works
autocmd FileType help set ma 
autocmd FileType help set noreadonly
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc


""""""""""""""""""""""""""""""""""""""""
"
"             brower
"
""""""""""""""""""""""""""""""""""""""""
" NOW Browser() only works for lines containing nothing but the link
" refer to http://vim.wikia.com/wiki/VimTip306 
function! Browser ()
  let line = getline (".")
"  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "!firefox ".line
endfunction
map ,w :call Browser ()<CR>





""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""
set hidden "in order to switch between buffers with unsaved change 
map <s-tab> :bp<cr>
map <tab> :bn<cr>
map ,bd :bd<cr>
""""""""""""""""""""""""""""""""""""""""
"
"             formatting 
"
""""""""""""""""""""""""""""""""""""""""
" this is for C comments, see *fo-table* to know what althese options mean
set fo=croq
""""""""""""""""""""""""""""""""""""""""
"
"             general
"
""""""""""""""""""""""""""""""""""""""""
" why I use *,* to do mapping?
" inspired by Derek, the reasons:
" 1. <LEADER> is too long to type
" 2. *,* is easier to reach than *\*
" 3. in practice you nerver type in *,v*, but *, v*
" Derek also do a nomap for *,*
"   nnomap <c-e> ,
" I do not do it, since I do not use *,* as a command a lot

""""""""""""""""""""""""""""""""""""""""
"
"             taglist
"
""""""""""""""""""""""""""""""""""""""""
map ,t :Tlist<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             Doxygen
"
""""""""""""""""""""""""""""""""""""""""
" highlight the doxygen comments
" used with DoxygenToolkit.vim
let g:load_doxygen_syntax=1

""""""""""""""""""""""""""""""""""""""""
"
"             NERDtree
"
""""""""""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             quit quickly
"
""""""""""""""""""""""""""""""""""""""""
" before I use <S-ZZ> to quit, this has the danger of unexpectedly
" save some garbage editing, so I have a safer way now as below
"map ,, :q<CR>
" force quit
map ,f :q!<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             vimrc editing 
"
""""""""""""""""""""""""""""""""""""""""
" I need a fake ~/.vimrc: runtime vimrc
" http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
map ,e :e ~/.vim/vimrc<CR>
" When vimrc is edited, reload it
" copied from http://amix.dk/vim/vimrc.html
autocmd! bufwritepost vimrc source ~/.vim/vimrc


""""""""""""""""""""""""""""""""""""""""
"
"            quick escape  
"
""""""""""""""""""""""""""""""""""""""""
" set quick escape from insert mode, and now I can go without arrow keys and
" use j and k to move around in insert mode
imap jj <esc>

""""""""""""""""""""""""""""""""""""""""
"
"             wildmode
"
""""""""""""""""""""""""""""""""""""""""
" use <C-D> with this to get a list
set wildmenu

""""""""""""""""""""""""""""""""""""""""
"
"             tabbing 
"
""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""""""""""""""""""
"
"             dictionary
"
""""""""""""""""""""""""""""""""""""""
" i_CTRL_X_K 
set dictionary+=~/.vim/dict/simple
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
""""""""""""""""""""""""""""""""""""""""
"
"             Search
"
""""""""""""""""""""""""""""""""""""""""
" ic also has effect on dictionary settings
set ic 
"set hlsearch
set incsearch

""""""""""""""""""""""""""""""""""""""""
"
"             status line
"
""""""""""""""""""""""""""""""""""""""""
" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
" this means I can also see what is the filename I am in, finally!
set laststatus=2

""""""""""""""""""""""""""""""""""""""""
"
"             misc
"
""""""""""""""""""""""""""""""""""""""""
" have nice $ sign when you use `cw`
set cpoptions+=$

" Do not know how to use autocmd yet, so the following line not working
" autocmd FileType text setlocal textwidth=78
set textwidth=78

" input abrevation 
iab frm from 
" set number for doing diffs and folding
" set nu
" Show the current command in the lower right corner
set showcmd
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
" set scrolloff=8

" Allow the cursor to go in to "invalid" places
" set virtualedit=all

" get rid of the silly characters in window separators
set fillchars=""

" Highlight all instances of the current word under the cursor
" nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>
" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>
""""""""""""""""""""""""""""""""""""""""
"
"             test stuff
"
""""""""""""""""""""""""""""""""""""""""
nnoremap <c-e> ,
vnoremap <c-e> ,

""""""""""""""""""""""""""""""""""""""""
"
"             html
"
""""""""""""""""""""""""""""""""""""""""
" this makes my force quit `,f` very slow
"nnoremap ,ft Vatzf
" use aesthetic middle of screen for "zz"

""""""""""""""""""""""""""""""""""""""""
"
"             zencoding
"
""""""""""""""""""""""""""""""""""""""""
  let g:user_zen_settings = {
  \  'lang' : 'ja',
  \  'html' : {
  \    'filters' : 'html',
  \    'indentation' : ' '
  \  },
  \  'perl' : {
  \    'indentation' : '  ',
  \    'aliases' : {
  \      'req' : "require '|'"
  \    },
  \    'snippets' : {
  \      'use' : "use strict\nuse warnings\n\n",
  \      'w' : "warn \"${cursor}\";",
  \    },
  \  },
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'html,c',
  \  },
  \  'css' : {
  \    'filters' : 'fc',
  \  },
  \  'javascript' : {
  \    'snippets' : {
  \      'jq' : "$(function() {\n\t${cursor}${child}\n});",
  \      'jq:each' : "$.each(arr, function(index, item)\n\t${child}\n});",
  \      'fn' : "(function() {\n\t${cursor}\n})();",
  \      'tm' : "setTimeout(function() {\n\t${cursor}\n}, 100);",
  \    },
  \  },
  \ 'java' : {
  \  'indentation' : '    ',
  \  'snippets' : {
  \   'main': "public static void main(String[] args) {\n\t|\n}",
  \   'println': "System.out.println(\"|\");",
  \   'class': "public class | {\n}\n",
  \  },
  \ },
  \}

