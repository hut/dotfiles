" Jungle Vim Color Scheme
" Maintainer:	Blabla
" Last Change:  27.12.08
" URL:		fofoofo

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="jungle"

"{{{ 256 Color Terminal
if &t_Co == 256
	hi Pmenu		ctermfg=253 ctermbg=234 cterm=none
	hi PmenuSel		ctermfg=40 ctermbg=234 cterm=none
	hi Cursor		ctermfg=black ctermbg=white
	hi CursorLine	ctermbg=none cterm=bold
	"hi Directory	
	hi DiffAdd		ctermfg=2 ctermbg=none cterm=none
	hi DiffDelete	ctermfg=0 ctermbg=none cterm=none
	hi DiffChange	ctermfg=3 ctermbg=none cterm=none
	hi DiffText		ctermfg=1 ctermbg=none cterm=none

	hi ErrorMsg		ctermfg=red ctermbg=none cterm=bold
	hi VertSplit	ctermfg=202 ctermbg=none cterm=none
"	hi Folded		ctermfg=82 ctermbg=none
	hi Folded		ctermfg=12 ctermbg=none
	"hi FoldColumn	
	hi LineNr		ctermfg=241 ctermbg=none
	hi SignColumn	ctermfg=241 ctermbg=none
	hi ModeMsg		ctermfg=white ctermbg=none cterm=none
	"hi MoreMsg		
	hi NonText		ctermfg=10 ctermbg=none cterm=none
	"hi Question	
	"hi IncSearch	cterm=bold,underline
	hi IncSearch	ctermfg=black ctermbg=49 cterm=none
	hi Search		ctermfg=black ctermbg=49 cterm=none
	hi SpecialKey	ctermfg=234 cterm=none
"	hi StatusLine	ctermfg=white ctermbg=81 cterm=none
"	hi StatusLineNC	ctermfg=white ctermbg=80 cterm=none
"	hi StatusLine	ctermfg=40  ctermbg=none cterm=none
"	hi StatusLineNC	ctermfg=112 ctermbg=none cterm=none
	hi StatusLine	ctermfg=232 ctermbg=202 cterm=underline
	hi StatusLineNC	ctermfg=202 ctermbg=none cterm=underline
	hi Visual		ctermfg=black ctermbg=10 cterm=none
	hi Ignore		ctermfg=234 cterm=bold

	hi Comment		ctermfg=243 cterm=none
	hi Constant		ctermfg=215 cterm=none
"	hi Constant		ctermfg=191 cterm=none
	hi Error		ctermfg=1 ctermbg=none
	hi Todo			ctermfg=green ctermbg=none cterm=bold
	hi String		ctermfg=210
	hi Number		ctermfg=222
	hi Float		ctermfg=222
	hi Boolean		ctermfg=194

	hi Identifier	ctermfg=167 cterm=none
	hi Function		ctermfg=9
"	hi Statement	ctermfg=10 cterm=bold
"	hi Statement	ctermfg=4 cterm=bold
"	hi Statement	ctermfg=6 cterm=bold
	hi Statement	ctermfg=10 cterm=none
"	hi Type			ctermfg=57 cterm=none
"	hi Type			ctermfg=10 cterm=none
	hi Type			ctermfg=114 cterm=none
	hi PreProc		ctermfg=red
	hi Include		ctermfg=32
	hi PreCondit	ctermfg=32
"	hi StorageClass	ctermfg=grey cterm=bold
	hi StorageClass	ctermfg=10 cterm=none
	hi Special		ctermfg=210 cterm=none

"	hi TabLine		ctermfg=white ctermbg=80 cterm=none
"	hi TabLineFill	ctermfg=80 cterm=reverse
"	hi TabLineSel	ctermfg=white ctermbg=81 cterm=none 
	hi TabLine		ctermfg=248 ctermbg=none cterm=underline
	hi TabLineFill	ctermfg=248 cterm=underline
"	hi TabLineFill	ctermfg=234 cterm=underline
	hi TabLineSel	ctermfg=232 ctermbg=202 cterm=none

	hi MatchParen	ctermfg=2 ctermbg=none

"	hi OverLength	ctermbg=80
"	match OverLength /\%81v.*/

	hi SpellBad    cterm=none ctermfg=137 ctermbg=none
"	hi SpellBad    cterm=none ctermfg=196 ctermbg=none
	hi SpellCap    cterm=none ctermfg=26 ctermbg=none
	hi SpellRare   cterm=none ctermfg=148 ctermbg=none
	hi SpellLocal  cterm=none ctermfg=148 ctermbg=none

end
"}}}

"{{{ 88 Color Terminal
if &t_Co == 88
	hi Pmenu		ctermbg=86 ctermbg=0 cterm=none
	hi PmenuSel		ctermbg=86 ctermbg=0 cterm=bold
	hi Cursor		ctermfg=black ctermbg=white
	hi CursorLine	ctermbg=none cterm=bold
	"hi Directory	
	hi DiffAdd		ctermfg=2 ctermbg=none cterm=none
	hi DiffDelete	ctermfg=0 ctermbg=none cterm=none
	hi DiffChange	ctermfg=3 ctermbg=none cterm=none
	hi DiffText		ctermfg=1 ctermbg=none cterm=none

	hi ErrorMsg		ctermfg=red ctermbg=none cterm=bold
	hi VertSplit	ctermfg=80 ctermbg=none cterm=none
"	hi Folded		ctermfg=82 ctermbg=none
	hi Folded		ctermfg=12 ctermbg=none
	"hi FoldColumn	
	hi LineNr		ctermfg=82 ctermbg=none
	hi ModeMsg		ctermfg=white ctermbg=none cterm=none
	"hi MoreMsg		
	hi NonText		ctermfg=10 ctermbg=none cterm=none
	"hi Question	
	"hi IncSearch	cterm=bold,underline
	hi IncSearch	ctermfg=black ctermbg=49 cterm=none
	hi Search		ctermfg=black ctermbg=49 cterm=none
	hi SpecialKey	ctermfg=80 cterm=none
"	hi StatusLine	ctermfg=white ctermbg=81 cterm=none
"	hi StatusLineNC	ctermfg=white ctermbg=80 cterm=none
	hi StatusLine	ctermfg=83 ctermbg=none cterm=none
	hi StatusLineNC	ctermfg=83 ctermbg=none cterm=none
	hi Visual		ctermfg=black ctermbg=10 cterm=none
	hi Ignore		ctermfg=80 cterm=bold

	hi Comment		ctermfg=82 cterm=none
	hi Constant		ctermfg=57 cterm=none
	hi Error		ctermfg=1 ctermbg=none
	hi Todo			ctermfg=green ctermbg=none cterm=underline
	hi String		ctermfg=53
	hi Number		ctermfg=73
	hi Float		ctermfg=73
	hi Boolean		ctermfg=37

	hi Identifier	ctermfg=53 cterm=none
	hi Function		ctermfg=9
"	hi Statement	ctermfg=10 cterm=bold
"	hi Statement	ctermfg=4 cterm=bold
"	hi Statement	ctermfg=6 cterm=bold
	hi Statement	ctermfg=10 cterm=none
"	hi Type			ctermfg=57 cterm=none
"	hi Type			ctermfg=10 cterm=none
	hi Type			ctermfg=41 cterm=none
	hi PreProc		ctermfg=red
	hi Include		ctermfg=22
	hi PreCondit	ctermfg=22
"	hi StorageClass	ctermfg=grey cterm=bold
	hi StorageClass	ctermfg=10 cterm=none
	hi Special		ctermfg=41 cterm=none

"	hi TabLine		ctermfg=white ctermbg=80 cterm=none
"	hi TabLineFill	ctermfg=80 cterm=reverse
"	hi TabLineSel	ctermfg=white ctermbg=81 cterm=none 
	hi TabLine		ctermfg=83 ctermbg=none cterm=none
	hi TabLineFill	ctermfg=80 cterm=underline
	hi TabLineSel	ctermfg=57 ctermbg=none cterm=none

	hi MatchParen	ctermfg=2 ctermbg=none

"	hi OverLength	ctermbg=80
"	match OverLength /\%81v.*/

	hi SpellBad    cterm=none ctermfg=38 ctermbg=none
	hi SpellCap    cterm=none ctermfg=40 ctermbg=none
	hi SpellRare   cterm=none ctermfg=36 ctermbg=none
	hi SpellLocal  cterm=none ctermfg=36 ctermbg=none

end
"}}}

"{{{ 8 Color Terminal
if &t_Co == 8
	hi Cursor		cterm=reverse
	hi CursorLine	ctermbg=none cterm=bold
	hi ErrorMsg		ctermfg=white ctermbg=red cterm=bold
	hi VertSplit	ctermfg=0 ctermbg=none cterm=bold
	hi Folded		ctermfg=0 ctermbg=none cterm=bold
	hi LineNr		ctermfg=0 ctermbg=none cterm=bold
	hi ModeMsg		ctermfg=white ctermbg=none cterm=none
	hi NonText		ctermfg=2 ctermbg=none cterm=none
	hi IncSearch	ctermfg=black ctermbg=2 cterm=none
	hi SpecialKey	ctermfg=black cterm=bold
	hi StatusLine	ctermfg=blue ctermbg=white cterm=none
	hi StatusLineNC	ctermfg=black ctermbg=white cterm=none
	hi Visual		ctermfg=7 ctermbg=3 cterm=bold

"jklafjdlfsdjf TODO
	hi Comment		ctermfg=black cterm=bold
	hi Constant		ctermfg=brown cterm=none
	hi Error		ctermfg=red ctermbg=none cterm=reverse
	hi Todo			ctermfg=green ctermbg=none cterm=none
	hi String		ctermfg=green cterm=none
	hi Number		ctermfg=blue cterm=bold
	hi Float		ctermfg=brown cterm=none
	hi Boolean		ctermfg=magenta cterm=none
	hi Ignore		ctermfg=black cterm=bold

	hi Identifier	ctermfg=green cterm=bold
	hi Function		ctermfg=red cterm=bold
	hi Statement	ctermfg=green cterm=none
	hi PreProc		ctermfg=red cterm=bold
	hi Include		ctermfg=4
	hi MatchParen	ctermbg=4
	hi PreCondit	ctermfg=4
	hi Type			ctermfg=brown cterm=bold
	hi StorageClass	ctermfg=black cterm=bold
	hi Special		ctermfg=black cterm=bold
	
	hi TabLine		ctermfg=white ctermbg=none cterm=none
	hi TabLineFill	ctermfg=black cterm=none
	hi TabLineSel	ctermfg=cyan ctermbg=none cterm=none


"	hi OverLength	ctermfg=1
"	match OverLength /\%81v.*/
end
"}}}
