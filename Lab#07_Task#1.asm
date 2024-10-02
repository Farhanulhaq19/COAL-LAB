.MODEL SMALL
.STACK 100H
.DATA
    STRING DB 'This is an String', 0
    REVERSED DB 100 DUP('$')
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    LEA SI, STRING
    LEA DI, REVERSED
    MOV CX, 0

PUSH_LOOP:
    LODSB                    
    CMP AL, '$'             
    JE REVERSE_LOOP          
    PUSH AX                  
    INC CX                   
    JMP PUSH_LOOP            

REVERSE_LOOP:
    
    CMP CX, 0                
    JE DISPLAY_STRINGS      
    POP AX                  
    MOV [DI], AL            
    INC DI                   
    DEC CX                   
    JMP REVERSE_LOOP         

DISPLAY_STRINGS:
   
    LEA DX, STRING
    MOV AH, 09H
    INT 21H

    LEA DX, REVERSED
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
