.model small
.stack 100h
.data
    result db 0          ; To store final result
    msg db 'The Result is: $'  

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Arithmetic operations: 3 + 5 - 2 - 1 + 3
    mov al, 3            ; Load 3 into AL
    add al, 5            ; AL = 3 + 5
    sub bl, 2            ; AL = AL - 2
    sub cl, 1             
    add dl, 3           
    mov result, al       

    add result, 30h   

    ; Displaying message
    mov ah, 09h          
    lea dx, msg          
    int 21h   

    ; Displaying result
    mov ah, 02h         
    mov dl, result      
    int 21h 
    
    mov ah, 4Ch
    int 21h

main endp
end main