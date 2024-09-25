.model small
.stack 100h
.data

var1 db 6
arr db 1,2,3,4,5,6
arr2 db 'a','b','c','g'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, arr
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h

    inc si
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h

    inc si
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h

    inc si
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h

    inc si
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h

    inc si
    mov dl, [si]
    add dl, 48
    mov ah, 2
    int 21h

    mov ah, 4Ch
    int 21h

main endp
end main
