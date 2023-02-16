.section .rodata
    msg_main_print1:
    .string "Enter value in obj1 : \n"

     msg_main_print2:
    .string "Enter value in obj2 : \n"


    msg_main_print_obj_char:
    .string "Enter value  of character in object \n"

    msg_main_scan_obj_char:
    .string "%c"

    msg_main_scan_obj2_char:
    .string " %c"

    msg_main_print_obj_int:
    .string "Enter value  of int in object \n"

    msg_main_scan_obj_int:
    .string " %d"
    
    msg_main_print_obj_short_int:
    .string "Enter value  of short int  in object \n"
    
    msg_main_scan_obj_short_int:
    .string "%hd"

    msg_main_print3:
    .string "Values in obj1 are\n"


    msg_main_print5:
    .string "Values in obj2 are\n"


    msg_main_print4:
    .string "obj1.chChar = %c\t obj1.iNo = %d\tobj1.shiNo = %hd\n"

 .section  .bss
    .comm   obj1  12, 4


.section  .text
.globl      main
.type       main,@function

main:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $13,%esp

    pushl   $msg_main_print1
    call    printf
    addl    $4,%esp

    pushl   $msg_main_print_obj_char
    call    printf
    addl    $4,%esp

    movl    $obj1,%ebx 
    pushl   %ebx
    pushl   $msg_main_scan_obj_char
    call    scanf
    addl    $8,%esp

    pushl   $msg_main_print_obj_int
    call    printf
    addl    $4,%esp


    movl    $obj1,%ebx
    leal    4(%ebx),%ebx
    pushl   %ebx
    pushl   $msg_main_scan_obj_int
    call    scanf
    addl    $8,%esp

    pushl   $msg_main_print_obj_short_int
    call    printf
    addl    $4,%esp

                 
    movl    $obj1,%ebx
    leal    8(%ebx),%ebx
    pushl   %ebx
    pushl   $msg_main_scan_obj_short_int
    call    scanf
    addl    $8,%esp

# local variable

    pushl   $msg_main_print2
    call    printf
    addl    $4,%esp

    pushl   $msg_main_print_obj_char
    call    printf
    addl    $4,%esp

    leal    -12(%ebp),%ebx 
    pushl   %ebx
    pushl   $msg_main_scan_obj2_char
    call    scanf
    addl    $8,%esp

    pushl   $msg_main_print_obj_int
    call    printf
    addl    $4,%esp


    leal    -12(%ebp),%ebx
    leal    4(%ebx),%ebx
    pushl   %ebx
    pushl   $msg_main_scan_obj_int
    call    scanf
    addl    $8,%esp

    pushl   $msg_main_print_obj_short_int
    call    printf
    addl    $4,%esp

                 
    leal    -12(%ebp),%ebx
    leal    8(%ebx),%ebx
    pushl   %ebx
    pushl   $msg_main_scan_obj_short_int
    call    scanf
    addl    $8,%esp


    pushl   $msg_main_print3
    call    printf
    addl    $4,%esp

    movl    $obj1,%ebx
    xorl    %eax,%eax
    movb    (%ebx),%al
    movl    4(%ebx),%edx
    xorl    %ecx,%ecx
    movw    8(%ebx),%cx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print4
    call    printf
    addl    $16,%esp


    pushl   $msg_main_print5
    call    printf
    addl    $4,%esp

    leal    -12(%ebp),%ebx
    xorl    %eax,%eax
    movb    (%ebx),%al
    movl    4(%ebx),%edx
    xorl    %ecx,%ecx
    movw    8(%ebx),%cx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print4
    call    printf
    addl    $16,%esp


    pushl   $0
    call    exit



    









    






























   
    