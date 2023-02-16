.section .rodata
    msg_main_print1:
    .string "Enter the value of n1 and n2\n"
    
    msg_main_scan:
    .string "%d%d"
    
    msg_main_print2:
    .string "result is %d\n"

.section .text
.globl  main
.type   main,@function

main:   
    
    #proLogue
    pushl       %ebp
    movl        %esp,%ebp
    
    subl        $8,%esp

    #printf
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


    #bitwise not
    movl        -4(%ebp),%eax
    notl        %eax

    pushl       %eax
    pushl       $msg_main_print2
    call        printf
    addl        $8,%esp


    #bitwise and
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    andl         %edx,%eax

    pushl       %eax
    pushl       $msg_main_print2
    call        printf
    addl        $8,%esp

    #bitwise or
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    orl         %edx,%eax

    pushl       %eax
    pushl       $msg_main_print2
    call        printf
    addl        $8,%esp


    #bitwise xor
    movl        -4(%ebp),%eax
    movl        -8(%ebp),%edx
    xorl         %edx,%eax

    pushl       %eax
    pushl       $msg_main_print2
    call        printf
    addl        $8,%esp

    #bitwise leftshift
    movl        -4(%ebp),%eax
    #movl        -8(%ebp),%edx
    sall         $1,%eax

    pushl       %eax
    pushl       $msg_main_print2
    call        printf
    addl        $8,%esp

    #bitwise  right shift
    movl        -8(%ebp),%eax
    sarl         $1,%eax

    pushl       %eax
    pushl       $msg_main_print2
    call        printf
    addl        $8,%esp


    pushl       $0
    call        exit

    




    










