.data
nameMsg:    .asciiz "name: "
ageMsg:     .asciiz "age: "
addressMsg: .asciiz "address: "

name:    .space 30      # Reserve 30 bytes for name
address: .space 50      # Reserve 50 bytes for address

.text
.globl main
main:

    # Print "name: "
    li $v0, 4
    la $a0, nameMsg
    syscall

    # Read name (string)
    la $a0, name        # Address of buffer
    li $a1, 30          # Max length
    li $v0, 8           # Syscall 8 = read string
    syscall

    # Print "age: "
    li $v0, 4
    la $a0, ageMsg
    syscall

    # Read age (integer)
    li $v0, 5
    syscall
    move $t0, $v0       # Store age in $t0

    # Print "address: "
    li $v0, 4
    la $a0, addressMsg
    syscall

    # Read address (string)
    la $a0, address
    li $a1, 50
    li $v0, 8
    syscall

    # Exit
    li $v0, 10
    syscall
