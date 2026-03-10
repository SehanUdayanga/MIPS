.data 
    input: .asciiz "Input: "
    output: .asciiz "Output: "
    arr: .space 100
.text
main:
    #li $v0,4
    #la $a0,input #print input
    #syscall
    
    #read the String
    li $v0,8
    la $a0,arr
    li $a1,100
    syscall
    
    la $t0,arr #arre asign
    
    loop:
        lb $t1,0($t0)
        beq $t1,$zero,print
        
        addi $t1,$t1,-32
        
        sb $t1,0($t0)
        addi $t0,$t0,1
        
        j loop
    print:
        li $v0,4
        la $a0,arr
        syscall
    
    
    li $v0,10
    syscall
