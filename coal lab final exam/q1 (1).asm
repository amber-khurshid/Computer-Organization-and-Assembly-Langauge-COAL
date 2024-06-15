[org 0x0100]

jmp start

num1: dw 45
num2: dw 22

equality:
    push bp
    mov bp, sp
    push ax
    push bx

    
    mov ax, [bp+6] 
    mov bx, [bp+4]  

   
    cmp ax, bx
    jne not_equal
  
not_equal:

    pop bx
    pop ax
    mov sp, bp
    pop bp
    ret

less_than_or_equal_to:
    push bp
    mov bp, sp
    push ax
    push bx

 
    mov ax, [bp+6]  
    mov bx, [bp+4]  

    
    cmp ax, bx
    jg not_less_equal
    
not_less_equal:

    pop bx
    pop ax
    mov sp, bp
    pop bp
    ret

greater_than_or_equal_to:
    push bp
    mov bp, sp
    push ax
    push bx

    
    mov ax, [bp+6]  
    mov bx, [bp+4]  

    
    cmp ax, bx
    jl not_greater_equal
    
not_greater_equal:

    pop bx
    pop ax
    mov sp, bp
    pop bp
    ret

start:
    
    mov ax, [num1]
    mov bx, [num2]

    
    push bx
    push ax

    
    call equality
    call less_than_or_equal_to
    call greater_than_or_equal_to

   
    mov ax, 0x4c00
    int 0x21
