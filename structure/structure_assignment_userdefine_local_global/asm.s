.section .rodata
    msg_main_print:
    .string "Enter the value of obj2\n"
     
     msg_main_print_enter_char:
     .string "enter chChar\t:"

     msg_main_print_enter_interger:
     .string "enter iNo\t:"
     
     msg_main_print_enter_short_interger:
     .string "Enter shiNo\t:"

    msg_main_scan_char:
     .string "%c"

     msg_main_scan_interger:
     .string "%d"
     
     msg_main_scan_short_interger:
     .string "%hd"

     msg_main_print_obj2:
     .string "obj2 is \n"

     msg_main_print_obj:
     .string "chChar is %c  iNo is %d  shiNo is %hd\n"

    msg_main_print_obj1:
     .string "obj1 is \n"

     msg_main_print_obj3:
     .string "obj3 is \n"

.section .bss
    .comm  obj1,12,4

.section .text   
    .globl  main
    .type   main,@function
    main:
        pushl       %ebp
        movl        %esp,%ebp

        subl        $24,%esp

        pushl       $msg_main_print
        call        printf
        addl        $4,%esp

        pushl       $msg_main_print_enter_char
        call        printf
        addl        $4,%esp

        leal       -12(%ebp),%ebx
        pushl       %ebx
        pushl       $msg_main_scan_char
        call        scanf
        addl        $8,%esp


        pushl       $msg_main_print_enter_interger
        call        printf
        addl        $4,%esp

        leal       -8(%ebp),%ebx
        pushl       %ebx
        pushl       $msg_main_scan_interger
        call        scanf
        addl        $8,%esp

       pushl      $msg_main_print_enter_short_interger
        call        printf
        addl        $4,%esp

        leal       -4(%ebp),%ebx
        pushl       %ebx
        pushl       $msg_main_scan_short_interger
        call        scanf
        addl        $8,%esp

        pushl       $msg_main_print_obj2
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


        movl       $obj1,%ebx
        xorl       %eax,%eax
        movb       -12(%ebp),%al
        movb        %al,(%ebx)
        movl        -8(%ebp),%edx
        movl        %edx,4(%ebx)
        xorl        %ecx,%ecx
        movw        -4(%ebp),%cx
        movw         %cx,8(%ebx)

        pushl       $msg_main_print_obj1
        call        printf
        addl        $4,%esp
        
        movl       $obj1,%ebx
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


        leal       -24(%ebp),%ebx
        xorl       %eax,%eax
        movb       -12(%ebp),%al
        movb        %al,(%ebx)
        movl        -8(%ebp),%edx
        movl        %edx,4(%ebx)
        xorl        %ecx,%ecx
        movw        -4(%ebp),%cx
        movw         %cx,8(%ebx)

        pushl       $msg_main_print_obj3
        call        printf
        addl        $4,%esp
        
        leal       -24(%ebp),%ebx
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
        


        pushl   $0
        call    exit


        





        























         

       
       
       






        

























