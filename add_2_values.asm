.data
first:  .asciiz "enter fist number    : "   # String to ask first number
second: .asciiz "enter second number : "   # String to ask second number
out:    .asciiz "output is : "             # Output message
n1: .word 5                                # Integer stored in memory (value = 5)
n2: .word 0                                # Another integer variable (not used)

.text

    lw $t0, n1          # Load value stored at n1 (5) into register $t0
    move $a0, $t0       # Move value from $t0 into $a0 (argument for print)
    li $v0, 1           # Syscall 1 = print integer
    syscall             # Print the integer (prints 5)

    li $v0, 4           # Syscall 4 = print string
    la $a0, first       # Load address of "first" string into $a0
    syscall             # Print "enter fist number :"

    li $v0, 5           # Syscall 5 = read integer
    syscall             # Wait for user input
    move $t0, $v0       # Store user input into $t0

    li $v0, 4           # Print string
    la $a0, second      # Load address of "second" string
    syscall             # Print "enter second number :"

    li $v0, 5           # Read integer
    syscall             # Wait for user input
    move $t1, $v0       # Store second input into $t1

    li $v0, 4           # Print string
    la $a0, out         # Load address of "output is :"
    syscall             # Print output message

    add $t2, $t1, $t0   # Add first and second numbers → store in $t2

    move $a0, $t2       # Move result to $a0 for printing
    li $v0, 1           # Syscall 1 = print integer
    syscall             # Print the result

    li $v0, 10          # Syscall 10 = exit program
    syscall             # Terminate program
