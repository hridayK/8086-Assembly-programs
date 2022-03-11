; program to print 16 bit number
data segment
a db 0F7h ; <ascii for F><ascii of 1>
data ends

; program print 'F1' on the screen
; 'F1' -> '0F'
; print
; 'F1' -> '01'
; print

code segment
start:
assume cs:code, ds:data
mov ax,data
mov ds,ax

mov bl, a
and bl, 0F0h ; mask out the last 4 bits (F1 -> F0)
ror bl, 4 ; rotate the 4 bits to the right
call convert

mov dl, bl
mov ah, 02h
int 21h

mov bl, a
and bl, 0Fh ; F1 -> 01
call convert

mov dl, bl
mov ah, 02h
int 21h

mov ah,4ch
int 21h

convert proc
    cmp bl,0Ah ; is bl < 0A
    jc l1 ; if true then jump to l1
    add bl,37h ; else add bl to 37h (for bl between 10 and 15) (A - F)
    jmp l2
            l1: add bl, 30h ; add bl to 30h  (for bl between 0, 9)
                  l2: ret    
endp

code ends
end start