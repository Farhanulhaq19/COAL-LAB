.model small
.stack 100h
.data
    Var1 DB 23
    Var2 DB 65
    msg1 DB "Before swapping - Var1: $"
    msg2 DB "Before swapping - Var2: $"
    msg3 DB "After swapping  - Var1: $"
    msg4 DB "After swapping  - Var2: $"
    newline DB 0Dh, 0Ah, '$'

.code
main proc

    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 9
    int 21h

    mov al, Var1
    call DisplayNumber

    lea dx, newline
    mov ah, 9
    int 21h

    lea dx, msg2
    mov ah, 9
    int 21h

    mov al, Var2
    call DisplayNumber

    mov al, Var1
    mov bl, Var2
    mov Var1, bl
    mov Var2, al

    lea dx, msg3
    mov ah, 9
    int 21h

    mov al, Var1
    call DisplayNumber

    lea dx, newline
    mov ah, 9
    int 21h

    lea dx, msg4
    mov ah, 9
    int 21h

    mov al, Var2
    call DisplayNumber

    mov ah, 4Ch
    int 21h

main endp

DisplayNumber proc
    mov ah, 0
    mov bl, 10
    div bl
    add al, 30h
    mov dl, al
    mov ah, 2
    int 21h

    mov al, ah
    add al, 30h
    mov dl, al
    mov ah, 2
    int 21h

    ret
DisplayNumber endp

end main
