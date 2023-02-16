.equ MAX1,50
.equ MAX2,5
.section .rodata
    msg_main_print_enter_of_row_column_plane_value:
    .string "Enter values of planes(< %d),rows(< %d), colums(< %d)\n"

    msg_main_scan_row_column_plane_value:
    .string "%d%d%d"

    msg_main_print_enter_value:
    .string "Enter [%d][%d][%d] value\t"

    msg_main_scan_enter_value:
    .string "%d"

    msg_main_print_entered_value:
    .string "Entered elements are\n"

    msg_main_print_value:
    .string "[%d][%d][%d] value is \t%d\n"

    msg_main_print:
    .string "%d %d %d"

.section .text
.globl main
.type main,@function

main:

    pushl   %ebp
    movl    %esp,%ebp

    andl    $-16,%esp

    subl    $5056,%esp


    movl    $msg_main_print_enter_of_row_column_plane_value,(%esp)
    movl    $MAX1,4(%esp)
    movl    $MAX2,8(%esp)
    movl    $MAX2,12(%esp)
    call    printf


    leal    -4(%ebp),%eax
    leal    -8(%ebp),%edx
    leal    -12(%ebp),%ecx
    movl    $msg_main_scan_row_column_plane_value,(%esp)
    movl    %eax,4(%esp)
    movl    %edx,8(%esp)
    movl    %ecx,12(%esp)
    call    scanf


    movl    $0,-16(%ebp)
    jmp     label_for_scan_plan_condition
label_for_scan_plane_statement:
    movl    $0,-20(%ebp)
    jmp     label_for_scan_row_condition
label_for_scan_row_statement:
    movl    $0,-24(%ebp)
    jmp     label_for_scan_column_condition
label_for_scan_column_statement:

    movl    -16(%ebp),%eax
    movl    -20(%ebp),%edx
    movl    -24(%ebp),%ecx
    movl    $msg_main_print_enter_value,(%esp)
    movl    %eax,4(%esp)
    movl    %edx,8(%esp)
    movl    %ecx,12(%esp)
    call    printf


    movl    -12(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    -8(%ebp),%edx
    mull    %edx
    
    movl    -16(%ebp),%edx
    mull    %edx

    leal    -5024(%ebp),%ebx
    addl    %eax,%ebx

    movl    -12(%ebp),%eax
    movl     $4,%edx
    mull    %edx

    movl    -20(%ebp),%edx
    mull    %edx

    addl    %eax,%ebx

    movl    -24(%ebp),%eax
    leal     (%ebx,%eax,4),%ebx
    movl      $msg_main_scan_enter_value,(%esp)
    movl      %ebx,4(%esp)
    call       scanf


    addl    $1,-24(%ebp)    
label_for_scan_column_condition:
    movl    -24(%ebp),%eax
    movl    -12(%ebp),%edx
    cmpl    %edx,%eax
    jl       label_for_scan_column_statement
    addl    $1,-20(%ebp)        
label_for_scan_row_condition:
    movl    -20(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_scan_row_statement
    addl    $1,-16(%ebp)        
label_for_scan_plan_condition:
    movl    -16(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_scan_plane_statement 

    movl    $msg_main_print_entered_value,(%esp)
    call    printf


  movl    $0,-16(%ebp)
    jmp     label_for_print_plan_condition
label_for_print_plane_statement:
    movl    $0,-20(%ebp)
    jmp     label_for_print_row_condition
label_for_print_row_statement:
    movl    $0,-24(%ebp)
    jmp     label_for_print_column_condition
label_for_print_column_statement:

        
    movl    -12(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    -8(%ebp),%edx
    mull    %edx
    
    movl    -16(%ebp),%edx
    mull    %edx

    leal    -5024(%ebp),%ebx
    addl    %eax,%ebx

    movl    -12(%ebp),%eax
    movl     $4,%edx
    mull    %edx

    movl    -20(%ebp),%edx
    mull    %edx

    addl    %eax,%ebx

    movl    -24(%ebp),%eax
    movl     (%ebx,%eax,4),%ebx
    movl    -16(%ebp),%edx
    movl    -20(%ebp),%ecx
    movl     $msg_main_print_value,(%esp)
    movl     %edx,4(%esp)
    movl     %ecx,8(%esp)
    movl     %eax,12(%esp)
    movl     %ebx,16(%esp)
    call     printf


    addl    $1,-24(%ebp)    
label_for_print_column_condition:
    movl    -24(%ebp),%eax
    movl    -12(%ebp),%edx
    cmpl    %edx,%eax
    jl       label_for_print_column_statement
    addl    $1,-20(%ebp)        
label_for_print_row_condition:
    movl    -20(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_print_row_statement
    addl    $1,-16(%ebp)        
label_for_print_plan_condition:
    movl    -16(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_print_plane_statement 





    pushl   $0
    call    exit



    







