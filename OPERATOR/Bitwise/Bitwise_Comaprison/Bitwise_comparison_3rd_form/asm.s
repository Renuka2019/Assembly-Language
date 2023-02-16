.section    .rodata
    msg_main_print1:
    .string "Enter value of n1 and n2\n"
    
    msg_main_scan:
    .string "%d%d"

    msg_main_print_less_than:
    .string "%d is less than %d \n"

    msg_main_print_less_than_equal:
    .string "%d is less than equal to %d \n"

    msg_main_print_greater_than_equal:
    .string "%d is greater than equal to %d\n"

    msg_main_print_greater_than:
    .string "%d is greater than %d\n"

    msg_main_print_equal:
    .string "%d is equal to %d\n"

    msg_main_print_not_less_than:
    .string "%d is not less than %d\n"

    msg_main_print_not_less_than_equal:
    .string "%d is not less than equal to %d\n"

    msg_main_print_not_greater_than:
    .string "%d is not greater  than %d\n"

    msg_main_print_not_greater_than_equal:
    .string "%d is not greater than equal to %d\n"

    msg_main_print_not_equal:
    .string "%d is not equal to %d\n"


.section .text
.globl  main
.type   main, @function
main:    

    #proLogue
    pushl       %ebp
    movl        %esp,%ebp

    subl        $9,%esp

    pushl       $msg_main_print1
    call        printf
    addl        $4,%esp

    leal        -4(%ebp),%eax
    leal        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_scan
    call        scanf
    addl        $12,%esp

 
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    call        comparison
    addl        $8,%esp

    movb        %al,-9(%ebp)
  
    andb        $31,%al  
    
    cmpb        $3,%al
    jne         label_else_if

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_less_than
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_less_than_equal
    call        printf
    addl        $12,%esp

   
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_equal
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_greater_than_equal
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_greater_than
    call        printf
    addl        $12,%esp

    jmp         label_out

label_else_if:
    cmpb        $14,%al
    jne         label_else_if_2

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_less_than
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_less_than_equal
    call        printf
    addl        $12,%esp

   
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_equal
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_greater_than_equal
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_greater_than
    call        printf
    addl        $12,%esp

    jmp         label_out

label_else_if_2:
    cmpb        $22,%al
    jne         label_out

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_less_than
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_less_than_equal
    call        printf
    addl        $12,%esp

   
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_not_equal
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_greater_than_equal
    call        printf
    addl        $12,%esp

    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    pushl       %edx
    pushl       %eax
    pushl       $msg_main_print_greater_than
    call        printf
    addl        $12,%esp


 label_out:
    pushl       $0
    call        exit

.globl  comparison
.type   comparison,@function
comparison:

    pushl       %ebp
    movl        %esp,%ebp

    subl        $1,%esp

    movl        8(%ebp),%eax
    movl        12(%ebp),%edx
    cmpl        %edx,%eax
    jne         label_less_if_else
    xorl        %eax,%eax
    orb         $14,%al
    jmp         label_out_camparison

label_less_if_else:
    jg          label_greater_if_else
    xorl        %eax,%eax
    orb         $3,%al
    jmp         label_out_camparison

label_greater_if_else:
    jl          label_out_camparison
    xorl        %eax,%eax
    orb         $22,%al

label_out_camparison:
    movb       %al,-1(%ebp)
    movl        %ebp,%esp
    popl        %ebp
    ret


















