.section .rodata
    msg_main_print1:
    .string "1.Addition\n2.Substraction\n3.Multipilcation\n4.Division\n"

    msg_main_scan:
    .string "%d"

    msg_main_print_addition:
    .string "Addition\n"

    msg_main_print_substraction:
    .string "Addition\n"

    msg_main_print_multiplication:
    .string "Multipilcation\n"

    msg_main_print_division:
    .string "Division\n"

    msg_main_print_wrong_option:
    .string "Invalid choice\n"

.section .text
.globl  main  
.type   main,@function

main:

    pushl   %ebp
    movl    %esp,%ebp

    subl    $4,%esp

    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp


    leal    -4(%ebp),%eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp


    movl    -4(%ebp),%eax
    cmpl    $1,%eax
    jne     label_else_if

    pushl   $msg_main_print_addition
    call    printf
    addl    $4,%esp

    jmp     label_out

label_else_if:
    cmpl    $2,%eax
    jne     label_else_if_2

    pushl   $msg_main_print_substraction
    call    printf
    addl    $4,%esp

    jmp     label_out

label_else_if_2:
    cmpl    $3,%eax
    jne     label_else_if_3

    pushl   $msg_main_print_multiplication
    call    printf
    addl    $4,%esp

    jmp     label_out

label_else_if_3:
    cmpl    $4,%eax
    jne     label_else_if_4

    pushl   $msg_main_print_division
    call    printf
    addl    $4,%esp

    jmp     label_out

label_else_if_4:
    pushl   $msg_main_print_wrong_option
    call    printf
    addl    $4,%esp

label_out:
    pushl   $0
    call    exit











