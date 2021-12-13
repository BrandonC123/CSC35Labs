#Brandon Chu
#Section 4 discussion, Section 5 lab CSC35
#Lab 5 Barf

.intel_syntax noprefix
.data
Greeting:
    .ascii "Oh! Hi there! I'm the Gryffindor Vending Statue.\n\n\0"
One:
    .ascii "1. Quill & Ink (25 knuts)\n\0"
Two:
    .ascii "2. One-Day-Only Cauldron (85 knuts)\n\0"
Three:
    .ascii "3. One-Day-Only Wand (120 knuts)\n\0"
Four:
    .ascii "4. Every Flavor Beans (42 knuts)\n\0"
Cancel:
    .ascii "5. Cancel the order (0 knuts)\n\0"
OneMessage:
    .ascii "A Quill & Ink flies out of the statue.\n\0"
TwoMessage:
    .ascii "A Cauldron flies out of the statue.\n\0"
ThreeMessage:
    .ascii "A wand flies out of the statue.\n\0"
FourMessage:
    .ascii "Every Flavor Beans flies out of the statue.\n\0"
Amount:
    .ascii "How many knuts are you feeding it?\n\0"
Selection:
    .ascii "Enter your selection:\n\0"
Change1:
    .ascii "Your change is \0"
Change2: 
    .ascii " knuts\n\0"
LineBreak:
    .ascii "\n\0"
Number:
    .quad 0
Option:
    .quad 0
.text
.global _start

_start:
    lea rax, Greeting
    call PrintCString
    lea rax, One
    call PrintCString
    lea rax, Two
    call PrintCString
    lea rax, Three
    call PrintCString
    lea rax, Four
    call PrintCString
    lea rax, Cancel
    call PrintCString
    lea rax, LineBreak
    call PrintCString

    lea rax, Amount
    call PrintCString
    call ScanInt
    mov Number, rax
    lea rax, LineBreak
    call PrintCString

    lea rax, Selection
    call PrintCString
    call ScanInt
    mov Option, rax
    lea rax, LineBreak
    call PrintCString

    mov rax, Option
    cmp rax, 1
    je _CaseOne
    cmp rax, 2
    je _CaseTwo
    cmp rax, 3
    je _CaseThree
    cmp rax, 4 
    je _CaseFour
    jmp _Default

_CaseOne:
    lea rax, OneMessage
    call PrintCString
    lea rax, LineBreak
    call PrintCString
    lea rax, Change1
    call PrintCString
    mov rax, Number
    sub rax, 25
    call PrintInt
    lea rax, Change2
    call PrintCString
    lea rax, LineBreak
    call PrintCString
    jmp End
_CaseTwo:
    lea rax, TwoMessage
    call PrintCString
    lea rax, LineBreak
    call PrintCString
    lea rax, Change1
    call PrintCString
    mov rax, Number
    sub rax, 85
    call PrintInt
    lea rax, Change2
    call PrintCString
    jmp End
_CaseThree:
    lea rax, ThreeMessage
    call PrintCString
    lea rax, LineBreak
    call PrintCString
    lea rax, Change1
    call PrintCString
    mov rax, Number
    sub rax, 120
    call PrintInt
    lea rax, Change2
    call PrintCString
    jmp End
_CaseFour:
    lea rax, FourMessage
    call PrintCString
    lea rax, LineBreak
    call PrintCString
    lea rax, Change1
    call PrintCString
    mov rax, Number
    sub rax, 42
    call PrintInt
    lea rax, Change2
    call PrintCString
    jmp End
_Default:
    lea rax, Change1
    call PrintCString
    mov rax, Number
    call PrintInt
    lea rax, Change2
    call PrintCString

End:
    call EndProgram
