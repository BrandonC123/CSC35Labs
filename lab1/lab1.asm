#Brandon Chu
#Section 4 discussion, Section 5 lab

.intel_syntax noprefix
.data
Greeting:
    .ascii "Hello, world!\n\0"
Greetin:
    .ascii "My name is Brandon\n\0"
Quote:
    .ascii "Absorb what is useful, discard what is useless, and add what is specifically your own -Bruce Lee\n\0"
Year:
    .ascii "In the year \0"
Years:
    .ascii " Bruce Lee was born.\n\0"
Q:
    .quad 2008

.text
.global _start

_start:
    lea rax, Greeting
    call PrintCString
    lea rax, Greetin
    call PrintCString
    lea rax, Quote
    call PrintCString
    lea rax, Year
    call PrintCString
    mov rax, 1940
    call PrintInt
    lea rax, Years
    call PrintCString
    mov rax, 42
    mov rax, Q
    call PrintInt

    call EndProgram
    