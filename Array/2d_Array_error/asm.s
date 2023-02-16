.section .rodata
    msg_main_print:
    .string "arr[2][3]= %d"


.section .text
.global main
.type main,@function

main:
    pushl   %ebp
    movl    %esp,%ebp

    subl    -48,%esp

    leal    -48(%ebp),%ebx
    movl    $2,%eax
    leal    (%ebx,%eax,16),%ebx
    movl    $3,%eax
    movl    (%ebx,%eax,4),%edx

    pushl   %edx
    pushl   $msg_main_print
    call    printf
    addl    $8,%esp

    pushl   $0
    call    exit


