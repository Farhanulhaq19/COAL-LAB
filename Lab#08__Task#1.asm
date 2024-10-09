.model small
.stack 100h
.data
    str db 'My name is Farhan',0  
    len dw 18            
.code
main proc
    mov ax, @data       
    mov ds, ax

    lea si, str         
    mov cx, len        

reverse_loop:
    mov al, [si]      
    push ax            
    inc si              
    loop reverse_loop   

print_reversed:
    mov cx, len         

print_loop:
    pop ax              
    mov dl, al          
    mov ah, 02h         
    int 21h             
    loop print_loop    

    mov ah, 4Ch        
    int 21h
end main
