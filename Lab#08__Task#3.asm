.model small
.stack 100h
.data
    nums dw 10, 20, 30, 40, 50
    newline db 0Dh, 0Ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, nums
    mov cx, 5

push_loop:
    mov ax, [si]
    push ax
    add si, 2
    loop push_loop

    mov bp, sp
    mov cx, 5

pop_loop:
    pop ax
    call print_number
    call print_newline
    loop pop_loop

    mov sp, bp
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

print_newline proc
    mov ah, 09h
    lea dx, newline
    int 21h
    ret
print_newline endp

end main
