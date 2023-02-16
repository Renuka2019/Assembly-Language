.section .rodata
    msg_main_print:
    .string "%d\n"

 .section .data
    .globl  g_no
    .type   g_no,@object
    .size   g_no,4
    .align  4
    g_no:
    .int 10

.section .text
.globl main
.type main, @function
main:
    pushl   %ebp
    movl    %esp, %ebp

    movl    g_no,%eax      #value
    pushl   %eax            
    pushl   $msg_main_print  #address
    call    printf
    addl    $8,%esp

    pushl   $0
    call    exit
    
     

