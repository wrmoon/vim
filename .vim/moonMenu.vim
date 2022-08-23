" My menu enhancements
" Note that ":an" (short for ":anoremenu") is often used to make a menu work
" in all modes and avoid side effects from mappings defined by the user.

" Make sure the '<' and 'C' flags are not included in 'cpoptions', otherwise
" <CR> would not be recognized.  See ":help 'cpoptions'".
let s:cpo_save = &cpo
set cpo&vim

" Avoid installing the menus twice
if !exists("did_install_moon_menus")
let did_install_moon_menus = 1


" Edit/File Settings

" Boolean options
"an 20.440.180 &Edit.F&ile\ Settings.Toggle\ &C-indenting<Tab>:set\ cin!	:set cin! cin?<CR>
an 20.440.200 &Edit.F&ile\ Settings.Toggle\ Auto\ &Make-on-write<Tab>:xxxx!  :echo foo<CR>
endif " !exists("did_install_default_menus")

" Restore the previous value of 'cpoptions'.
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: set sw=2 :
