Plug 'arcticicestudio/nord-vim'

augroup WhichKeySetup
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme nord
    set termguicolors
augroup END

