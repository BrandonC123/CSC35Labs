#Brandon Chu
#Section 4 discussion, Section 5 lab CSC35
#Lab 6 Yum

.intel_syntax noprefix
.data
Pumpkin:
    .ascii "Pumpkin Pasty        : 16 grams\n\0"
Flagon:
    .ascii "Flagon of Butterbeer : 21 grams\n\0"
Tower:
    .ascii "Tower of Ice Cream   : 40 grams\n\0"
PumpkinInput:
    .ascii "How pumpkin pasties to you take?\n\0"
PumpkinAmount:
    .quad 0
FlagonInput:
    .ascii "How many flagons of butterbeer?\n\0"
FlagonAmount:
    .quad 0   
TowerInput:
    .ascii "How many towers of ice cream?\n\0"
TowerAmount:
    .quad 0
TotalSugar:
    .quad 0
SugarResult1:
    .ascii "That's \0"
SugarResult2:
    .ascii " grams of sugar!\n\0"
SugarInput:
    .ascii "How much sugar can the student have?\n\0"
StudentSugar:
    .quad 0
FinalMessage1:
    .ascii "The student can only eat this \0"
FinalMessage2:
    .ascii " times\n\0"
FinalSugar:
    .quad 0
SugarAmount:
    .quad 0
Linebreak:
    .ascii "\n\0"

.text
.global _start

_start:
    lea rax, Pumpkin
    call PrintCString
    lea rax, Flagon
    call PrintCString
    lea rax, Tower
    call PrintCString
    lea rax, Linebreak
    call PrintCString

    lea rax, PumpkinInput
    call PrintCString
    call ScanInt
    mov rbx, 16
    imul rax, rbx
    mov PumpkinAmount, rax

    lea rax, FlagonInput
    call PrintCString
    call ScanInt
    mov rbx, 21
    imul rax, rbx
    mov FlagonAmount, rax

    lea rax, TowerInput
    call PrintCString
    call ScanInt
    mov rbx, 40
    imul rax, rbx
    mov TowerAmount, rax    

    mov rax, PumpkinAmount
    add SugarAmount, rax
    mov rax, FlagonAmount
    add SugarAmount, rax
    mov rax, TowerAmount
    add SugarAmount, rax

    lea rax, SugarResult1
    call PrintCString
    mov rax, SugarAmount
    call PrintInt
    lea rax, SugarResult2
    call PrintCString
    lea rax, Linebreak
    call PrintCString

    lea rax, SugarInput
    call PrintCString
    call ScanInt
    mov StudentSugar, rax
    lea rax, Linebreak
    call PrintCString
    
    movq rbx, SugarAmount
    movq rax, StudentSugar
    cqo
    idiv rbx
    mov FinalSugar, rax

    lea rax, FinalMessage1
    call PrintCString
    mov rax, FinalSugar
    call PrintInt
    lea rax, FinalMessage2
    call PrintCString

    call EndProgram
