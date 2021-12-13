#Brandon Chu
#Section 4 discussion, Section 5 lab CSC35
#Lab 3 Kitty

.intel_syntax noprefix
.data
Greeting:
    .ascii "Hello, student, I'm Ninji the Nonchalant.\n\0"
Books:
    .ascii "Young student, did you buy your books? (1=yes 2=no)?\n\0"
Pet:
    .ascii "Did you get an animal pet? (1=yes 2=no)?\n\0"
House:
    .ascii "Are you afraid of what house you will be sorted into? (1=yes 2=no)?\n\0"
Muggle:
    .ascii "Are you a muggle-born? (1=yes 2=no)?\n\0"
Wand:
    .ascii "Oh, did you get a wand yet? (1=yes 2=no)?\n\0"
Stress:
    .ascii "Your total stress level is at \0"
Fine:
    .ascii "You are going do fine student! Keep your chin up!\n\0"
Cocoa:
    .ascii "Oh dear! You are so stressed! Here! Have some magical calming hot cocoa!\n\0"
StressLevel:
    .quad 0
LineBreak:
    .ascii "\n\0"

.text
.global _start

_start:
    lea rax, Greeting
    call PrintCString

    lea rax, Books
    call PrintCString
    call ScanInt

    cmp rax, 2
    je BooksAdd
    jmp End
BooksAdd:
    mov rax, 25
    add StressLevel, rax
End:

    lea rax, Pet
    call PrintCString
    call ScanInt

    cmp rax, 2
    je PetAdd
    jmp End2
PetAdd:
    mov rax, 10
    add StressLevel, rax
End2:

    lea rax, House
    call PrintCString
    call ScanInt

    cmp rax, 1
    je HouseAdd
    jmp End3  
HouseAdd:
    mov rax, 30
    add StressLevel, rax
End3:

    lea rax, Muggle
    call PrintCString
    call ScanInt

    cmp rax, 1
    je MuggleAdd
    jmp End4   
MuggleAdd:
    mov rax, 15
    add StressLevel, rax
End4:

    lea rax, Wand
    call PrintCString
    call ScanInt

    cmp rax, 2
    je WandAdd
    jmp End5   
WandAdd:
    mov rax, 20
    add StressLevel, rax
End5:

    lea rax, Stress
    call PrintCString
    mov rax, StressLevel
    call PrintInt 
    lea rax, LineBreak
    call PrintCString

    mov rax, StressLevel
    cmp rax, 70
    jg CocoaAdd
    lea rax, Fine
    call PrintCString
    jmp EndProg
CocoaAdd:
    lea rax, Cocoa
    call PrintCString
    jmp EndProg

EndProg:
    call EndProgram
