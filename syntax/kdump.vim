"
" Vim syntax file for FreeBSD ktrace/kdump output.
"
" Copyright 2018 Jonathan Anderson
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
"
" 1. Redistributions of source code must retain the above copyright notice, this
"    list of conditions and the following disclaimer.
"
" 2. Redistributions in binary form must reproduce the above copyright notice,
"    this list of conditions and the following disclaimer in the documentation
"    and/or other materials provided with the distribution.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
" DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
" SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
" OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
" OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"

syntax keyword kdumpOp CALL GIO NAMI RET SCTL STRU
highlight default link kdumpOp Type


"
" The first column is the PID.
"
syn match kdumpPid	'^ \+\<[0-9]\{1,5\}\>'	nextgroup=kdumpCommand skipwhite

highlight default link kdumpPid		Label

"
" The next column is the (abbreviated) command that was run.
"
syn match kdumpCommand	'\<[a-zA-Z0-9_\-]\+\>'	contained
highlight default link kdumpCommand	Identifier

"
" Finally, we have the ktrace details:
"

syntax region kdumpString start=/"/ skip=/\\"/ end=/"/
highlight default link kdumpString	String

syntax region kdumpHexdump start=/|/ end=/|\n/ oneline
highlight default link kdumpHexdump	Debug

syn match kdumpSymbol	'[\(\){}<>|]'
highlight default link kdumpSymbol	Special

syn match kdumpConstant	'\<[A-Z_]\+\>'
highlight default link kdumpConstant	Constant

syn match kdumpId	'\<[a-zA-Z_\-]\+\>'
highlight default link kdumpId		Identifier

syn match kdumpNumber	'-\?\<\(0x\)\?[0-9a-f]\+\>'
highlight default link kdumpNumber	Number

let b:current_syntax = "kdump"
