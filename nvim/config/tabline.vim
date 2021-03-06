hi TablineFiletype          cterm=none   gui=none   ctermbg=none ctermfg=5 guibg=none    guifg=#00ffff
hi TablineFiletypeIcon      cterm=none   gui=none   ctermbg=5    ctermfg=0 guibg=#00ffff guifg=#272c38
hi TablineFiletypeBody      cterm=none   gui=none   ctermbg=8    ctermfg=5 guibg=#272c38 guifg=#00ffff
hi TablineFiletypeSeparator cterm=none   gui=none   ctermbg=none ctermfg=8 guibg=none    guifg=#272c38

function! FiletypeIcon()
    return winwidth(0) > 10 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' : ' ') : ''
endfunction

function! SetTabline()
	let tabline = ""
	let tabline .= "%#TablineFiletype#"
    let tabline .= "%#TablineFiletypeIcon#%{FiletypeIcon()}"
    let tabline .= "%#TablineFiletypeBody# %f%m"
    let tabline .= "%#TablineFiletypeSeparator#\ "
	return tabline
endfunction

setlocal tabline=%!SetTabline()
