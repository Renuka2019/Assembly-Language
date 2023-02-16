.section .rodata
    msg_main_print1:
    .string "Enter value of gno_2 and gno_3 :\n"

    msg_main_scan:
    .string "%d%d"

    msg_main_print2:
    .string "In main, no_1 = %d\t no_2 = %d\t no3 = %d\t \n"

.section .data
    .globl  gno_1
    .type   gno_1,@object
    .size   gno_1,4
    .align  4
    gno_1:
    .int   10              # int gno_1 =10;

.section .bss
    .comm gno_2, 4, 4       # int gno_2;

.section .text
.globl  main
.type   main,@function
main:                       # int main()
    pushl   %ebp
    movl    %esp, %ebp

    subl    $4, %esp         # int no_3;

    pushl   $msg_main_print1
    call    printf           # printf("Enter two numbers\t")
    addl    $4, %esp

    movl    $gno_2, %eax
    leal    -4(%ebp), %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf            # scanf("%d%d",&no_2,&no_3);
    addl    $12,%esp

    movl    gno_1, %eax
    movl    gno_2, %edx
    movl    -4(%ebp),  %ebx 
    pushl   %ebx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print2    #  printf("In main, no_1 = %d\t no_2 = %d\t no3 = %d\t \n",no_1,no_2,no_3);
    call    printf
    addl    $16,%esp

    
    call    fun1                # fun1();
    

    pushl   $0
    call    exit



























    

