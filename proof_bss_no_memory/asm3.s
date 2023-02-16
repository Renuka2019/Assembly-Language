.section .bss
    .comm arr, 20, 4
.section .text
.globl main
.type main,@function
main:
    pushl   %esp
    movl    %esp,%ebp

    pushl   $0
    call    exit

    