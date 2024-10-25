display macro var
    push ax
    lea dx, var
    mov ah, 9
    int 21h
    pop ax
endm

.model small
.stack 100h
.data
    var1 db 'Hello$', 0
    newline db 0Dh, 0Ah, '$'
    var2 db 'World$', 0
.code
main proc
    mov ax, @data
    mov ds, ax
    display var1
    display newline
    display var2
    mov ah, 4Ch
    int 21h
main endp

end main
