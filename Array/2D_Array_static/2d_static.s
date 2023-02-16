.equ  MAX, 50
.section .rodata
    msg_main_print_value_of_rows_column:
    .string "Enter the vales of rows and column(< %d)\n"

    msg_main_scan_value_of_rows_column:
    .string "%d%d"

    msg_main_print_enter_value:
    .string "Enter arr[%d][%d]\t"

    msg_main_scan_value:
    .string "%d"

    msg_main_print_entered_value:
    .string "Entered value are\n"

    msg_main_print_value:
    .string "iArr[%d][%d]= %d\t"

.section .text
.globl  main 
.type   main,@function
main:
    pushl   %ebp
    movl    %esp,%ebp

    subl    $10016,%esp

    pushl   $MAX
    pushl   $msg_main_print_value_of_rows_column
    call    printf
    addl    $8,%esp

    leal    -4(%ebp),%eax
    leal    -8(%ebp),%edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan_value_of_rows_column
    call    scanf
    addl    $12,%esp

    movl    $0,-12(%ebp)
    jmp     label_for_scan_row_condition
label_for_scan_row_statement:
    movl    $0,-16(%ebp)
    jmp     label_for_scan_column_condition
label_for_scan_column_statement:
    movl    -12(%ebp),%edx
    pushl   %eax
    pushl   %edx
    pushl   $msg_main_print_enter_value
    call    printf
    addl    $12,%esp

    movl    -8(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    -12(%ebp),%edx
    mull    %edx
    leal    -10016(%ebp),%ebx
    addl    %eax,%ebx
    movl    -16(%ebp),%eax
    leal    (%ebx,%eax,4),%edx
    pushl   %edx
    pushl   $msg_main_scan_value
    call    scanf
    addl    $8,%esp

    addl    $1,-16(%ebp)
label_for_scan_column_condition:
    movl    -16(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_scan_column_statement

    addl    $1,-12(%ebp)
label_for_scan_row_condition:
    movl    -12(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_scan_row_statement

    pushl   $msg_main_print_entered_value
    call    printf
    addl    $4,%esp

    movl    $0,-12(%ebp)
    jmp     label_for_print_row_condition

  label_for_print_row_statement:
    movl    $0,-16(%ebp)
    jmp     label_for_print_column_condition
label_for_print_column_statement:
    movl    -8(%ebp),%eax
    movl    $4,%edx
    mull    %edx
    movl    -12(%ebp),%edx
    mull    %edx
    leal    -10016(%ebp),%ebx
    addl    %eax,%ebx
    movl    -16(%ebp),%eax
    movl    (%ebx,%eax,4),%edx
    movl    -12(%ebp),%ecx
    pushl   %edx
    pushl   %ecx
    pushl   %eax
    pushl   $msg_main_print_value
    call    printf
    addl    $16,%esp
    
    addl    $1,-16(%ebp)
label_for_print_column_condition:
    movl    -16(%ebp),%eax
    movl    -8(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_print_column_statement

    addl    $1,-12(%ebp)
label_for_print_row_condition:
    movl    -12(%ebp),%eax
    movl    -4(%ebp),%edx
    cmpl    %edx,%eax
    jl      label_for_print_row_statement
    

    pushl   $0
    call    exit


    
    
    
    
    




