.model small
.stack 100h

.data
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov dl, '0'
        mov cx, 10
    display_digits:
        mov ah, 2
        int 21h
        inc dl
        loop display_digits

        mov dl, 'A'
        mov cx, 26
    display_letters:
        mov ah, 2
        int 21h
        inc dl
        loop display_letters

        mov ah, 4Ch
        int 21h
    main endp
end main
