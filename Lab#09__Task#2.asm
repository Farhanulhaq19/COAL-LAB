.model small
.stack 100h
.data
    num1 dw 7
    num2 dw 19
    num3 dw 789
    result dw 0
    result_msg db 'The sum of three digits is: $', 0
.code
main proc
    mov ax, @data
    mov ds, ax
    
    call add_numbers
    
    lea dx, result_msg
    mov ah, 9
    int 21h
    
    mov ax, result
    call print_number
    
    mov ah, 4Ch
    int 21h
main endp

add_numbers proc
    mov ax, num1
    add ax, num2
    add ax, num3
    mov result, ax
    ret
add_numbers endp

print_number proc
    mov bx, 10
    mov cx, 0
    
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
    ret
print_number endp

end main
