.section .rodata
   msg_main_print1:
   .string "Enter number one\n"

   msg_main_scan:
   .string "%d"

    msg_main_print2:
    .string "In main,number is %d\n"

 .section .bss
    .comm g_no, 4, 4

 .section .text
 .globl main
 .type main,@function
 main:

 pushl   %ebp
 movl    %esp,%ebp   

 pushl   $msg_main_print1
 call    printf
 addl    $4,%esp

 movl    $g_no,%ebx
 pushl   %ebx
 pushl   $msg_main_scan
 call    scanf
 addl    $8,%esp

 movl   g_no,%eax
 pushl  %eax
 pushl  $msg_main_print2
 call   printf
 addl   $8, %esp
 
 call   fun

 movl   g_no,%eax
 pushl  %eax
 pushl  $msg_main_print2
 call   printf
 addl   $8, %esp

pushl   $0
call    exit



