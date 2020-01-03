if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal nocindent
setlocal autoindent
setlocal indentkeys+=<:>,0=},0=)
setlocal indentexpr=WurstIndent(v:lnum)

if exists("*WurstIndent")
    finish
endif

if exists("*shiftwidth")
    func s:sw()
        return shiftwidth()
    endfunc
else
    func s:sw()
        return &sw
    endfunc
endif

function! WurstIndent(lnum)
    let prevlnum = prevnonblank(a:lnum-1)
    if prevlnum == 0
        return 0
    endif

    let prevline = substitute(getline(prevlnum), '\V//.*', '', 'g')
    let thisline = substitute(getline(a:lnum), '\V//.*', '', 'g')
    let previndent = indent(prevlnum)

    let thisindent = previndent

    " blocks
    if prevline =~ '\v(if|else|init|function|switch|case|default|enum|while|for|class|construct|ondestroy|module|interface)\s*'
        let thisindent += s:sw()
    endif

    if prevline =~ '\v(\($)'
        let thisindent += s:sw()
    endif

    if thisline =~ '\v(else|^\s*\))'
        let thisindent -= s:sw()
    endif

    return thisindent
endfunction
