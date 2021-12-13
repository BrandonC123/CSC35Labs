#Brandon Chu
#Section 4 discussion, Section 5 lab CSC35
#Lab 2 Money

.intel_syntax noprefix
.data
Greeting:
    .ascii "Gringotts Wizarding Bank\n\0"
Money:
    .ascii "How much do you earn from work?\n\0"
Cash:
    .quad 0
Food:
    .ascii "How much do you spend on food?\n\0"
totalf:
    .quad 0
Rent:
    .ascii "How much do you spend on rent?\n\0"
totalr:
    .quad 0
Magic:
    .ascii "How much do you spend on magic objects?\n\0"
totalm:
    .quad 0
Expenses:
    .ascii "Your expenses are $\0"
Cost:
    .quad 0
Cashflow:
    .ascii "\nSo, your cash flow is $\0"
Linebreak:
    .ascii "\n\0"

.text
.global _start

_start:
    lea rax, Greeting
    call PrintCString

    lea rax, Money
    call PrintCString
    call ScanInt
    movq Cash, rax

    lea rax, Food
    call PrintCString
    call ScanInt
    movq totalf, rax

    lea rax, Rent
    call PrintCString
    call ScanInt
    movq totalr, rax

    lea rax, Magic
    call PrintCString
    call ScanInt
    movq totalm, rax

    lea rax, Expenses
    call PrintCString

    mov rax, totalf
    add Cost, rax
    mov rax, totalr
    add Cost, rax
    mov rax, totalm
    add Cost, rax

    mov rax, Cost
    call PrintInt

    lea rax, Cashflow
    call PrintCString

    mov rax, Cost
    sub Cash, rax
    mov rax, Cash
    call PrintInt

    lea rax, Linebreak
    call PrintCString

    call EndProgram
