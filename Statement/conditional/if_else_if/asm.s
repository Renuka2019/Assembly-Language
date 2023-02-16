.section .rodata
    msg_main_print1:
    .string "Enter number\n"

    msg_main_scan:
    .string "%d"

    msg_main_less:
    .string "Number is less than 2\n"

    msg_main_greater:
    .string "Number is greater is than 2\n"

    msg_main_equal:
    .string "Number is 2\n"


    .section .text
    .globl main
    .type main,@function
    main:

        pushl   %ebp
        movl    %esp,%ebp

        subl    $4,%esp

        pushl   $msg_main_print1
        call    printf
        addl    $4,%esp


        leal   -4(%ebp),%ebx
        pushl   %ebx
        pushl   $msg_main_scan
        call    scanf
        addl    $8,%esp


        movl    -4(%ebp),%eax
        cmpl    $2,%eax
        jge    label_else_if
        pushl   $msg_main_less
        call    printf
        addl    $4,%esp
        jmp     label_out

    label_else_if:
        je     label_else
        
        pushl   $msg_main_greater
        call    printf
        addl    $4,%esp
        jmp     label_out
        
    label_else:
        pushl   $msg_main_equal
        call    printf
        addl    $4,%esp
        

    label_out:
        pushl $0
        call  exit

       
    






