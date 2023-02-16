.section .rodata
    msg_main_print1:
    .string "Enter number\n"

    msg_main_scan:
    .string "%d"

    msg_main_print2:
    .string "Number is even\n"


.section .text
.globl main
.type main,@function
main:

pushl   %ebp
movl    %esp,%ebp

subl    $4, %esp

pushl   $msg_main_print1
call    printf
addl    $4,%esp

leal    -4(%ebp), %ebx
pushl   %ebx
pushl   $msg_main_scan
call    scanf
addl    $8,%esp


xorl    %eax,%eax
xorl    %edx,%edx
xorl    %ecx,%ecx
movl    -4(%ebp),%eax
movl    $2,%ecx
divl    %ecx

cmpl    $0,%edx
jne     label_final_result

pushl   $msg_main_print2
call    printf
addl    $4,%esp

label_final_result:
pushl   $0
call    exit




