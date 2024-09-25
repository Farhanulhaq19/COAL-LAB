.model small
.stack 100h
.data
    num1 db 8           ; First number
    num2 db 4          ; Second number
    num3 db 12          ; Third number
    result db 0         ; To store the result

.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Load the first number into al
    mov al, [num1]        ; al = num1

    add bl, [num2]        ; al=bl+num2

    add cl, [num3]
    mov [result], dl      ; result=dl
     
    mov ah, 4Ch
    int 21h

main endp
end main