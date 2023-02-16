.equ NULL, 0
.section .rodata
    msg_main_print1:
    .string "Enter number of elements in array\n"
    
    msg_main_scan:
    .string "%d"

    msg_main_print3:
    .string "Addressof malloc is %d\n"

    msg_main_print2:
    .string "enter no of elements in array\n"

    msg_main_malloc_failed:
    .string "out of memory\n"


    msg_main_print_array:
    .string "arr[%d] \t:%d"

.section .text
.globl  main
.type main,@function

main:

    pushl   %ebp
    movl    %esp,%ebp

    subl    $12,%esp

    movl    $0,-8(%ebp)
   
    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp


    leal    -4(%ebp),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

 
    movl    -4(%ebp),%eax
    movl    $4,%edx
    pushl   %edx
    pushl   %eax
    call    malloc
    movl    %eax,-8(%ebp)


    cmpl    $0,%eax
    je      label_malloc_failed 

    pushl   $msg_main_print2
    call    printf
    addl    $4,%esp


    movl    $0,-12(%ebp)
    jmp     label_for_cond
label_for_statement:
    movl    -8(%ebp),%ebx
    leal    (%ebx,%eax,4),%edx
    pushl   %edx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp
    
    addl    $1,-12(%ebp)

label_for_cond:
    movl    -12(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_statement


    movl    $0,-12(%ebp)
    jmp     label_for_cond2

label_for_statement2:
    movl    -8(%ebp),%ebx
    movl    (%ebx,%eax,4),%edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_array
    call    printf
    addl    $8,%esp

    addl    $1,-12(%ebp)
label_for_cond2:
    movl    -12(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_statement2

    movl    -8(%esp),%ebx
    pushl   %ebx
    call    free
    addl    $4,%esp



label_malloc_failed:
    pushl   $msg_main_malloc_failed
    call    printf
    addl    $4,%esp

label_exit:
    pushl   $0
    call    exit    











