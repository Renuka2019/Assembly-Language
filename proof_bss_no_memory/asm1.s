.section .text
.globl main
.type main,@function
main:
    pushl   %esp
    movl    %esp,%ebp

    pushl   $0
    call    exit

    