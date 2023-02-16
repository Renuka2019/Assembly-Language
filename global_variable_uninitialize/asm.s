.section .rodata
    msg_main_print:
    .string "%d"

.section .bss
    .comm   g_no, 4, 4  #common memory area

.section .text
    .globl main 
    .type main, @function

main:
pushl    %ebp
movl    %esp,%ebp

movl    g_no,%eax
pushl   %eax
pushl   $msg_main_print
call    printf
addl    $4,%esp

pushl   $0
call    exit
