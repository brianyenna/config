:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Bunch of color schemes
Plug 'https://github.com/neoclide/coc.nvim' " Auto Completion
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'nvim-lua/plenary.nvim' " For fuzzyfinding
Plug 'nvim-telescope/telescope.nvim' " For fuzzyfinding
Plug 'nvim-telescope/telescope-fzy-native.nvim' " For speeding up fuzzyfinding
Plug 'morhetz/gruvbox' " Gruvbox color scheme
Plug 'glepnir/dashboard-nvim' " Dashboard/Landing Page for nvim
Plug 'chentoast/marks.nvim' " Vim marks
Plug 'luochen1990/rainbow' " Colorize brackets
Plug 'jiangmiao/auto-pairs' " Auto-pairing of brackets
Plug 'vimwiki/vimwiki' " Vimwiki

call plug#end()

" ******************************** General Settings ******************************** 
" Set colorscheme
set encoding=UTF-8
:colorscheme gruvbox

" Turn on Syntax Highlighting
syntax on

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬

" Add a ruler at 80 and 120th column
set colorcolumn=80,120
highlight ColorColumn ctermbg=DarkGrey guibg=lightgrey

" ******************************** Plugin Settings *********************************
" ------------
" For NERDTree
" ------------
nnoremap <Leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files

" -------------
" For Telescope
" -------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>

" -------
" For CoC
" -------
" General settings
set cmdheight=2
" Jumping to references/definitions 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Tab auto-completion
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" Diagnostics
nnoremap <silent><nowait> <leader><space> :<C-u>CocList diagnostics<cr>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Selecting code blocks
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)

" ------------------
" For dashboard-nvim
" ------------------
let g:dashboard_default_executive ='telescope'

" ----------
" For tagbar
" ----------
nmap <leader>a :TagbarToggle/f<CR>

" -----------
" For rainbow
" -----------
let g:rainbow_active=1

" -------
" VimWiki
" -------
set nocompatible
filetype plugin on
nnoremap <leader>m :VimwikiToggleListItem<CR>
let g:vimwiki_folding='list'

" -----------------
" General Shortcuts
" -----------------
" Access `init.vim` in new tab
nmap <leader>v :tabedit ~/.config/nvim/init.vim<CR>
" Highlight current cursor position
:hi CursorLine   cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
:hi CursorColumn cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" ******************************** Plugin Settings (via Lua) ************************
autocmd VimEnter * call s:setup_lualine()
function! s:setup_lualine() abort
lua<<EOF

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
}

EOF
endfunction

" -----------------------
" Potential Color Schemes
" -----------------------
" For `OceanicNext` colorscheme
" if (has("termguicolors"))
"  set termguicolors
" endif
" syntax enable
" :colorscheme OceanicNext
" let g:airline_theme='oceanicnext'

" For `afterglow` colorscheme
" let g:afterglow_italic_comments=1
" :colorscheme afterglow

" " For `jellybeans` colorscheme
" let g:jellybeans_overrides = {
" \    'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
" \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
" \              'attr': 'bold' },
" \}
" :colorscheme jellybeans
