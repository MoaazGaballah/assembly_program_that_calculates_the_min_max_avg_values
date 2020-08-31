;find maximum
org 100h
.data
NUMS dw -117,317,-575,379,596,-1200,649,15,-145,1331  ;array
RESTMAX dw 1
RESTMIN dw 1
RESTAVG dw 1
.code    
                 
mov di,20 ; this is array size
mov bp,2 ; this is to choose segnment(byte=1, word=2, Double Word=4)

mov si,0
mov bx,NUMS[si] ;assuming the first element in the array is the max
mov RESTMAX,bx
add si,bp
find_max:
    mov ax,NUMS[si]
    add si,bp
    cmp RESTMAX,ax
    jle change_max
    return_max:
    cmp si,di
    jnz find_max
    jz end_max
    
    
change_max:
    mov RESTMAX,ax
    jmp return_max
    

end_max:
;********************************************
;********************************************
;find minimum
mov si,0    
mov bx,NUMS[si] ;assuming the first element in the array is the min
mov RESTMIN,bx
add si,bp
find_min:
    mov ax,NUMS[si]
    add si,bp
    cmp RESTMIN,ax
    jge change_min
    return_min:
    cmp si,di
    jnz find_min
    jz end_min
    
    
change_min:
    mov RESTMIN,ax
    jmp return_min
    
end_min:
;********************************************
;********************************************
;average
mov si,00
mov ax,00
mov bx,10 ; count of array's element 

;sum of the array 
sum:
    add ax,NUMS[si]
    add si,bp
    cmp si,di
    jnz sum
    
;average = sum/(length) ---> (dx,ax)/bx   
div bx
mov RESTAVG,ax