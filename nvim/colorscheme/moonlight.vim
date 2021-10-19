set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="moonlight"


let Italic = ""
if exists('g:moonlight_italic')
  let Italic = "italic"
endif
let g:moonlight_italic = get(g:, 'moonlight_italic', 0)

let Bold = ""
if exists('g:moonlight_bold')
  let Bold = "bold"
endif

let g:moonlight_bold = get(g:, 'moonlight_bold', 0)
hi link ColorColumn CursorLine
hi Cursor guifg=#222436 ctermfg=235 guibg=#0e111b ctermbg=111 gui=NONE cterm=NONE
hi link CursorColumn CursorLine
hi CursorLine guibg=#111111 ctermbg=236 gui=NONE cterm=NONE
hi Directory guifg=#82aaff ctermfg=111 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#161a2a ctermfg=234 guibg=#c3e88d ctermbg=150 gui=NONE cterm=NONE
hi DiffChange guifg=#161a2a ctermfg=234 guibg=#82aaff ctermbg=111 gui=NONE cterm=NONE
hi DiffDelete guifg=#161a2a ctermfg=234 guibg=#ff757f ctermbg=210 gui=NONE cterm=NONE
hi DiffText guifg=#161a2a ctermfg=234 guibg=#ff757f ctermbg=210 gui=NONE cterm=NONE
hi ErrorMsg guifg=#ff757f ctermfg=210 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#161a2a ctermfg=234 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#7a88cf ctermfg=104 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#ffc777 ctermfg=222 guibg=#444a73 ctermbg=239 gui=NONE cterm=NONE
hi LineNr guifg=#444a73 ctermfg=239 guibg=NONE ctermbg=235 gui=NONE cterm=NONE
hi MatchParen guifg=#82aaff ctermfg=111 guibg=#2f334d ctermbg=236 gui=NONE cterm=NONE
hi NonText guifg=#828bb8 ctermfg=103 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Normal guifg=#c8d3f5 ctermfg=189 guibg=#NONE ctermbg=235 gui=NONE cterm=NONE
hi PMenu guibg=#222436 ctermbg=235 gui=NONE cterm=NONE
hi PMenuSel guibg=#2f334d ctermbg=236 gui=NONE cterm=NONE
hi PmenuSbar guibg=#191a2a ctermbg=234 gui=NONE cterm=NONE
hi PmenuThumb guifg=#828bb8 ctermfg=103 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Question guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Search guifg=#161a2a ctermfg=234 guibg=#ffc777 ctermbg=222 gui=NONE cterm=NONE
hi SpecialKey guifg=#222436 ctermfg=235 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#ff757f ctermfg=210 gui=underline cterm=underline
hi SpellLocal guifg=#ff995e ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link SpellCap SpellLocal
hi link SpellRare SpellRare
hi StatusLine guifg=#c8d3f5 ctermfg=189 guibg=#191a2a ctermbg=234 gui=NONE cterm=NONE
hi StatusLineNC guifg=#222436 ctermfg=235 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#7a88cf ctermfg=104 guibg=#191a2a ctermbg=234 gui=NONE cterm=NONE
hi TabLineFill guibg=#191a2a ctermbg=234 gui=NONE cterm=NONE
hi TabLineSel guifg=#c8d3f5 ctermfg=189 guibg=#191a2a ctermbg=234 gui=NONE cterm=NONE
hi Title guifg=#c3e88d ctermfg=150 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Visual guibg=#383e5c ctermbg=237 gui=NONE cterm=NONE
hi VisualNOS guibg=#383e5c ctermbg=237 gui=NONE cterm=NONE
hi WarningMsg guifg=#ffc777 ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#161a2a ctermfg=234 guibg=#82aaff ctermbg=111 gui=NONE cterm=NONE
hi Comment guifg=#7a88cf ctermfg=104 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Constant guifg=#ff757f ctermfg=210 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#c3e88d ctermfg=150 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#b4f9f8 ctermfg=159 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#ff995e ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#ff995e ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#ff995e ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#ff757f ctermfg=210 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#82aaff ctermfg=111 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Label guifg=#82aaff ctermfg=111 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#b4f9f8 ctermfg=159 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Exception guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Include guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#50c4fa ctermfg=81 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#c099ff ctermfg=141 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#ff995e ctermfg=209 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#50c4fa ctermfg=81 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#ffc777 ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#ffc777 ctermfg=222 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#b4f9f8 ctermfg=159 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#b4f9f8 ctermfg=159 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi link SpecialComment Comment
hi Error guifg=#ff757f ctermfg=210 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Todo guifg=#77e0c6 ctermfg=116 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

endif

if has('nvim')
endif
