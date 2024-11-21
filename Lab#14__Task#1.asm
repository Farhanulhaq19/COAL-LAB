TITLE Task 1: Using loopnz, shl, and movsx
INCLUDE Irvine32.inc

.data
array SWORD -3, -6, -1, 15, 25, 0
positiveValue SWORD 0
message BYTE "First positive value after shift: ", 0

.code
main PROC
    mov esi, OFFSET array
    mov ecx, LENGTHOF array

find_positive:
    test WORD PTR [esi], 8000h
    jns found_positive
    add esi, TYPE array
    loopnz find_positive
    jmp end_program

found_positive:
    movsx eax, WORD PTR [esi]
    shl eax, 2
    mov positiveValue, ax

    mov edx, OFFSET message
    call WriteString
    movzx eax, positiveValue
    call WriteInt

end_program:
    call crlf
    exit
main ENDP
END main
