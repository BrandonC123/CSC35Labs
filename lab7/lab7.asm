#Brandon Chu
#Section 4 discussion, Section 5 lab CSC35
#Lab 7 Poof

.intel_syntax noprefix
.data
Name:
    .ascii "My name is Brandon Chu\n"
Message:
    .ascii "This is somewhat dangerous but here goes!\n"
Magic:
    .ascii "Abracadabra!\n"
Ending:
    .ascii "I made it! I plan to learn web development over winter break\n"
Linebreak:
    .ascii "\n"

.text
.global _start

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, Name
    mov rdx, 23
    syscall
    call Linbreaker

    mov rax, 1
    mov rdi, 1
    lea rsi, Message
    mov rdx, 42
    syscall
    call Linbreaker

    call MagicMessage
    call Linbreaker
    call MagicMessage
    call Linbreaker

    mov rax, 1
    mov rdi, 1
    lea rsi, Ending
    mov rdx, 61
    syscall

    mov rax, 60
    syscall

MagicMessage:
    mov rax, 1
    mov rdi, 1
    lea rsi, Magic
    mov rdx, 13
    syscall
    ret

Linbreaker:
    mov rax, 1
    mov rdi, 1
    lea rsi, Linebreak
    mov rdx, 1
    syscall
    ret
