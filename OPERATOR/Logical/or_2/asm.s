.section .rodata
    msg_main_print1:
    .string "Enter three numbers\n"

    msg_main_scan:
    .string "%d%d%d"

    msg_main_print2:
    .string "iNo1 = %d\niNo2 = %d\niNo3 = %d\niAns = %d\n"

 .section .text
 .globl main
 .type main, @function

 main:
    
    pushl   %ebp
    movl    %esp,%ebp

    subl    $16,%esp

    pushl   $msg_main_print1
    call    printf
    addl    $8,%esp

    leal    -4(%ebp),%eax
    leal    -8(%ebp),%edx
    leal    -12(%ebp),%ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $16,%esp 


    addl    $1, -4(%ebp)
    movl    -4(%ebp),%eax
    cmpl    $0,%eax
    jne      label_or

    movl    -8(%ebp),%eax
    addl    $1,-8(%ebp)
    cmpl    $0,%eax
    je      label_final_result 

    addl    $1, -12(%ebp)
    movl    -12(%ebp),%eax
    cmpl    $0,%eax
    je      label_final_result

label_or:
    movl    $1,%eax       
    

label_final_result:  
    movl    %eax,-16(%ebp)
    movl    -4(%ebp),%edx
    movl    -8(%ebp),%ecx
    movl    -12(%ebp),%ebx
    pushl   %eax
    pushl   %ebx
    pushl   %ecx
    pushl   %edx
    pushl   $msg_main_print2
    call    printf
    addl    $20,%esp

    pushl   $0
    call    exit    









