.equ NULL, 0
.section .rodata
    msg_main_print1:
    .string "Enter Value of n:\t"
    
    msg_main_print2:
    .string "Enter %d value:\t"
    
    msg_main_scan:
    .string "%d"

    msg_main_print3:
    .string "Entered elements are: \n"

    msg_main_print4:
    .string " value %d  :\t%d\n"

    msg_main_malloc_failed:
    .string "Memory allocation FAILED\n"
    
    msg_main_print5:
    .string "malloc value is %d"

.section .data
    .globl pPtr
    .type   pPtr,@object
    .size   pPtr,4
    .align  4
pPtr:
    .int    0
.section .text
.globl  main
.type main,@function

main:

    pushl   %ebp
    movl    %esp,%ebp

    subl    $8,%esp
   
    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp


    leal    -4(%ebp),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

    
    movl    -4(%ebp),%eax
    pushl   $4
    pushl   %eax
    call    calloc
    addl    $8,%esp

    movl    %eax,pPtr

    
    cmpl    $0,%eax
    je      label_malloc_failed 

    movl    $0,-8(%ebp)
    movl    pPtr,%ebx
    pushl   %ebx
    jmp     label_for_cond
label_for_statement:
    
    pushl   %eax
    pushl   $msg_main_print2
    call    printf
    addl    $8,%esp

    movl    -8(%ebp),%eax
    leal    (%ebx,%eax,4),%edx
    pushl   %edx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

    addl    $1,-8(%ebp)

label_for_cond:

    movl    -8(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl     %edx,%eax
    jl      label_for_statement

    popl    %ebx

    pushl   $msg_main_print3
    call    printf
    addl    $4,%esp


    movl    $0,-8(%ebp)
    movl    pPtr,%ebx
    pushl   %ebx
    jmp     label_for_cond2

label_for_statement2:
    movl    -8(%ebp),%eax
    movl    (%ebx,%eax,4),%edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print4
    call    printf
    addl    $12,%esp

    addl    $1,-8(%ebp)
label_for_cond2:
    movl    -8(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_statement2

    popl    %ebx

    movl    pPtr,%ebx
    pushl   %ebx
    call    free
    addl    $4,%esp

    movl    $NULL,pPtr

label_exit:
    pushl   $0
    call    exit

label_malloc_failed:
    pushl   $msg_main_malloc_failed
    call    printf
    addl    $4,%esp

    pushl   $-1
    call    exit












