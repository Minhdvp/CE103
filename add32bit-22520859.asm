name "add32bit"

org 100h
mov ah,1     ;ah=00000001b
mov al,9     ;al=10000010b
mov bh,5     ;bh=10000100b
mov bl,2     ;bl=10001000b
mov ch,1
mov cl,3
mov dh,0
mov dl,1

add bl,dl
adc bh,dh
adc al,cl
adc ah,ch

mov dh,ah
PUSH ax
 ;print result in binary;
mov cx,8
print1: mov ah,2   ; print function
        mov dl,'0'
        test dh,10000000b ; test first bit.
        jz zero1
        mov dl,'1'
zero1:  int 21h
        shl dh,1
loop print1
POP ax
mov dh,al

mov cx,8
print2: mov ah,2 ; print function
        mov dl,'0'
        test dh, 10000000b; test first bit    
        jz zero2
        mov dl, '1'
zero2: int 21h
       shl dh,1
loop print2

mov cx,8
print3: mov ah,2 ;print function
        mov dl, '0' 
        test bh,10000000b ; test first bit
        jz zero3
        mov dl, '1'
zero3:  int 21h
        shl dh,1
loop print3
mov cx,8
print4: mov ah,2 ; print function
        mov dl,'0'
        test dh,10000000b; test first bit
        jz zero4
        mov dl ,'1' 
zero4: int 21h
       shl dh,1 
; print binary suffix:
mov dl, 'b'
int 21h

; wait for any key press:
mov ah, 0
int 16h
       

ret




