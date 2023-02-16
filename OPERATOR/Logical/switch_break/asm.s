.section .rodata
msg_main_print1:
.string "1.Addition\n2.Substraction\n3.Multiplication\n4.Division\n"

msg_main_scan:
.string "%d"

msg_main_print7:
.string " choice is %d"

msg_main_print2:
.string "1.Addition\n"

msg_main_print3:
.string "2.Substraction\n"

msg_main_print4:
.string "3.Multiplication\n"

msg_main_print5:
.string "4.Division\n"

msg_main_print6:
.string "5.wromng option"
.section .text
.globl main
.type main,@function

main:

    pushl   %ebp
    movl     %esp,%ebp

    subl    $4,%esp

    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp


    leal    -4(%ebp),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp


    movl    -4(%ebp),%eax
    cmpl    $1,%eax
    je     label_case_1
    cmpl    $2,%eax
    je      label_case_2
    cmpl    $3,%eax
    je      label_case_3
    cmpl    $4,%eax
    je      label_case_4

    jmp     label_default

 label_case_1:
    pushl   $msg_main_print2
    call    printf
    addl    $4,%esp
    jmp     label_out

label_case_2:
    pushl   $msg_main_print3
    call    printf
    addl    $4,%esp
    jmp     label_out

label_case_3:
    pushl   $msg_main_print4
    call    printf
    addl    $4,%esp
    jmp     label_out


label_case_4:
    pushl   $msg_main_print5
    call    printf
    addl    $4,%esp
    jmp    label_out

label_default:
    pushl   $msg_main_print6
    call    printf
    addl    $4,%esp


label_out:
    pushl   $0
    call    exit








