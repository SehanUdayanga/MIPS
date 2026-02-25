.data
    prompt_count:   .asciiz "Enter number of integers: "
    prompt_input:   .asciiz "Enter integer: "
    min_label:      .asciiz "Minimum: "
    max_label:      .asciiz "Maximum: "
    newline:        .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt_count
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0
    
    ble $t0, 0, exit
    
    li $v0, 4
    la $a0, prompt_input
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    move $t2, $v0
    
    li $t3, 1
    beq $t3, $t0, print_results
    
loop:
    li $v0, 4
    la $a0, prompt_input
    syscall
    
    li $v0, 5
    syscall
    move $t4, $v0
    
    bge $t4, $t1, check_max
    move $t1, $t4
    
check_max:
    ble $t4, $t2, increment
    move $t2, $t4
    
increment:
    addi $t3, $t3, 1
    blt $t3, $t0, loop
    
print_results:
    li $v0, 4
    la $a0, min_label
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
    li $v0, 4
    la $a0, max_label
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall
    
    li $v0, 4
    la $a0, newline
    syscall
    
exit:
    li $v0, 10
    syscall