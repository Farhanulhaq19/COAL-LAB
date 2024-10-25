.model small
.stack 100h
.data
    num1 dw 45
    num2 dw 12
    num3 dw 19
    result dw 0
    result_msg db 'The sum of three digits is:45, 12 and 19 $', 0
    answer_msg db 'Answer: $', 0
.code
add_numbers macro
    mov ax, num1
    add ax, num2
    add ax, num3
    mov result, ax
endm

print_number macro
    push ax
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

main proc
    mov ax, @data
    mov ds, ax
    
    ; Add the numbers
    add_numbers
    
    ; Display result message
    display result_msg
    newline
    
    ; Display the answer label
    display answer_msg
    
    ; Print the sum result
    mov ax, result
    print_number
    
    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

end main
