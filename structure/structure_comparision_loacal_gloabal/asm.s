.section .rodata
    msg_main_print1:
    .string "obj1 is \n"

    msg_main_print_obj:
    .string "chChar = %c, iNo = %d,shiNo = %hd\n\n"

    msg_main_print2:
    .string "obj2 is \n"

    msg_main_print3:
    .string "obj3 is \n"

    msg_main_print4:
    .string "obj3 & obj2 comparision is "
   
    msg_main_print5:
    .string "equal\n"

    msg_main_print6:
    .string "not equal\n"



.section .data
    .globl  obj1
    .type   obj1, @object
    .size   obj1,12
    .align  4
    obj1:
        .ascii  "A"
        .zero   3
        .int    10
        .value  20

.section .text   
    .globl  main
    .type   main,@function
    main:
        pushl       %ebp
        movl        %esp,%ebp

        subl        $24,%esp

        movb       $'B',-12(%ebp)
        movl       $30,-8(%ebp)
        movw       $40,-4(%ebp)

        movb       $'B',-24(%ebp)
        movl       $30,-20(%ebp)
        movw       $40,-16(%ebp)

    
        pushl       $msg_main_print1
        call        printf
        addl        $4,%esp


        movl        $obj1,%ebx
        xorl        %eax,%eax
        movb        (%ebx),%al
        movl        4(%ebx),%edx
        xorl        %ecx,%ecx
        movw        8(%ebx),%cx
        pushl       %ecx
        pushl       %edx
        pushl       %eax
        pushl       $msg_main_print_obj
        call        printf
        addl        $16,%esp

        pushl       $msg_main_print2
        call        printf
        addl        $4,%esp
        

        leal        -12(%ebp),%ebx
        xorl        %eax,%eax
        movb        (%ebx),%al
        movl        4(%ebx),%edx
        xorl        %ecx,%ecx
        movw        8(%ebx),%cx
        pushl       %ecx
        pushl       %edx
        pushl       %eax
        pushl       $msg_main_print_obj
        call        printf
        addl        $16,%esp


        pushl       $msg_main_print3
        call       printf
        addl       $4,%esp

        leal        -24(%ebp),%ebx
        xorl        %eax,%eax
        movb        (%ebx),%al
        movl        4(%ebx),%edx
        xorl        %ecx,%ecx
        movw        8(%ebx),%cx
        pushl       %ecx
        pushl       %edx
        pushl       %eax
        pushl       $msg_main_print_obj
        call        printf
        addl        $16,%esp


        pushl      $msg_main_print4
        call       printf
        addl       $4,%esp

        leal      -12(%ebp),%eax
        leal      -24(%ebp),%edx
        xorl       %ecx,%ecx
        xorl       %ebx,%ebx
        movl       (%eax),%ecx
        movl       (%edx),%ebx
        cmpb      %cl,%bl
        jne       label_else

       
        movl      4(%eax),%ecx
        movl      4(%edx),%ebx
        cmpl      %ecx,%ebx
        jne       label_else

        xorl       %ecx,%ecx
        xorl       %ebx,%ebx
        movl      8(%eax),%ecx
        movl      8(%edx),%ebx
        cmpw      %cx,%bx
        jne       label_else

        pushl    $msg_main_print5
        call    printf
        addl    $4,%esp
        jmp     label_exit

     label_else:
        pushl    $msg_main_print6
        call    printf
        addl    $4,%esp
    
    label_exit:
        pushl   $0
        call    exit


        










        

























