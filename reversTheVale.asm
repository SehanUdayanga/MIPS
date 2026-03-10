.data 
    array: .space 16
    count: .asciiz "count :"
    line: .asciiz "\n"
.text

main:

   # li $v0,4
    #la $a0,count
    #syscall
    
    li $v0,5
	syscall
    move $t2,$v0
	
    
    
    
    la $t0,array # assogn array 
    
    
    
    
    
   # li $t2,4
    li $t1,0
    loopi:
        bge $t1,$t2,done
        li $v0,5
        syscall
        sw $v0,0($t0)
        addi $t0,$t0,4
        addi $t1,$t1,1
        
        j loopi
    
    done:
		
		
	la $t0,array	
    li $t1,0 #loop count
   # li $t2,4 #iteration round
    
    
    loop:
        bge $t1,$t2,end
        lw $a0,0($t0)
        li $v0,1
        syscall
        addi $t1,$t1,1
        addi $t0,$t0,4
        
        j loop
        
    end:
        
        li $v0,10
        syscall
        

