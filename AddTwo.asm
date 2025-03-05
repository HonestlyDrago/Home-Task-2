.386
.stack 4096
include Irvine32.inc  ; Include the Irvine32 library for DumpRegs

.data
    m WORD 200      
    n DWORD 10000    
    o WORD 150       
    result DWORD ?   
    msg2 db "Q2 Result: ", 0  
    newline db 13, 10, 0  ; Newline for formatting output

.code
main proc

    mov ax, m       
    mov dx, 0        
    add ax, WORD PTR n    
    adc dx, WORD PTR n+2  
    sub ax, o        
    sbb dx, 0        

    mov result, eax   

    mov edx, OFFSET msg2  
    call WriteString      

    movzx eax, result 
    call WriteDec      
    call DumpRegs      

    mov edx, OFFSET newline  
    call WriteString

    invoke ExitProcess, 0  

main endp
end main
