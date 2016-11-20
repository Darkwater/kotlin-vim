" Vim syntax file
" Language: Kotlin
" Maintainer: Alexander Udalov
" Latest Revision: 4 July 2016

if exists("b:current_syntax")
    finish
endif

let main_syntax = "kotlin"

syn keyword ktStatement break continue return
syn keyword ktConditional if else when
syn keyword ktRepeat do for while
syn keyword ktOperator as in is by to
syn keyword ktKeyword get set out super this where
syn keyword ktException try catch finally throw

syn keyword ktInclude import package

syn keyword ktModifier abstract final enum open annotation sealed data
syn keyword ktModifier override open final abstract lateinit
syn keyword ktModifier private protected public internal
syn keyword ktModifier noinline crossinline vararg
syn keyword ktModifier reified
syn keyword ktModifier tailrec operator infix inline external
syn keyword ktModifier const

syn keyword ktStructure class object interface typealias fun val var constructor init

syn keyword ktReservedKeyword typeof

syn keyword ktBoolean true false
syn keyword ktConstant null

syn keyword ktTodo TODO FIXME XXX contained
syn match ktShebang "\v^#!.*$"
syn match ktLineComment "\v//.*$" contains=ktTodo,@Spell
syn region ktComment matchgroup=ktCommentMatchGroup start="/\*" end="\*/" contains=ktComment,ktTodo,@Spell

" KDoc
syn case ignore

syn region ktMarkdownLink matchgroup=markdownLinkDelimiter start="\[" end="\]" oneline keepend skipwhite contained
syn cluster ktMarkdown contains=ktMarkdownLink
hi link ktMarkdownLink markdownLinkText
hi link ktMarkdownLinkDelimiter markdownLinkText

syn include @ktMarkdown syntax/markdown.vim
unlet b:current_syntax

syn match ktCommentStar      contained "^\s*\*\ze[^/]"
syn match ktCommentStar      contained "^\s*\*$"
syn match ktCommentStar      contained "^\s*\*/"
syn region ktDocComment       start="/\*\*"  end="\*/" keepend contains=ktCommentStar,ktCommentTitle,@ktMarkdown,ktDocTags,ktDocSeeTag,ktTodo
syn region ktCommentTitle     contained matchgroup=ktDocComment start="/\*\*"   matchgroup=ktCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-2 contains=ktCommentStar,@ktMarkdown,ktTodo,ktDocTags,ktDocSeeTag

syn match ktDocTags         contained "@\(param\|property\|throws\|exception\|sample\|see\)\s\+\S\+" contains=ktDocParam
syn match ktDocParam        contained "\s\S\+"
syn match ktDocTags         contained "@\(return\|constructor\|receiver\|author\|since\|suppress\)\>"

syn case match
" ---

syn match ktSpecialCharError "\v\\." contained
syn match ktSpecialChar "\v\\([tbnr'"$\\]|u\x{4})" contained
syn region ktString start='"' skip='\\"' end='"' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError
syn region ktString start='"""' end='"""' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'[^']*'" contains=ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'\\''" contains=ktSpecialChar
syn match ktCharacter "\v'[^\\]'"

" TODO: highlight label in 'this@Foo'
syn match ktAnnotation "\v(\w)@<!\@[[:alnum:]_.]*(:[[:alnum:]_.]*)?"
syn match ktLabel "\v\w+\@"

syn match ktSimpleInterpolation "\v\$\h\w*" contained
syn region ktComplexInterpolation matchgroup=ktComplexInterpolationBrace start="\v\$\{" end="\v\}" contains=ALLBUT,ktSimpleInterpolation

syn match ktNumber "\v<\d+[LFf]?"
syn match ktNumber "\v<0[Xx]\x+L?"
syn match ktNumber "\v<0[Bb]\d+L?"
syn match ktFloat "\v<\d*(\d[eE][-+]?\d+|\.\d+([eE][-+]?\d+)?)[Ff]?"

syn match ktEscapedName "\v`.*`"

syn match ktExclExcl "!!"
syn match ktArrow "->"

syn match ktIdentifier "\<[a-z]\w*\>"
syn match ktInfix " \zs[a-z]\w*" contained
syn match ktInfixPair "\<\w\+\s\+[a-z]\w*\>" contains=ktInfix,ktNumber,ktFloat,ktEscapedName,ktString,ktCharacter
syn match ktFunction "\<\w\+\ze\s*[({]"
syn match ktClass "\<[A-Z]\w*\>"



hi link ktStatement Statement
hi link ktConditional Conditional
hi link ktRepeat Repeat
hi link ktOperator Operator
hi link ktKeyword Keyword
hi link ktException Exception
hi link ktReservedKeyword Error

hi link ktInclude Include

hi link ktType Type
hi link ktModifier Modifier
hi link ktStructure Structure
hi link ktTypedef Typedef

hi link ktBoolean Boolean
hi link ktConstant Constant

hi link ktTodo Todo
hi link ktShebang Comment
hi link ktLineComment Comment
hi link ktComment Comment
hi link ktCommentMatchGroup Comment

hi link ktCommentStar Comment
hi link ktDocComment Comment
hi link ktCommentTitle SpecialComment
hi link ktDocTags Statement

hi link ktSpecialChar SpecialChar
hi link ktSpecialCharError Error
hi link ktString String
hi link ktCharacter Character

hi link ktFunction Function
hi link ktInfix Function
hi link ktClass StorageClass
hi link ktIdentifier Identifier

hi link ktAnnotation Identifier
hi link ktLabel Identifier

hi link ktSimpleInterpolation Identifier
hi link ktComplexInterpolationBrace Identifier

hi link ktNumber Number
hi link ktFloat Float

hi link ktExclExcl Special
hi link ktArrow Structure
