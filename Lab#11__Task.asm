 .model small
.stack 100h
.data
    msg1 db 'Please select the proper number from the following:',13,10,'1.Addition',13,10,'2.Subtraction',13,10,'3.Division',13,10,'$'
    msgAdd db 'The sum of the above numbers is: $', 0
    msgSub db 'The difference of the above numbers is: $',0
    msgDiv db 'The division of the above numbers is: $',0
    msgNum1 db 'Enter number 1: $',0
    msgNum2 db 'Enter number 2: $',0
    choice db 0
    num1 dw 0
    num2 dw 0
    result dw 0
.code
display macro msg
    lea dx,msg
    mov ah,9
    int 21h
endm

read_number macro num
    lea dx,num
    mov ah,1
    int 21h
    sub al,'0'
    cbw
    mov num,ax
endm

newline macro
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
endm

main proc
    mov ax,@data
    mov ds,ax

    display msg1
    newline

    mov ah,1
    int 21h
    sub al,'0'
    mov choice,al
    newline

    ; Asking for numbers
    display msgNum1
    read_number num1
    newline
    display msgNum2
    read_number num2
    newline

    ; Perform the operation which user have selected
    cmp choice,1
    je addition
    cmp choice,2
    je subtraction
    cmp choice,3
    je division
    jmp exit
    ;Operation for additon or plus
addition:
    mov ax,num1
    add ax,num2
    mov result,ax
    display msgAdd
    jmp show_result
    ; operation for subtraction or minus
subtraction:
    mov ax,num1
    sub ax,num2
    mov result,ax
    display msgSub
    jmp show_result
    ; same as for operation for divison
division:
    mov ax,num1
    cwd
    mov bx,num2
    div bx
    mov result, ax
    display msgDiv
    jmp show_result

show_result:
    call print_number
    newline
    jmp exit

print_number proc
    push ax
    push bx
    push cx
    mov ax,result
    mov bx,10
    xor cx,cx
print_loop:
    xor dx,dx
    div bx
    add dl,'0'
    push dx
    inc cx
    test ax,ax
    jnz print_loop

print_digits:
    pop dx
    mov ah,2
    int 21h
    loop print_digits
    pop cx
    pop bx
    pop ax
    ret
print_number endp

exit:
    mov ah,4Ch
    int 21h

end main