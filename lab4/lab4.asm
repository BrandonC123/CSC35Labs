#Brandon Chu
#Section 4 discussion, Section 5 lab CSC35
#Lab 4 Wit

.intel_syntax noprefix
.data
Greeting:
    .ascii "Greetings Ravenclaw student!\nYet... before... you may proceed... within 1 and 100... a number I need.\n\0"
Guess:
    .ascii "Guess: \0"
Large:
    .ascii "Alas, that is too large.\n\0"
Small:
    .ascii "Regrettably, that is too small.\n\0"
ExitMessage:
    .ascii "Well-reasoned! You may now enter!\n\0"
Number:
    .quad 0
Linebreak:
    .ascii "\n\0"
.text
.global _start

_start:
    lea rax, Greeting
    call PrintCString

    mov rax, 100
    call Random
    add rax, 1
    mov Number, rax

_While:
    lea rax, Linebreak
    call PrintCString
    lea rax, Guess
    call PrintCString
    call ScanInt

    cmp rax, Number
    jg _Larger
    jl _Smaller
    je _Equal

_Larger:
    lea rax, Large
    call PrintCString
    jmp _While

_Smaller:
    lea rax, Small
    call PrintCString
    jmp _While

_Equal:
    lea rax, Linebreak
    call PrintCString
    lea rax, ExitMessage
    call PrintCString

    call EndProgram
