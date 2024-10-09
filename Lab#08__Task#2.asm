.model small
.stack 100h
.data
    space db ' ', '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 0
    mov bx, 1

    push ax
    push bx

    mov cx, 4

fibonacci_loop:
    add ax, bx
    push ax
    xchg ax, bx
    loop fibonacci_loop

    mov cx, 6

print_fibonacci:
    pop ax
    call print_number
    call print_space
    loop print_fibonacci

    mov ah, 4Ch
    int 21h

print_number proc
    mov bx, 10
    xor dx, dx
    div bx
    add dl, '0'
    mov ah, 02h
    int 21h
    ret
print_number endp

print_space proc
    mov ah, 09h
    lea dx, space
    int 21h
    ret
print_space endp

end main
