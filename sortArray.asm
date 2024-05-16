org 100h

.data 
    nums db 5,8,7,1,3
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov si, offset nums
    mov bx, 4
    mov cx, 4
    
    loop1:
          mov si, offset nums
         dec bx
        mov cx, 4
        loop2:
            mov al, [si]
            mov dl, [si+1]
            cmp al, dl
            jg update
            resume:
            inc si
         loop loop2
         
         jmp counterControll
         
         update:
            xchg al, dl
            mov [si], al
            mov [si+1], dl 
            jmp resume
     loop loop1
     
       
       counterControll:
      
           mov cx, bx 
           cmp bx, 0
           je exit
       jmp loop1
       
          
       exit:
       call printArr 
       mov ah, 4ch
       int 21h
   main endp

    printArr proc
         mov cx, 5 
         mov si, offset nums
         mov ah, 02h
         arrprintLoop:
            mov dl, [si]
            add dl, 48
            int 21h
            mov dl, 32
            int 21h 
            inc si
          loop arrprintLoop 
          ret 
      printArr endp 
end main
  
            
            
        
