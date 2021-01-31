" To use this as your .vimrc, simply rename it to .vimrc and move it to your
" home directory.
"
" Check what's already there first, though!


" changes cursor based on insert vs. normal modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" resets cursor on start:
" augroup myCmds
  " au!
  " autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

augroup syntax_highlighting
  autocmd!
  autocmd BufEnter *.html :syntax sync fromstart
  autocmd BufEnter *.js :syntax sync fromstart
augroup END

augroup autosave
  autocmd!
  autocmd TextChanged,TextChangedI <buffer> silent write
augroup END

" adds vim-plug if it's not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins for vim-plug to install.
"The above block will have installed vim-plug, and the below block will tell vim-plug which plugins to install.
"
" The following plugins are helpful for visually parsing JS and HTML, so uncomment their 'Plug' lines if web development is your THING.

" Add whatever plugins you like, but I recommend ONLY installing plugins that VISUALLY change vim, not change the
" behavior. The point is to learn the behavior!
call plug#begin()
  " better syntax coloration for javascript
  " Plug 'jelera/vim-javascript-syntax'
  " rainbow parentheses/bracket matching
  " Plug 'luochen1990/rainbow'
  " provides coloration of color codes/names within css rules
  " Plug 'ap/vim-css-color'
call plug#end()

" sets the rainbow plugin to on by default--set to 0 if you want to enable it
" later via :RainbowToggle.
" Either way, comment it back in if you install rainbow, and delete it if you
" don't want it.
" Don't leave commented-out code lying around!
" let g:rainbow_active = 1

" The below block sets the rainbow plugin NOT to color html tags by depth.
" I find the effect very visually confusing.
" If you want to see what that looks like--and maybe you'll like how it
" handles tags!--comment it back in when you install the rainbow plugin.
" And if you're not using the rainbow plugin at all, delete the block entirely.
" 
" This is as good a time as any to remind you to both label any additions you
" make--so you know three weeks later what the line you added does!--and remove commented-out code that you decided you don't want.
" let g:rainbow_conf = {
" \  'separately': {
" \    'html': 0
" \  }
" \}


set number
set relativenumber

set hlsearch

" Sets vim not to highlight matching pair in a way that can be visually
" confusing, making the user lose track of the cursor. There's certainly an
" argument to be made that we should get used to that, but... there are other
" ways to find matching parens when you need to, even without a plugin.
let g:loaded_matchparen = 1

set background=dark
set termguicolors

set expandtab
set shiftwidth=2
set softtabstop=2

set splitright
set splitbelow

" My current favorite colorscheme for being bright and bold while playing nice
" with html/css/js out of the box.
" Feel free to install it and uncomment it!
" colorscheme elflord

syntax on
filetype plugin on

""" mappings
" Makes "ii" in insert mode bring you backto normal mode.
" Useful for those who haven't mapped their escape key to be easier to reach.
" Some people prefer "jk" instead. Whatever works for you!
inoremap ii <Esc>
" Switches 0 and ^. They're both useful, but people prefer ^ usually, and
" it's harder to reach than 0, so it can be useful to switch them.
nnoremap 0 ^
nnoremap ^ 0

" In the same way, most people use : more often than ;, so might as well
" save yourself the shift keystroke.
nnoremap : ;
nnoremap ; :
