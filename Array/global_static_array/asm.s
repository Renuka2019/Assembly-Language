
.equ MAX, 50

.section .rodata
    msg_main_print1:
    .string "Enter value of n(<MAX):\t"

    msg_main_print2:
    .string "Enter %d value:\t"

    msg_main_scan:
    .string "%d"

    msg_main_print3:
    .string "%d value is :\t %d\n"

 .section .data
 .globl  arr1
 .type   arr1,@object
 .size   arr1,20
 .align  4

 arr1:
    .int  10,20,30

.section .bss
.comm   arr2,200,4

.section .text
.globl  main
.type   main,@function
main:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $8,%esp

    movl    $MAX,%eax
    pushl   %eax
    pushl   $msg_main_print1
    call    printf
    addl    $8,%esp

    leal    -4(%ebp),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

    movl    -8(%ebp),%eax
    movl    $0,%eax
    jmp     label_for_arr2_cond
label_for_arr2:
    movl    -8(%ebp),%eax
    pushl   %eax
    pushl   $msg_main_print2
    call    printf
    addl    $8,%esp

    movl    -8(%ebp),%eax
    leal    arr2(,%eax,4),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

    addl    $1,%eax
    movl    %eax,-8(%ebp)
label_for_arr2_cond:
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_arr2

    movl   -8(%ebp),%eax
    movl    $0,%eax
    jmp     label_for_arr1_cond

label_for_arr1:
    movl    -8(%ebp),%eax
    pushl   %eax
    pushl   $msg_main_print2
    call    printf
    addl    $8,%esp

    movl    -8(%ebp),%eax
    leal    arr1(,%eax,4),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

    addl    $1,%eax
    movl    %eax,-8(%ebp)

label_for_arr1_cond:
    cmpl    $3,%eax
    jl      label_for_arr1

    movl   -8(%ebp),%eax
    movl    $0,%eax
    jmp     label_for_arr1_print_cond

label_for_arr1_print:
    movl    arr1(,%eax,4),%edx
    pushl   %edx
    pushl   %eax   
    pushl   $msg_main_print3
    call    printf
    addl    $12,%esp

    addl    $1,%eax
    movl    %eax,-8(%ebp)    

label_for_arr1_print_cond:
    cmpl    $3,%eax
    jl      label_for_arr1_print

    movl   -8(%ebp),%eax
    movl    $0,%eax
    jmp     label_for_arr2_print_cond

label_for_arr2_print:
   
    movl    arr2(,%eax,4),%edx
    pushl   %edx
    pushl   %eax   
    pushl   $msg_main_print3
    call    printf
    addl    $12,%esp

    addl    $1,%eax
    movl    %eax,-8(%ebp)

label_for_arr2_print_cond:
    movl    -4(%esp),%edx
    cmpl    %edx,%eax
    jl      label_for_arr2_print

    pushl   $0
    call    exit


    
















