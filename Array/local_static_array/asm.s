
.section .rodata
    msg_main_print1:
    .string "Enter value of elements in array\n"
    
    msg_main_scan:
    .string "%d"

    msg_main_print_array:
    .string "arr[%d] :%d\t"

    msg_main_malloc_failed:
    .string "out of memory\n"

.section .text
.globl  main
.type main,@function

main:

    pushl   %ebp  
    movl    %esp,%ebp

    subl    $24,%esp


    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp


    movl    $0,-24(%ebp)
    jmp     label_for_cond
label_for_statement:  
    leal    -20(%ebp,%eax,4),%ebx
    pushl   %ebx
    pushl   $msg_main_scan
    call    scanf
    addl    $8,%esp

    addl    $1,-24(%ebp)

label_for_cond:
    movl    -24(%ebp),%eax
    movl    $5,%edx
    cmpl    %edx,%eax
    jl      label_for_statement


    movl    $0,-24(%ebp)
    jmp     label_for_cond2

label_for_statement2:
    movl   -20(%ebp,%eax,4),%edx
    pushl   %edx
    pushl   $msg_main_print_array
    call    printf
    addl    $8,%esp

    addl    $1,-24(%ebp)

label_for_cond2:
    movl    -20(%ebp),%eax
    movl    $5,%edx
    cmpl    %edx,%eax
    jl      label_for_statement2



    pushl   $0
    call    exit    











