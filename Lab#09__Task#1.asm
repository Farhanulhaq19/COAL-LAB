.model small
.stack 100h
.data
    original db 'My name is Farhan!', 0
    reversed db 50 dup('$')
    len equ $-original-1 
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    lea si, original
    lea di, reversed
    mov cx, len
    
    call reverse_string
    
    lea dx, original
    mov ah, 9
    int 21h
    
    call newline
    
    lea dx, reversed
    mov ah, 9
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp

reverse_string proc
    push cx
    push si
    push di
    
    mov si, 0
    mov di, len-1
    
reverse_loop:
    mov al, [original + si]
    mov [reversed + di], al
    inc si
    dec di
    loop reverse_loop
    
    pop di
    pop si
    pop cx
    ret
reverse_string endp

newline proc
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    ret
newline endp

end main