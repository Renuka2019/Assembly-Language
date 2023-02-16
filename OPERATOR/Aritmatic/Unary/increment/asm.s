.section .rodata

    msg_main_print:
    .string  "iNo1 = %d\niNo2 = %d\n iAns1 = %d\niAns2 = %d\n"

.section .text
.globl main
.type main,@function

main:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    movl    $10,-4(%ebp)
    movl    $20,-8(%ebp)

    
    movl    -4(%ebp),%eax
    addl    $1,%eax
    movl    %eax, -4(%ebp)
    movl    %eax, -12(%ebp)


    movl    -8(%ebp),%eax
    movl    %eax, -16(%ebp)
    addl    $1, %eax
    movl    %eax,-8(%ebp)
    
    
    movl    -4(%ebp), %edx
    movl    -8(%ebp), %ecx
    movl    -12(%ebp),%ebx
    
    pushl   %eax            #iAns2
    pushl   %ebx            #iAns2
    pushl   %ecx            #iNo2
    pushl   %edx            #iNo1
    pushl   $msg_main_print
    call    printf
    addl    $20,%esp


    pushl   $0
    call    exit

    
