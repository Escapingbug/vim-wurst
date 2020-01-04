" Language:     WurstSCript
" Maintainer:   Anciety
" LICENSE:      MIT

if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "wurst"

syn keyword wurstConditional if else then endif
syn keyword wurstBoolean true false
syn keyword wurstTodo contained TODO FIXME NOTE
syn keyword wurstKeyword vararg class return while for in break new null package endpackage returns public publicread private protected import initlater native nativetype extends interface implements module use abstract static thistype override immutable it array and or not this construct ondestroy destroy type constant endfunction nothing init castTo tuple div mod let from to downto step skip var instanceOf super enum switch case default begin end library endlibrary scope endscope requires uses needs struct endstruct loop exithwhen endloop method takes endmethod set call exitwhen
syn keyword wurstType null boolean int real string

syn match wurstComment "\(\/\/.*\|\/\/*\_.*\*\/\)"
syn match wurstOperator "\[,\+-\*\/%\.\?:=!\<\>]"
syn match wurstAnnotation "@" display contained
syn match wurstAnnotationName "@\s*\h\%(\w\|\.\)*" display contains=wurstAnnotation
syn match wurstFunction "\v(function)\s*" display contained
syn match wurstFunctionName "\v(function)\s*\h\w*" display contains=wurstFunction
syn region wurstParens matchgroup=wurstDelimiter start="(" end=")" transparent
syn region wurstBrackets matchgroup=wurstDelimiter start="\[" end="]" transparent
syn region wurstBrackets matchgroup=wurstDelimiter start="{" end="}" transparent

hi def link wurstType Type
hi def link wurstAnnotation  Define
hi def link wurstFunction Keyword 
hi def link wurstFunctionName Function
hi def link wurstAnnotationName Function

hi def link wurstComment Comment

hi def link wurstConditional Conditional
hi def link wurstBoolean Boolean
hi def link wurstTodo Todo
hi def link wurstKeyword Keyword
hi def link wurstOperator Operator
hi def link wurstDelimiter Delimiter

syn match wurstNumber "\v<\d+>"
syn match wurstNumber "\v<\d+\.\d+>"
syn match wurstNumber "\v<0x\x+(Pp-?)?\x+>"
syn match wurstNumber "\v<0b[01]+>"
syn match wurstNumber "\v<0o\o+>"

hi def link wurstNumber Number

syn match wurstEscape           display contained /\\\([nrt0\\'"]\|x\x\{2}\)/

syn region wurstString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=wurstEscape,@Spell
syn region wurstString          start=+'+ skip=+\\\\\|\\"+ end=+'+ contains=wurstEscape,@Spell

hi def link wurstString String
