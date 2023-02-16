.section .rodata
     msg_fun_print:
    .string "In fun, Number is %d\n"

.section .data
    .globl  g_no
    .type   g_no,@object
    .size   g_no,4
    .align  4
    g_no:
    .int    10

.section .text
.globl fun
.type fun,@function
fun:
    pushl   %ebp
    movl    %esp,%ebp
    
    movl    g_no,%eax
    pushl   %eax
    pushl   $msg_fun_print
    call    printf
    addl    $8,%esp

    movl    %ebp,%esp
    popl    %ebp
    ret

    
