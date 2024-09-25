.model small
.stack 100h

.data
    numbers dw 5,107,8,78,77
    sum dw 0

.code
    main proc
        mov ax, @data
        mov ds, ax

        lea si, numbers
        mov cx, 4
        mov bx, 0

    add_loop:
        add bx, [si]
        add si, 2
        loop add_loop

        mov sum, bx
        mov ax, sum
        call DisplayNumber

        mov ah, 4Ch
        int 21h
    main endp

DisplayNumber proc
    mov bx, 10
    mov cx, 0
next_digit:
    xor dx, dx
    div bx
    add dl, '0'
    push dx
    inc cx
    test ax, ax
    jnz next_digit
print_digits:
    pop dx
    mov ah, 2
    int 21h
    loop print_digits
    ret
DisplayNumber endp

end main
