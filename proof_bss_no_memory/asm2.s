.section .data
    .globl  arr
    .type   arr,@function
    .size   arr,20
    .align  4
    arr:
        .int    10
        .int    20
        .int    30
        .int    40
        .int    50
        #int    10,20,30,40,50



.section .text
.globl main
.type main,@function
main:
    pushl   %esp
    movl    %esp,%ebp

    pushl   $0
    call    exit

    