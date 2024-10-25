.model small
.stack 100h
.data
    num1 dw 19
    num2 dw 2
    msg_before db 'Before Swap: $', 0
    msg_after db 'After Swap: $', 0
    num1_msg db 'num1 = $', 0
    num2_msg db 'num2 = $', 0
.code

swap_proc macro
    push ax
    push bx
    mov ax, num1
    push ax
    mov ax, num2
    push ax
    pop ax
    mov num1, ax
    pop ax
    mov num2, ax
    pop bx
    pop ax
endm

display macro var
    push ax
    lea dx, var
    mov ah, 9
    int 21h
    pop ax
endm

newline macro
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
endm

display_number macro num
    mov ax, num
    call print_number
endm

print_number proc
    push bx
    push cx
    push dx
    mov bx, 10
    xor cx, cx
print_loop:
    xor dx, dx
    div bx
    add dl, '0'
    push dx
    inc cx
    test ax, ax
    jnz print_loop
print_digits:
    pop dx
    mov ah, 2
    mov dl, dl
    int 21h
    loop print_digits
    pop dx
    pop cx
    pop bx
    ret
print_number endp

main proc
    mov ax, @data
    mov ds, ax
    
    display msg_before
    newline
    
    display num1_msg
    display_number num1
    newline
    
    display num2_msg
    display_number num2
    newline
    
    swap_proc
    
    display msg_after
    newline
    
    display num1_msg
    display_number num1
    newline
    
    display num2_msg
    display_number num2
    newline
    
    mov ah, 4Ch
    int 21h
main endp

end main
