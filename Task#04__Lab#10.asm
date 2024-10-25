.model small
.stack 100h
.data
    arr dw 8,17,78,45            
    arr_len equ 4                
    sum dw 0                     
    msg_sum db 'The sum of the array elements is: $', 0
.code
add_elements macro
    push ax
    push bx
    push cx
    push si
    mov si, 0
    mov bx, 0
    mov cx, arr_len
add_loop:
    mov ax, arr[si]
    add bx, ax
    add si, 2
    loop add_loop
    mov sum, bx
    pop si
    pop cx
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
    mov ah, 2
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
    
    display msg_sum
    newline
    
    add_elements
    
    display_number sum
    newline
    
    mov ah, 4Ch
    int 21h
main endp

end main
