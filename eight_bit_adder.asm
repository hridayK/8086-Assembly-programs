data segment
a db 0FFh
b db 0FFh
msg1 db "The result of the addition is $"
data ends

code segment
assume cs:code, ds:data         
start:
mov ax,data
mov ds,ax
                
mov dx,OFFSET msg1
mov ah,09h
int 21h 
    
mov cl,00
mov bl,a
add bl,b
JNC l3                                          
inc cl

l3:     mov dh,bl 
        mov bl,cl
        and bl,0Fh
        call convert
        mov dl,bl
        mov ah,02h
        int 21h

        mov bl,dh
        and bl,0F0h
        ror bl,04h

        call convert 
        mov dl,bl
        mov ah,02h
        int 21h    
    
    
        mov bl,dh
       and bl,0Fh
       call convert

       mov dl,bl
       mov ah,02h
       int 21h

mov ah,4ch
int 21h

convert proc
    cmp bl,0Ah
    jc l1
    add bl,37h
    jmp l2
            l1: add bl, 30h
                  l2: ret                                                                      
endp
code ends
end start