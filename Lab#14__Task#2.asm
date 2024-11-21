TITLE Task 2: Determine Grade Based on Marks
INCLUDE Irvine32.inc

.data
marks WORD 85
grade BYTE ?
message BYTE "Grade: ", 0
grades BYTE "A", "B", "C", "F", 0

.code
main PROC
    mov ax, marks
    .IF ax >= 80
        mov grade, 'A'
    .ELSEIF ax >= 70
        mov grade, 'B'
    .ELSEIF ax >= 60
        mov grade, 'C'
    .ELSE
        mov grade, 'F'
    .ENDIF

    mov edx, OFFSET message
    call WriteString
    movzx eax, grade
    call WriteChar

    call crlf
    exit
main ENDP
END main
