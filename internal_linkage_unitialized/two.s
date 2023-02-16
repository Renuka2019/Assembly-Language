.section .rodata
    msg_fun_print1:
    .string "Enter value\n"

    msg_fun_scan:
    .string "%d"
    
    msg_fun_print2:
    .string "In fun, Number is %d\n"

.section .bss
    .lcomm g_no, 4


.section .text
.globl fun
.type fun,@function
fun:
    pushl   %ebp
    movl    %esp,%ebp

    
    movl    g_no,%eax
    pushl   %eax
    pushl   $msg_fun_print2
    call    printf     # printf("in fun value %d",&ino)
    addl    $8,%esp

    pushl   $msg_fun_print1
    call    printf    # printf("Enter value");
    addl    $4,%esp

    movl    $g_no,%ebx
    pushl   %ebx
    pushl   $msg_fun_scan
    call    scanf
    addl    $8,%esp


    movl    g_no,%eax
    pushl   %eax
    pushl   $msg_fun_print2
    call    printf
    addl    $8,%esp

    movl    %ebp,%esp
    popl    %ebp
    ret

    
