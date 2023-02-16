.section .rodata
    msg_main_print1:
        .string "Enter two numbers\n"

    msg_main_scan:
        .string "%d%d"

    msg_main_print2:
        .string "Sum is %d\n"

    msg_main_print3:
        .string "Difference is %d\n"

.section .text
.globl main
.type main, @function
main:

        pushl       %ebp
        movl        %esp,%ebp

        subl        $16,%esp

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
        leal        -12(%ebp),%ecx
        leal        -16(%ebp),%ebx
        pushl       %ebx
        pushl       %ecx
        pushl       %edx
        pushl       %eax
        call        SumDiff
        addl        $16,%esp

        movl        -12(%ebp),%eax
        pushl       %eax
        pushl       $msg_main_print2
        call        printf
        addl        $8,%esp

        movl        -16(%ebp),%eax
        pushl       %eax
        pushl       $msg_main_print3
        call        printf
        addl        $8,%esp

        pushl       $0
        call        exit

.globl  SumDiff
.type   SumDiff, @function
SumDiff:
    
        pushl       %ebp
        movl        %esp,%ebp   
        
        movl        8(%ebp),%eax
        movl        12(%ebp),%edx
        addl        %edx,%eax
        movl        16(%ebp),%ebx
        movl        %eax,(%ebx)

        movl        8(%ebp),%eax
        movl        12(%ebp),%edx
        subl        %edx,%eax
        movl        20(%ebp),%ebx
        movl        %eax,(%ebx)

        movl        %ebp,%esp
        popl        %ebp
        ret












