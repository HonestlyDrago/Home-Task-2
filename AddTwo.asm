.386
.model flat,stdcall
.stack 4096
include Irvine32.inc  ; Include the Irvine32 library for DumpRegs

.data
   .data
    a WORD 100       
    b WORD 50        
    result WORD ?    
    msg1 db "Q1 Result: ", 0  
    newline db 13, 10, 0  
.code
main proc

    mov ax, a       
    add ax, b       
    sub ax, b       
    mov result, ax  

    mov edx, OFFSET msg1  
    call WriteString       

    movzx eax, result  
    call WriteDec      
    call DumpRegs      

    mov edx, OFFSET newline  
    call WriteString

    invoke ExitProcess, 0  

main endp
end main

