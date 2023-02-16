.section .rodata
    msg_fun1_print1:
    .string "Enter value of g_no1\n"

    msg_fun1_scan:
    .string "%d"

    msg_fun1_print2:
    .string "In fun1, gno_1 is %d and gno_2 is %d\n"

    msg_fun2_print:
    .string "In static fun2\n"

.section .data
    .type   gno_2, @object
    .size   gno_2, 4
    .align  4
    gno_2:
    .int    40          # static int gno_2 = 40;

.section .bss
    .lcomm gno_1, 4     # static int gno_1;

.section .text
.globl  fun1
.type   fun1, @function  # void fun1()
fun1:
    pushl   %ebp
    movl    %esp, %ebp

    pushl   $msg_fun1_print1
    call    printf            # printf("Enter value of gno_1");
    addl    $4, %esp

    movl    $gno_1, %ebx
    pushl   %ebx
    pushl   $msg_fun1_scan
    call    scanf             # scanf("%d",&no_1);
    addl    $8, %esp

    movl    gno_1, %eax
    movl    gno_2, %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_fun1_print2  #  printf("In fun, no_1 is %d and no_2 is %d\n",no_1,no_2); 
    call    printf
    addl    $12, %esp

    call    fun2               #  fun2();

    movl    %ebp,%esp
    popl    %ebp
    
    ret

.type fun2, @function      # static void fun2()
fun2:
pushl   %ebp
movl    %esp, %ebp

pushl   $msg_fun2_print   # printf("In static fun2");
call    printf
addl    $4,%esp

movl    %ebp,%esp
popl    %ebp
ret














